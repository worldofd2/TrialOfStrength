#ifndef MODULE_TRIAL_OF_STRENGTH_INSTANCE_SCRIPT_H
#define MODULE_TRIAL_OF_STRENGTH_INSTANCE_SCRIPT_H

class instance_trial_of_strength : public InstanceMapScript
{
public:
    instance_trial_of_strength() : InstanceMapScript("instance_trial_of_strength", 44) { }

    struct trial_of_strength_InstanceScript : public InstanceScript
    {
        EventMap events;

        bool encounterInProgress;
        uint32 currentWave;

        std::vector<Creature*> waveCreatures;

        trial_of_strength_InstanceScript(Map* map) : InstanceScript(map)
        {
            encounterInProgress = false;
            currentWave = 0;

            events.Reset();
        }

        bool IsWaveCleared() const
        {
            return GetRemainingAlive() == 0;
        }

        bool HasMoreWaves() const
        {
            return GetWaveTemplateForWave(currentWave + 1) ? true : false;
        }

        void SpawnNextWave()
        {
            auto waveTemplate = GetWaveTemplateForWave(currentWave);
            if (!waveTemplate)
            {
                LOG_WARN("module", "Wave template is nullptr.");
                return;
            }

            auto enemies = GetEnemiesFromGroup(waveTemplate->enemyGroup);
            if (enemies.empty())
            {
                LOG_WARN("module", "No enemies found in wave template.");
                return;
            }

            waveCreatures.clear();

            for (auto it = enemies.begin(); it != enemies.end(); ++it)
            {
                auto enemy = (*it);
                auto summon = SpawnNPC(instance, enemy->creatureEntry);

                waveCreatures.push_back(summon);

                summon->SetFaction(FACTION_FRIENDLY);

                MakeEntrance(summon);
            }

            events.ScheduleEvent(TOS_DATA_ENCOUNTER_COMBATANTS_HOSTILE, 5s);
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CHECK_COMPLETE, 10s);
        }

        void MakeEntrance(Creature* creature)
        {
            auto newPos = new Position(271.582, -99.979 + frand(-3, 3), 28.869);

            creature->GetMotionMaster()->MovePoint(0, *newPos);
            creature->SetHomePosition(*newPos);
        }

        void SetCombatantsHostile()
        {
            for (auto it = waveCreatures.begin(); it != waveCreatures.end(); ++it)
            {
                auto creature = *it;

                creature->SetFaction(FACTION_MONSTER);
                creature->SetInCombatWithZone();

                if (auto player = creature->SelectNearestPlayer(100.0f))
                {
                    if(creature->Attack(player, true))
                        creature->GetMotionMaster()->MoveChase(player);
                }
            }
        }

        void Update(uint32 diff) override
        {
            events.Update(diff);

            switch (events.ExecuteEvent())
            {
            case TOS_DATA_ENCOUNTER_IN_PROGRESS:
                SpawnNextWave();
                break;

            case TOS_DATA_ENCOUNTER_COMBATANTS_HOSTILE:
                SetCombatantsHostile();
                break;

            case TOS_DATA_ENCOUNTER_CHECK_COMPLETE:
                CheckCompletion();
                break;
            }
        }

        void CheckCompletion()
        {
            if (IsWaveCleared())
            {
                NotifyPlayers();
                TryRewardPlayers();
            }
            else
            {
                events.RescheduleEvent(TOS_DATA_ENCOUNTER_CHECK_COMPLETE, 2s);
            }
        }

        void NotifyPlayers()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                std::string message = Acore::StringFormatFmt("|cffFFFFFFWave |cff00FF00{}|r |cffFFFFFFcleared!|r", currentWave);

                player->SendSystemMessage(message);
                player->PlayDirectSound(17316 /* RDF Reward Sound */);

                {
                    WorldPacket data(SMSG_NOTIFICATION, (message.size() + 1));
                    data << message;

                    player->SendDirectMessage(&data);
                }
            }
        }

        void TryRewardPlayers()
        {
            auto waveTemplate = GetWaveTemplateForWave(currentWave);
            if (!waveTemplate)
            {
                return;
            }

            if (!waveTemplate->hasReward)
            {
                return;
            }

            auto rewardId = waveTemplate->rewardTemplate;

            if (!rewardId)
            {
                return;
            }

            auto rewardTemplate = GetRewardTemplate(rewardId);

            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                player->AddItem(rewardTemplate->itemEntry, urand(rewardTemplate->countMin, rewardTemplate->countMax));
            }
        }

        void SetData(uint32 dataId, uint32 value) override
        {
            switch (dataId)
            {
            case TOS_DATA_ENCOUNTER_IN_PROGRESS:
                encounterInProgress = value > 0 ? true : false;
                events.ScheduleEvent(TOS_DATA_ENCOUNTER_IN_PROGRESS, 0s);
                break;

            case TOS_DATA_ENCOUNTER_CURRENT_WAVE:
                currentWave = value;
                break;

            case TOS_DATA_ENCOUNTER_RESET:
                ResetEncounter();
                break;
            }
        }

        uint32 GetData(uint32 dataId) const override
        {
            switch (dataId)
            {
            case TOS_DATA_ENCOUNTER_IN_PROGRESS:
                return encounterInProgress;

            case TOS_DATA_ENCOUNTER_CURRENT_WAVE:
                return currentWave;

            case TOS_DATA_ENCOUNTER_CURRENT_WAVE_CLEARED:
                return IsWaveCleared();

            case TOS_DATA_ENCOUNTER_HAS_MORE_WAVES:
                return HasMoreWaves();

            case TOS_DATA_ENCOUNTER_CURRENT_WAVE_REMAINING:
                return GetRemainingAlive();
            }

            return 0;
        }

        bool IsEncounterInProgress() const override
        {
            return encounterInProgress;
        }

        uint32 GetRemainingAlive() const
        {
            if (waveCreatures.empty())
            {
                return 0;
            }

            uint32 count = 0;
            for (auto it = waveCreatures.begin(); it != waveCreatures.end(); ++it)
            {
                auto creature = *it;

                if (!creature)
                {
                    continue;
                }

                if (creature->IsInWorld() &&
                    creature->IsAlive() &&
                    creature->GetMapId() == TOS_MAP_ID /*When creatures are cleaned up they end up on another map, wtf?*/)
                {
                    count++;
                }
            }

            return count;
        }

        void ResetEncounter()
        {
            encounterInProgress = false;
            currentWave = 0;

            for (auto it = waveCreatures.begin(); it != waveCreatures.end(); ++it)
            {
                auto creature = *it;

                if (!creature || !creature->IsInWorld())
                {
                    continue;
                }

                creature->DespawnOrUnsummon();
            }

            waveCreatures.clear();
        }
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new trial_of_strength_InstanceScript(map);
    }
};

#endif // MODULE_TRIAL_OF_STRENGTH_INSTANCE_SCRIPT_H
