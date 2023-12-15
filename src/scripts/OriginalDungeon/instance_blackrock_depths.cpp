/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "GameTime.h"
#include "InstanceScript.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "blackrock_depths.h"
#include "TrialOfStrength.h"

#include <random>

constexpr auto MAX_ENCOUNTER = 6;


enum EventType
{
    TOS_EVENT_TRIAL = 1,
    TOS_EVENT_ENDLESS = 2,
};

enum Timers
{
    TIMER_TOMBOFTHESEVEN = 30000,
    TIMER_TOMB_START     = 1000,
    TIMER_TOMB_RESET     = 15000
};

enum Distances
{
    RADIUS_RING_OF_LAW      = 80,
    DISTANCE_EMPEROR_ROOM   = 125
};

enum PrincessQuests
{
    PRINCESS_QUEST_HORDE        = 4004,
    PRINCESS_QUEST_ALLIANCE     = 4363
};

enum GameObjects
{
    GO_ARENA1               = 161525,
    GO_ARENA2               = 161522,
    GO_ARENA3               = 161524,
    GO_ARENA4               = 161523,
    GO_SHADOW_LOCK          = 161460,
    GO_SHADOW_MECHANISM     = 161461,
    GO_SHADOW_GIANT_DOOR    = 157923,
    GO_SHADOW_DUMMY         = 161516,
    GO_BAR_KEG_SHOT         = 170607,
    GO_BAR_KEG_TRAP         = 171941,
    GO_BAR_DOOR             = 170571,
    GO_TOMB_ENTER           = 170576,
    GO_TOMB_EXIT            = 170577,
    GO_LYCEUM               = 170558,
    GO_SF_N                 = 174745, // Shadowforge Brazier North
    GO_SF_S                 = 174744, // Shadowforge Brazier South
    GO_GOLEM_ROOM_N         = 170573, // Magmus door North
    GO_GOLEM_ROOM_S         = 170574, // Magmus door Soutsh
    GO_THRONE_ROOM          = 170575, // Throne door
    GO_SPECTRAL_CHALICE     = 164869,
    GO_CHEST_SEVEN          = 169243,
};

enum MiscData
{
    SPELL_STONED    = 10255
};

class RestoreAttack : public BasicEvent
{
public:
    RestoreAttack(Creature* boss) : _boss(boss) {}

    bool Execute(uint64 /*execTime*/, uint32 /*diff*/) override
    {
        _boss->SetReactState(REACT_AGGRESSIVE);
        _boss->AI()->SetData(DATA_GOLEM_LORD_ARGELMACH_INIT, DONE);

        if (Unit* victim = _boss->GetVictim())
        {
            _boss->SetTarget(victim->GetGUID());
            _boss->GetMotionMaster()->MoveChase(victim);
        }

        return true;
    }

private:
    Creature* _boss;
};

class instance_blackrock_depths_tos : public InstanceMapScript
{
public:
    instance_blackrock_depths_tos() : InstanceMapScript("instance_blackrock_depths", 230) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_blackrock_depths_InstanceMapScript(map);
    }

    struct instance_blackrock_depths_InstanceMapScript : public InstanceScript
    {
        instance_blackrock_depths_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            SetHeaders(DataHeader);
            ResetEncounter();
        }

        uint32 encounter[MAX_ENCOUNTER];
        std::string str_data;

        ObjectGuid EmperorGUID;
        ObjectGuid PhalanxGUID;
        ObjectGuid MagmusGUID;
        ObjectGuid MoiraGUID;
        ObjectGuid PriestessGUID;
        ObjectGuid IronhandGUID[6];
        ObjectGuid CorenGUID;

        ObjectGuid GoArena1GUID;
        ObjectGuid GoArena2GUID;
        ObjectGuid GoArena3GUID;
        ObjectGuid GoArena4GUID;
        ObjectGuid GoArena4TOSGUID;
        ObjectGuid GoShadowLockGUID;
        ObjectGuid GoShadowMechGUID;
        ObjectGuid GoShadowGiantGUID;
        ObjectGuid GoShadowDummyGUID;
        ObjectGuid GoBarKegGUID;
        ObjectGuid GoBarKegTrapGUID;
        ObjectGuid GoBarDoorGUID;
        ObjectGuid GoTombEnterGUID;
        ObjectGuid GoTombExitGUID;
        ObjectGuid GoLyceumGUID;
        ObjectGuid GoSFSGUID;
        ObjectGuid GoSFNGUID;
        ObjectGuid GoGolemNGUID;
        ObjectGuid GoGolemSGUID;
        ObjectGuid GoThroneGUID;
        ObjectGuid GoChestGUID;
        ObjectGuid GoSpectralChaliceGUID;

        uint32 BarAleCount;
        uint32 GhostKillCount;
        ObjectGuid TombBossGUIDs[7];
        uint32 tombResetTimer;
        uint32 TombTimer;
        uint32 TombEventCounter;
        uint32 OpenedCoofers;
        uint32 IronhandCounter;

        GuidList ArgelmachAdds;
        ObjectGuid ArgelmachGUID;

        EventMap events;

        bool encounterInProgress = false;
        bool waveInProgress = false;
        ToSWaveTemplate* waveTemplate = nullptr;
        std::vector<ToSEndlessWaveTemplate> endlessWaveTemplates;

        uint32 currentWave = 1;
        uint32 totalWaves;
        uint32 currentSubGroup;
        uint32 totalSubGroups;

        bool waveCleared = false;
        bool trialCompleted = false;
        bool cheerPlayed = false;

        EventType eventType;

        std::vector<Creature*> waveCreatures;
        std::vector<ToSCurseTemplate*> curses;
        std::vector<uint32> availableCurseIds;

        Creature* arenaMaster = nullptr;
        bool arenaMasterLeft = false;

        Position* combatantPosStart = new Position(591.407, -162.424, -53.119, 4.915);
        Position* combatantPosEnd = new Position(599.407, -162.424, -53.119, 4.915);

        GameObject* rewardChest = nullptr;
        GameObject* dalaranPortal = nullptr;
        GameObject* rewardBeam = nullptr;

        GameObject* curseCrystal1 = nullptr;
        uint32 curseId1;
        GameObject* curseCrystal2 = nullptr;
        uint32 curseId2;
        GameObject* curseCrystal3 = nullptr;
        uint32 curseId3;

        TempSummon* TempSummonGrimstone = nullptr;
        Position GrimstonePositon = Position(625.559f, -205.618f, -52.735f, 2.609f);
        time_t timeRingFail = 0;
        uint8 arenaMobsToSpawn;
        uint8 arenaBossToSpawn;

        std::vector<ObjectGuid> ArenaSpectators;
        Position CenterOfRingOfLaw = Position(595.289, -186.56);

        ObjectGuid EmperorSenators[5];
        std::vector<ObjectGuid> EmperorSenatorsVector;
        Position EmperorSpawnPos = Position(1380.52, -831, 115);

        void OnPlayerEnter(Player* /* player */) override
        {
            ReplaceMoiraIfSaved(); // In case a player joins the party during the run
            //   SetData(TYPE_RING_OF_LAW, DONE);
        }

        void ReplaceMoiraIfSaved()
        {
            ObjectGuid* GUIDToReplace = &PriestessGUID; // default to having Moira
            ObjectGuid* GUIDToSpawn = &MoiraGUID;
            uint32      NPCEntry = NPC_MOIRA;
            bool        MoiraSaved = true;

            // check if all players saved her.
            Map::PlayerList const& lPlayers = instance->GetPlayers();
            if (!lPlayers.IsEmpty())
            {
                for (Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
                {
                    if (Player* player = itr->GetSource())
                    {
                        // set to false if this player hasn't saved her. Another player can't put it to true.
                        MoiraSaved = MoiraSaved && ((player->GetQuestStatus(PRINCESS_QUEST_HORDE) == QUEST_STATUS_REWARDED)
                            || (player->GetQuestStatus(PRINCESS_QUEST_ALLIANCE) == QUEST_STATUS_REWARDED));
                    }
                }
            }

            // assign correct GUIDs and spawn targets
            if (MoiraSaved)
            {
                GUIDToReplace = &MoiraGUID;
                GUIDToSpawn = &PriestessGUID;
                NPCEntry = NPC_PRIESTESS;
            }

            if (Creature* CreatureToReplace = instance->GetCreature(*GUIDToReplace))
            {
                Creature* NewSpawn = instance->SummonCreature(NPCEntry, CreatureToReplace->GetPosition());
                CreatureToReplace->RemoveFromWorld();
                *GUIDToSpawn = NewSpawn->GetGUID();
            }
        }

        void Initialize() override
        {
            memset(&encounter, 0, sizeof(encounter));

            BarAleCount = 0;
            GhostKillCount = 0;
            TombTimer = TIMER_TOMB_START;
            TombEventCounter = 0;
            tombResetTimer = 0;
            OpenedCoofers = 0;
            IronhandCounter = 0;
            ArenaSpectators.clear();

            // these are linked to the dungeon and not how many times the arena started.
            arenaMobsToSpawn = urand(0, 5);
            arenaBossToSpawn = urand(0, 5);
        }

        void SelectedCurse(uint32 curseId) {
            AddCurse(curseId);
            RemoveAvailableCurse(curseId);
            DespawnCurseCrystals();
        }

        void AddCurse(uint32 curseId)
        {
            auto it = sToSMapMgr->CurseTemplates.find(curseId);
            if (it == sToSMapMgr->CurseTemplates.end())
            {
                LOG_WARN("module", "Tried to add curse {} to creature curses but it does not exist.", curseId);
                return;
            }

            auto curse = sToSMapMgr->GetCurseById(curseId);
            if (!curse)
            {
                return;
            }

            curses.push_back(curse);
        }

        bool IsSubWaveCleared() const
        {
            return waveInProgress && GetRemainingAlive() == 0;
        }

        bool IsWaveCleared() const
        {
            return waveCleared;
        }

        bool HasMoreWaves() const
        {
            return currentWave < totalWaves ? true : false;
        }

        bool IsWaveInProgress() const
        {
            return waveInProgress;
        }

        void SpawnNextWave()
        {
            std::vector<ToSCreature> enemies;
            if (eventType == TOS_EVENT_TRIAL)
            {
                if (!waveTemplate)
                {
                    LOG_WARN("module", "Wave template is nullptr.");
                    return;
                }

                enemies = sToSMapMgr->GetEnemiesFromGroup(waveTemplate->enemyGroup, currentSubGroup);
                if (enemies.empty())
                {
                    LOG_WARN("module", "No enemies found in wave template.");
                    return;
                }
            }
            else
            {
                if (endlessWaveTemplates.empty())
                {
                    LOG_WARN("module", "Endless wave template is empty.");
                    return;
                }
                for (auto v : endlessWaveTemplates) {
                    ToSCreature creature{};
                    creature.creatureEntry = v.creatureEntry;
                    enemies.push_back(creature);
                }
            }
            

            waveCleared = false;
            CleanupCreatures();
            ApplyCursesToPlayers();

            uint32 i = 0;

            for (auto it = enemies.begin(); it != enemies.end(); ++it)
            {
                auto enemy = (*it);

                auto diff = sToSMapMgr->LinearDistribution(-4, 4, enemies.size(), i);

                Position tempPos(combatantPosStart->GetPositionX(), combatantPosStart->GetPositionY() + diff, combatantPosStart->GetPositionZ(), combatantPosStart->GetOrientation());

                auto summon = sToSMapMgr->SpawnNPC(enemy.creatureEntry, instance, &tempPos);

                ApplyCurses(summon);

                summon->SetPhaseMask(2, true);

                waveCreatures.push_back(summon);

                if (currentSubGroup == 1)
                    summon->SetFaction(FACTION_FRIENDLY);

                summon->CastSpell(summon, TOS_SPELL_TELEPORT_VISUAL);
                MakeEntrance(summon, diff);

                i++;
            }

            events.ScheduleEvent(TOS_DATA_ENCOUNTER_COMBATANTS_HOSTILE, 5s);
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CHECK_WAVE_COMPLETE, 10s);
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CHECK_FAILURE, 5s);
        }

        void MakeEntrance(Creature* creature, float diff)
        {
            Position tempPos(combatantPosEnd->GetPositionX(), combatantPosEnd->GetPositionY() + diff, combatantPosEnd->GetPositionZ(), combatantPosEnd->GetOrientation());
            creature->GetMotionMaster()->MovePoint(0, tempPos);
            creature->SetHomePosition(*combatantPosEnd);
        }


        void ApplyCurses(Unit* unit)
        {
            if (!unit ||
                curses.empty())
            {
                return;
            }

            for (auto const& curse : curses)
            {
                if (unit->ToPlayer() &&
                    curse->type == TOS_CURSE_TYPE_PLAYER &&
                    !unit->HasAura(curse->aura))
                {
                    unit->AddAura(curse->aura, unit);
                    continue;
                }

                if (!unit->ToPlayer() &&
                    curse->type == TOS_CURSE_TYPE_ENEMY &&
                    !unit->HasAura(curse->aura))
                {
                    unit->AddAura(curse->aura, unit);
                    continue;
                }
            }
        }

        void ApplyCursesToPlayers()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                ApplyCurses(player);
            }
        }

        void ClearCursesFromPlayers()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                {
                    continue;
                }

                sToSMapMgr->ClearCurses(player);
            }
        }

        void SpawnCurseCrystals()
        {
            // Crystal 1
            Position* tempPos = new Position(598.427, -193.308, -54.090, 3.417);
            if ((curseCrystal1 = instance->SummonGameObject(TOS_GOB_CURSE, *tempPos, 0.0, 0.0, 0.0, 0.0, 0, true)))
            {
                curseCrystal1->SetPhaseMask(2, true);
            }
            
            // Crystal 2
            tempPos = new Position(592.718, -190.003, -54.101, 3.417);
            if ((curseCrystal2 = instance->SummonGameObject(TOS_GOB_CURSE, *tempPos, 0.0, 0.0, 0.0, 0.0, 0, true)))
            {
                curseCrystal2->SetPhaseMask(2, true);
            }

            // Crystal 3
            tempPos = new Position(596.132, -183.018, -54.090, 3.417);
            if ((curseCrystal3 = instance->SummonGameObject(TOS_GOB_CURSE, *tempPos, 0.0, 0.0, 0.0, 0.0, 0, true)))
            {
                curseCrystal3->SetPhaseMask(2, true);
            }
        }

        void DespawnCurseCrystals()
        {
            if (curseCrystal1)
            {
                curseCrystal1->Delete();
                curseCrystal1 = nullptr;
            }

            if (curseCrystal2)
            {
                curseCrystal2->Delete();
                curseCrystal2 = nullptr;
            }

            if (curseCrystal3)
            {
                curseCrystal3->Delete();
                curseCrystal3 = nullptr;
            }
        }

        uint32 GetCurseForGUID(ObjectGuid guid)
        {
            if (curseCrystal1 &&
                guid == curseCrystal1->GetGUID())
            {
                return curseId1;
            }

            if (curseCrystal2 &&
                guid == curseCrystal2->GetGUID())
            {
                return curseId2;
            }

            if (curseCrystal3 &&
                guid == curseCrystal3->GetGUID())
            {
                return curseId3;
            }

            return 0;
        }

        uint32 GetCurseScaling()
        {
            uint32 total = 0;

            for (const auto& curse : curses)
            {
                total += curse->difficulty;
            }

            return total;
        }

        void ReloadCurses()
        {
            availableCurseIds.clear();

            for (auto const& curseTemplate : sToSMapMgr->CurseTemplates)
            {
                const ToSCurseTemplate* curse = &curseTemplate.second;
                availableCurseIds.push_back(curse->id);
            }
        }

        uint32 GetRandomAvailableCurse() const
        {
            if (availableCurseIds.size() < 1)
            {
                return 0;
            }

            auto index = urand(0, availableCurseIds.size() - 1);
            auto curseId = availableCurseIds.at(index);

            if (!curseId)
            {
                return 0;
            }

            return curseId;
        }


        void RemoveAvailableCurse(uint32 curseId)
        {
            uint32 i = 0;
            for (const auto& curse : availableCurseIds)
            {
                if (curse == curseId)
                {
                    availableCurseIds.erase(availableCurseIds.begin() + i);
                }

                i++;
            }
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
                    if (creature->Attack(player, true))
                        creature->GetMotionMaster()->MoveChase(player);
                }
            }
        }

        void PlayCrowd()
        {
            if (IsEncounterInProgress() && IsWaveCleared() && !cheerPlayed)
            {
                instance->PlayDirectSoundToMap(TOS_SOUND_CHEER);
                cheerPlayed = true;
            }
        }


        void CheckArenaMasterRelocate()
        {
            if (!arenaMaster)
            {
                return;
            }

            if (!IsEncounterInProgress())
            {
                return;
            }

            if (IsWaveInProgress() && !arenaMasterLeft)
            {
                RelocateArenaMaster(false);
                arenaMasterLeft = true;
                return;
            }

            if (!IsWaveInProgress() && arenaMasterLeft)
            {
                RelocateArenaMaster(true);
                arenaMasterLeft = false;
                return;
            }
        }

        void RelocateArenaMaster(bool returning)
        {
            if (!arenaMaster || !arenaMaster->IsInWorld())
            {
                return;
            }

            arenaMaster->CastSpell(arenaMaster, TOS_SPELL_TELEPORT_VISUAL);

            if (returning)
            {
                arenaMaster->NearTeleportTo(603.344, -187.545, -54.150, 3.331);
                arenaMaster->SetPhaseMask(2, true);
            }
            else
            {
                arenaMaster->NearTeleportTo(555.027, -199.009, -38.3646, 0.285);
                arenaMaster->SetPhaseMask(2, true);
            }
        }

        void TryResurrectPlayers()
        {
            ResurrectPlayers();

            if (sConfigMgr->GetOption<bool>("TrialOfStrength.ResetCooldowns", true))
            {
                ResetPlayerCooldowns();
            }
        }

        void TryTeleportPlayers()
        {
            Position portalCenter(187.469, -135.381, 18.529, 0.0);

            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                auto distance = player->GetPosition().GetExactDist(portalCenter);
                if (distance > 1.0 ||
                    !player->IsAlive())
                {
                    continue;
                }

                if (IsEncounterInProgress() && IsWaveInProgress())
                {
                    player->SendSystemMessage("You cannot enter while an encounter is in progress.");
                    continue;
                }

                player->TeleportTo(TOS_MAP_ID, 629.948, -179.466, -52.732, 3.137);
                player->SetPhaseMask(2, true);
            }
        }

        bool AnyPlayerAlive()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                if (!player->isDead())
                {
                    return true;
                }
            }

            return false;
        }

        bool AnyPlayerInArena(bool checkAlive)
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                if (player->GetDistance2d(CenterOfRingOfLaw.GetPositionX(), CenterOfRingOfLaw.GetPositionY()) < (float)RADIUS_RING_OF_LAW)
                {
                    if (checkAlive)
                    {
                        if (player->IsAlive())
                        {
                            return true;
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        void ResurrectPlayers()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                if (player->isDead())
                {
                    player->ResurrectPlayer(100, false);

                    if (player->HasCorpse())
                    {
                        player->RemoveCorpse();
                    }
                }
            }
        }

        bool CheckFailure()
        {
            // Check if any alive in the arena.
            if (AnyPlayerInArena(true))
            {
                return false;
            }

            if (eventType == TOS_EVENT_TRIAL) {
                NotifyFailure();
                ResetEncounter();

                return true;
            }
            else
            {
                AnnounceCompletion();
                events.ScheduleEvent(TOS_DATA_ENCOUNTER_TRY_RESURRECT, 7s);

                ResetEncounter();
                PopulateRewardChest();

                return true;
            }
        }

        void NotifyFailure()
        {
            std::string message = Acore::StringFormatFmt("|cffFF9900Trial of Strength Failed!|r", currentWave);
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                player->SendSystemMessage(message);
                player->PlayDirectSound(TOS_SOUND_FAIL);

                {
                    WorldPacket data(SMSG_NOTIFICATION, (message.size() + 1));
                    data << message;

                    player->SendDirectMessage(&data);
                }
            }
        }

        void SetupTrialEncounter()
        {
            eventType = TOS_EVENT_TRIAL;
            encounterInProgress = true;
            waveInProgress = true;
            waveCleared = false;

            waveTemplate = sToSMapMgr->GetWaveTemplateForWave(currentWave);
            if (!waveTemplate)
            {
                LOG_WARN("module", "Wave template is nullptr.");
                return;
            }

            totalWaves = sToSMapMgr->GetTotalWaves();

            currentSubGroup = 1;
            auto subGroups = sToSMapMgr->GetSubGroups(waveTemplate->enemyGroup);
            totalSubGroups = subGroups.size();

            if (totalSubGroups < 1)
            {
                LOG_WARN("module", "There were no subgroups found for wave {}.", currentWave);
                return;
            }

            instance->PlayDirectSoundToMap(TOS_SOUND_HORN);

            CleanupCreatures();
            CleanupGameObjects();
            DespawnCurseCrystals();

            events.ScheduleEvent(TOS_DATA_ENCOUNTER_START_NEXT_WAVE, 3s);
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CROWD, 1s);
        }

        void SetupEndlessEncounter()
        {
            eventType = TOS_EVENT_ENDLESS;
            encounterInProgress = true;
            waveInProgress = true;
            waveCleared = false;

            endlessWaveTemplates = sToSMapMgr->GetRandomWavesForEndless(currentWave);
            if (endlessWaveTemplates.empty())
            {
                LOG_WARN("module", "Endless Wave template is empty.");
                return;
            }

            totalWaves = 999;

            currentSubGroup = 1;

            //TODO: create random subgroups too to spice things up
            totalSubGroups = 1;

            instance->PlayDirectSoundToMap(TOS_SOUND_HORN);

            CleanupCreatures();
            CleanupGameObjects();
            DespawnCurseCrystals();

            events.ScheduleEvent(TOS_DATA_ENCOUNTER_START_NEXT_WAVE, 3s);
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CROWD, 1s);
        }

        void CheckWaveCompletion()
        {
            if (!IsSubWaveCleared())
            {
                events.RescheduleEvent(TOS_DATA_ENCOUNTER_CHECK_WAVE_COMPLETE, 2s);
                return;
            }

            if (currentSubGroup < totalSubGroups)
            {
                currentSubGroup++;

                instance->PlayDirectSoundToMap(TOS_SOUND_HORN);
                events.ScheduleEvent(TOS_DATA_ENCOUNTER_START_NEXT_WAVE, 3s);
            }
            else
            {
                if (eventType == TOS_EVENT_TRIAL)
                {
                    NotifyPlayers();
                    PopulateRewardChest();
                    CleanupCreatures();

                    if (sConfigMgr->GetOption<bool>("TrialOfStrength.ResetCooldowns", true))
                    {
                        ResetPlayerCooldowns();
                    }

                    waveInProgress = false;
                    waveCleared = true;
                    cheerPlayed = false;

                    if (currentWave == totalWaves)
                    {
                        trialCompleted = true;
                        AnnounceCompletion();

                        Position* tempPos = new Position(591.407, -162.424, -53.119, 4.915);
                        dalaranPortal = instance->SummonGameObject(TOS_GO_PORTAL_TO_DALARAN, tempPos->GetPositionX(), tempPos->GetPositionY(), tempPos->GetPositionZ(), tempPos->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 86400);
                        dalaranPortal->SetPhaseMask(2, true);
                    }
                    else
                    {
                        SpawnCurseCrystals();
                    }
                }
                else {
                    NotifyPlayers();
                    CleanupCreatures();
                    //TODO: make mobs slightly stronger each wave
                    endlessWaveTemplates = sToSMapMgr->GetRandomWavesForEndless(currentWave);
                    if (endlessWaveTemplates.empty())
                    {
                        LOG_WARN("module", "Endless wave template is empty.");
                        return;
                    }
                    currentWave++;
                    currentSubGroup = 1;
                    //TODO: later
                    totalSubGroups = 1;

                    instance->PlayDirectSoundToMap(TOS_SOUND_HORN);
                    events.ScheduleEvent(TOS_DATA_ENCOUNTER_START_NEXT_WAVE, 10s);

                }
                
            }
        }

        void ResetPlayerCooldowns()
        {
            Map::PlayerList const& players = instance->GetPlayers();

            for (const auto& it : players)
            {
                Player* player = it.GetSource();

                if (!player)
                    continue;

                if (player->HasAura(TOS_SPELL_EXHAUSTION))
                {
                    player->RemoveAura(TOS_SPELL_EXHAUSTION);
                }

                sToSMapMgr->ResetCooldowns(player);
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

        void PopulateRewardChestForTrial(uint32 rewardId)
        {
            Position* tempPos = new Position(597.801, -188.556, -54.141, 3.350);
            if ((rewardChest = instance->SummonGameObject(TOS_GOB_REWARD_CHEST, *tempPos, 0.0, 0.0, 0.0, 0.0, 0, true)))
            {
                rewardChest->SetPhaseMask(2, true);
                rewardChest->loot.clear();
                rewardChest->SetLootRecipient(instance);

                rewardChest->loot.items.reserve(MAX_NR_LOOT_ITEMS);

                auto rewardTemplates = sToSMapMgr->GetRewardTemplates(rewardId);
                if (!rewardTemplates)
                {
                    LOG_ERROR("module", "Failed to find trial of strength reward templates!");
                    return;
                }

                for (auto rewardTemplate = rewardTemplates->begin(); rewardTemplate != rewardTemplates->end(); ++rewardTemplate)
                {
                    uint32 chance = urand(0, 100);
                    if (chance > rewardTemplate->chance)
                    {
                        continue;
                    }

                    LootStoreItem* lootStoreItem = new LootStoreItem(rewardTemplate->itemEntry, 0, 0, false, 1, 0, 1, 1);

                    LootItem lootItem(*lootStoreItem);
                    lootItem.itemIndex = rewardChest->loot.items.size();
                    lootItem.itemid = rewardTemplate->itemEntry;
                    lootItem.follow_loot_rules = true;
                    lootItem.freeforall = false;

                    uint32 itemCount = urand(rewardTemplate->countMin, rewardTemplate->countMax);
                    if (rewardTemplate->curseScalar)
                    {
                        itemCount = itemCount + ((GetCurseScaling() / 100) * rewardTemplate->curseScalar);
                    }

                    // hard cap the item count.
                    lootItem.count = itemCount > rewardTemplate->countCap ? rewardTemplate->countCap : itemCount;

                    rewardChest->loot.unlootedCount += 1;

                    rewardChest->loot.items.push_back(lootItem);
                }

                uint32 minMoney = sConfigMgr->GetOption<uint32>("TrialOfStrength.MinRewardMoney", 5000);
                uint32 maxMoney = sConfigMgr->GetOption<uint32>("TrialOfStrength.MaxRewardMoney", 10000);

                if (sConfigMgr->GetOption<bool>("TrialOfStrength.Scaling.RewardMoney", true))
                {
                    uint32 scalar = sConfigMgr->GetOption<uint32>("TrialOfStrength.Scaling.RewardMoneyScalar", 50);
                    uint32 curseScaling = 1 + (GetCurseScaling() / scalar);

                    minMoney = minMoney * curseScaling;
                    maxMoney = maxMoney * curseScaling;
                }

                uint32 capMoney = sConfigMgr->GetOption<uint32>("TrialOfStrength.CapRewardMoney", 1000000);

                minMoney = minMoney > capMoney ? capMoney : minMoney;
                maxMoney = maxMoney > capMoney ? capMoney : maxMoney;

                rewardChest->loot.generateMoneyLoot(minMoney, maxMoney);

                rewardChest->SetLootGenerationTime();
                rewardChest->SetLootState(GO_READY);
            }

            rewardBeam = instance->SummonGameObject(TOS_GOB_REWARD_BEAM, *tempPos, 0.0, 0.0, 0.0, 0.0, 0, true);
            rewardBeam->SetPhaseMask(2, true);
        }

        void PopulateRewardChest()
        {
            if (eventType == TOS_EVENT_TRIAL)
            {
                if (!waveTemplate->hasReward)
                {
                    return;
                }

                auto rewardId = waveTemplate->rewardTemplate;

                if (!rewardId)
                {
                    return;
                }
                PopulateRewardChestForTrial(rewardId);
            }
            else {
                //TODO:
            }
           
        }

        bool IsRewardChestEmpty() const
        {
            if (!rewardChest || !rewardChest->IsInWorld())
            {
                return true;
            }

            return rewardChest->loot.unlootedCount < 1;
        }

        bool IsEncounterInProgress() const
        {
            return InstanceScript::IsEncounterInProgress() || encounterInProgress;
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

        void CleanupCreatures()
        {
            if (waveCreatures.empty())
            {
                return;
            }

            for (auto it = waveCreatures.begin(); it != waveCreatures.end(); ++it)
            {
                auto creature = *it;

                if (!creature ||
                    !creature->IsInWorld() ||
                    creature->GetMapId() != TOS_MAP_ID)
                {
                    continue;
                }

                creature->DespawnOrUnsummon();
            }

            waveCreatures.clear();
        }

        void CleanupGameObjects()
        {
            if (rewardBeam &&
                rewardBeam->IsInWorld())
            {
                rewardBeam->Delete();
                rewardBeam = nullptr;
            }

            if (rewardChest &&
                rewardChest->IsInWorld())
            {
                rewardChest->Delete();
                rewardChest = nullptr;
            }

            if (dalaranPortal && dalaranPortal->IsInWorld()) {
                dalaranPortal->Delete();
                dalaranPortal = nullptr;
            }
        }

        void ResetEncounter()
        {
            encounterInProgress = false;
            waveInProgress = false;
            cheerPlayed = false;

            currentWave = 1;
            totalWaves = 0;
            currentSubGroup = 1;
            totalSubGroups = 0;

            waveCleared = false;
            trialCompleted = false;

            events.Reset();
            events.ScheduleEvent(TOS_DATA_ENCOUNTER_CHECK_ARENA_MASTER_RELOCATE, 2s);
            events.ScheduleEvent(TOS_DATA_PORTAL_TRY_TELEPORT, 1s);

            CleanupCreatures();
            CleanupGameObjects();
            DespawnCurseCrystals();

            Position* tempPos = new Position(591.407, -162.424, -53.119, 4.915);
            dalaranPortal = instance->SummonGameObject(TOS_GO_PORTAL_TO_DALARAN, tempPos->GetPositionX(), tempPos->GetPositionY(), tempPos->GetPositionZ(), tempPos->GetOrientation(), 0.0f, 0.0f, 0.0f, 0.0f, 86400);
            dalaranPortal->SetPhaseMask(2, true);

            
            /*
            HandleGameObject(GoArena4TOSGUID, true);
            HandleGameObject(DATA_ARENA3, false);
            HandleGameObject(DATA_ARENA2, false);
            HandleGameObject(DATA_ARENA1, false);
            */

            ClearCursesFromPlayers();

            curses.clear();
            ReloadCurses();

            if (arenaMasterLeft)
            {
                RelocateArenaMaster(true);
                arenaMasterLeft = false;
            }
        }

        void AnnounceCompletion()
        {
            bool hasCurses = curses.size() > 0;

            std::stringstream ss;
            ss << "|TInterface\\WorldMap\\Skull_64Red:16|t |cffFFFFFFCongratulations to player(s) ";

            Map::PlayerList const& players = instance->GetPlayers();
            auto playerCount = players.getSize();

            uint32 i = 0;
            for (const auto& it : players)
            {
                i++;

                Player* player = it.GetSource();

                if (!player)
                {
                    continue;
                }

                ss << Acore::StringFormatFmt("{}{}", sToSMapMgr->GetHexColorFromClass(player->getClass()), player->GetName());

                if (i != playerCount)
                {
                    ss << "|cffFFFFFF, ";
                }
            }
            if (eventType== TOS_EVENT_TRIAL)
            {
                ss << Acore::StringFormatFmt(" |cffFFFFFFfor defeating all waves ({}) in the |cffFF2651Trial of Strength", sToSMapMgr->GetTotalWaves());
            }
            else
            {
                ss << Acore::StringFormatFmt(" |cffFFFFFFfor defeating ({}) waves in the |cffFF2651Trial of Strength", currentWave);
            }
            
            if (hasCurses)
            {
                ss << Acore::StringFormatFmt(" |cffFFFFFFwith |cffC436C1{}|cffFFFFFF curses!|r", curses.size());
            }
            else
            {
                ss << "!|r";
            }

            sWorld->SendServerMessage(SERVER_MSG_STRING, ss.str());
        }

        /* END TOS */


        void OnCreatureCreate(Creature* creature) override
        {
            switch (creature->GetEntry())
            {
                case TOS_NPC_ARENA_MASTER:
                    arenaMaster = creature;
                    break;
                case NPC_EMPEROR:
                    EmperorGUID = creature->GetGUID();
                    break;
                case NPC_PHALANX:
                    PhalanxGUID = creature->GetGUID();
                    break;
                case NPC_MOIRA:
                    MoiraGUID = creature->GetGUID();
                    break;
                case NPC_COREN_DIREBREW:
                    CorenGUID = creature->GetGUID();
                    break;
                case NPC_ANGERREL:
                    TombBossGUIDs[0] = creature->GetGUID();
                    break;
                case NPC_SEETHREL:
                    TombBossGUIDs[1] = creature->GetGUID();
                    break;
                case NPC_DOPEREL:
                    TombBossGUIDs[2] = creature->GetGUID();
                    break;
                case NPC_GLOOMREL:
                    TombBossGUIDs[3] = creature->GetGUID();
                    break;
                case NPC_VILEREL:
                    TombBossGUIDs[4] = creature->GetGUID();
                    break;
                case NPC_HATEREL:
                    TombBossGUIDs[5] = creature->GetGUID();
                    break;
                case NPC_DOOMREL:
                    TombBossGUIDs[6] = creature->GetGUID();
                    break;
                case NPC_MAGMUS:
                    MagmusGUID = creature->GetGUID();
                    if (!creature->IsAlive())
                        HandleGameObject(GoThroneGUID, true); // if Magmus is dead open door to last boss
                    break;
                case NPC_WEAPON_TECHNICIAN:
                case NPC_DOOMFORGE_ARCANASMITH:
                case NPC_RAGEREAVER_GOLEM:
                case NPC_WRATH_HAMMER_CONSTRUCT:
                    if (creature->IsAlive() && creature->GetPositionZ() < -51.5f && creature->GetPositionZ() > -55.f)
                    {
                        ArgelmachAdds.push_back(creature->GetGUID());
                    }
                    break;
                case NPC_GOLEM_LORD_ARGELMACH:
                    ArgelmachGUID = creature->GetGUID();
                    break;
                case NPC_IRONHAND_GUARDIAN:
                    IronhandGUID[IronhandCounter] = creature->GetGUID();
                    IronhandCounter++;
                    break;
                case NPC_ARENA_SPECTATOR:
                    ArenaSpectators.push_back(creature->GetGUID());
                    if (encounter[TYPE_RING_OF_LAW] == DONE) // added for crashes
                    {
                        creature->SetFaction(FACTION_NEUTRAL);
                        creature->SetReactState(REACT_DEFENSIVE);
                    }
                    break;
                case NPC_SHADOWFORGE_PEASANT:
                case NPC_SHADOWFORCE_CITIZEN: // both do the same
                    if (creature->GetDistance2d(CenterOfRingOfLaw.GetPositionX(), CenterOfRingOfLaw.GetPositionY()) < (float)RADIUS_RING_OF_LAW)
                    {
                        ArenaSpectators.push_back(creature->GetGUID());
                    }
                    if (encounter[TYPE_RING_OF_LAW] == DONE) // added for crashes
                    {
                        creature->SetFaction(FACTION_NEUTRAL);
                        creature->SetReactState(REACT_DEFENSIVE);
                    }
                    break;
                case NPC_SHADOWFORGE_SENATOR:
                    // keep track of Senators that are not too far from emperor. Can't really use emperor as creature due to him possibly not being spawned.
                    // some senators spawn at ring of law
                    if (creature->GetDistance2d(EmperorSpawnPos.GetPositionX(), EmperorSpawnPos.GetPositionY()) < (float)DISTANCE_EMPEROR_ROOM)
                    {
                        EmperorSenatorsVector.push_back(creature->GetGUID());
                    }
                    break;
                default:
                    break;
            }
        }

        void OnGameObjectCreate(GameObject* go) override
        {
            switch (go->GetEntry())
            {
                case GO_ARENA1:
                    GoArena1GUID = go->GetGUID();
                    break;
                case GO_ARENA2:
                    GoArena2GUID = go->GetGUID();
                    break;
                case GO_ARENA3:
                    GoArena3GUID = go->GetGUID();
                    break;
                case GO_ARENA4:
                    if (go->GetPhaseMask() == 1) {
                        GoArena4GUID = go->GetGUID();
                    }
                    else if (go->GetPhaseMask() == 2) {
                        GoArena4TOSGUID = go->GetGUID();
                    }
                    
                    break;
                case GO_SHADOW_LOCK:
                    GoShadowLockGUID = go->GetGUID();
                    break;
                case GO_SHADOW_MECHANISM:
                    GoShadowMechGUID = go->GetGUID();
                    break;
                case GO_SHADOW_GIANT_DOOR:
                    GoShadowGiantGUID = go->GetGUID();
                    break;
                case GO_SHADOW_DUMMY:
                    GoShadowDummyGUID = go->GetGUID();
                    break;
                case GO_BAR_KEG_SHOT:
                    GoBarKegGUID = go->GetGUID();
                    break;
                case GO_BAR_KEG_TRAP:
                    GoBarKegTrapGUID = go->GetGUID();
                    break;
                case GO_BAR_DOOR:
                    GoBarDoorGUID = go->GetGUID();
                    break;
                case GO_TOMB_ENTER:
                    GoTombEnterGUID = go->GetGUID();
                    break;
                case GO_TOMB_EXIT:
                    GoTombExitGUID = go->GetGUID();
                    if (GhostKillCount >= 7)
                        HandleGameObject(ObjectGuid::Empty, true, go);
                    else
                        HandleGameObject(ObjectGuid::Empty, false, go);
                    break;
                case GO_LYCEUM:
                    GoLyceumGUID = go->GetGUID();
                    break;
                case GO_SF_S:
                    GoSFSGUID = go->GetGUID();
                    break;
                case GO_SF_N:
                    GoSFNGUID = go->GetGUID();
                    break;
                case GO_GOLEM_ROOM_N:
                    GoGolemNGUID = go->GetGUID();
                    break;
                case GO_GOLEM_ROOM_S:
                    GoGolemSGUID = go->GetGUID();
                    break;
                case GO_THRONE_ROOM:
                    GoThroneGUID = go->GetGUID();
                    break;
                case GO_CHEST_SEVEN:
                    GoChestGUID = go->GetGUID();
                    break;
                case GO_SPECTRAL_CHALICE:
                    GoSpectralChaliceGUID = go->GetGUID();
                    break;
            }
        }

        void OnUnitDeath(Unit* unit) override
        {
            uint32 deadSenators = 0;
            switch (unit->GetEntry())
            {
                case NPC_WEAPON_TECHNICIAN:
                case NPC_DOOMFORGE_ARCANASMITH:
                case NPC_RAGEREAVER_GOLEM:
                case NPC_WRATH_HAMMER_CONSTRUCT:
                    ArgelmachAdds.remove(unit->GetGUID());
                    break;
                case NPC_MAGMUS:
                    SetData(TYPE_IRON_HALL, DONE);
                    break;
                case NPC_SHADOWFORGE_SENATOR:
                    deadSenators = 1; //hacky, but we cannot count the unit that just died through its state because OnUnitDeath() is called before the state is set.
                    for (const auto &senatorGUID: EmperorSenatorsVector)
                    {
                        if (Creature* senator = instance->GetCreature(senatorGUID))
                        {
                            if (!senator->IsAlive() || senator->isDying())
                            {
                                deadSenators++;
                            }
                        }
                    }

                    if (Creature* emperor = instance->GetCreature(EmperorGUID))
                    {
                        // send % of senators that died
                        emperor->AI()->SetData(0, (100 * deadSenators) / EmperorSenatorsVector.size());
                    }
                    break;
                case NPC_ANGERREL:
                case NPC_DOPEREL:
                case NPC_HATEREL:
                case NPC_VILEREL:
                case NPC_SEETHREL:
                case NPC_GLOOMREL:
                case NPC_DOOMREL:
                    GhostKillCount++;
                    if (GhostKillCount >= 7)
                    {
                        SetData(TYPE_TOMB_OF_SEVEN, DONE);
                    }
                    break;
                default:
                    break;
            }
        }

        void SetData(uint32 type, uint32 data) override
        {
            LOG_DEBUG("scripts.ai", "Instance Blackrock Depths: SetData update (Type: {} Data {})", type, data);

            switch (type)
            {
                case TOS_DATA_ENCOUNTER_TRIAL_START:
                    events.ScheduleEvent(TOS_DATA_ENCOUNTER_TRIAL_START, 0s);
                    break;
                case TOS_DATA_ENCOUNTER_ENDLESS_START:
                    events.ScheduleEvent(TOS_DATA_ENCOUNTER_ENDLESS_START, 0s);
                    break;

                case TOS_DATA_ENCOUNTER_CURRENT_WAVE:
                    currentWave = data;
                    break;

                case TOS_DATA_ENCOUNTER_SELECTED_CURSE:
                    SelectedCurse(data);
                    break;

                case TOS_DATA_ENCOUNTER_RESET:
                    ResetEncounter();
                    break;
                case TYPE_RING_OF_LAW:
                    encounter[0] = data;
                    switch(data)
                    {
                    case IN_PROGRESS:
                        TempSummonGrimstone = instance->SummonCreature(NPC_GRIMSTONE, GrimstonePositon);
                        break;
                    case FAIL:
                        if (TempSummonGrimstone)
                        {
                            TempSummonGrimstone->RemoveFromWorld();
                            TempSummonGrimstone = nullptr;
                            timeRingFail = GameTime::GetGameTime().count();
                        }
                        SetData(TYPE_RING_OF_LAW, NOT_STARTED);
                        break;
                    case DONE:
                        for (const auto& itr : ArenaSpectators)
                        {
                            if (Creature* spectator = instance->GetCreature(itr))
                            {
                                spectator->SetFaction(FACTION_NEUTRAL);
                                spectator->SetReactState(REACT_DEFENSIVE);
                            }
                        }
                        break;
                    default:
                        break;
                    }
                    break;
                case TYPE_VAULT:
                    encounter[1] = data;
                    break;
                case TYPE_BAR:
                    if (data == SPECIAL)
                        ++BarAleCount;
                    else
                        encounter[2] = data;
                    break;
                case TYPE_TOMB_OF_SEVEN:
                    encounter[3] = data;
                    switch (data)
                    {
                        case IN_PROGRESS:
                            HandleGameObject(GoTombExitGUID, false);
                            HandleGameObject(GoTombEnterGUID, false);
                            break;
                        case DONE:
                            DoRespawnGameObject(GoChestGUID, DAY);
                            HandleGameObject(GoTombExitGUID, true);
                            HandleGameObject(GoTombEnterGUID, true);
                            break;
                    }
                    break;
                case TYPE_LYCEUM:
                    encounter[4] = data;
                    if (data == DONE)
                    {
                        HandleGameObject(GetGuidData(DATA_GOLEM_DOOR_N), true);
                        HandleGameObject(GetGuidData(DATA_GOLEM_DOOR_S), true);
                        if (Creature* magmus = instance->GetCreature(MagmusGUID))
                        {
                            magmus->AI()->Talk(0);
                        }
                        ReplaceMoiraIfSaved(); // Need to place the correct final boss, but we need her to be spawned first.
                    }
                    break;
                case TYPE_IRON_HALL:
                    encounter[5] = data;
                    switch (data)
                    {
                    case NOT_STARTED:
                    case IN_PROGRESS:
                        for (int i = 0; i < 6; i++)
                        {
                            if (Creature* ironhand = instance->GetCreature(IronhandGUID[i]))
                            {
                                ironhand->AI()->SetData(0, data == IN_PROGRESS);
                            }
                        }
                        break;
                    case DONE:
                        HandleGameObject(GetGuidData(DATA_THRONE_DOOR), true);
                        break;
                    default:
                        break;
                    }
                    break;
                case DATA_OPEN_COFFER_DOORS:
                    OpenedCoofers += 1;
                    if (OpenedCoofers == 12)
                    {
                        Position pos = {812.15f, -348.91f, -50.579f, 0.7f};
                        if (TempSummon* summon = instance->SummonCreature(NPC_WATCHMAN_DOOMGRIP, pos))
                            summon->SetTempSummonType(TEMPSUMMON_MANUAL_DESPAWN);
                    }
                    break;
                case DATA_GOLEM_LORD_ARGELMACH_INIT:
                {
                    if (Creature* argelmach = instance->GetCreature(ArgelmachGUID))
                    {
                        GuidList adds = ArgelmachAdds;
                        for (GuidList::const_iterator itr = adds.begin(); itr != adds.end();)
                        {
                            if (Creature* argelmachAdd = instance->GetCreature(*itr))
                            {
                                if (argelmachAdd->GetEntry() == NPC_WRATH_HAMMER_CONSTRUCT)
                                {
                                    argelmachAdd->RemoveAurasDueToSpell(SPELL_STONED);
                                    argelmachAdd->AI()->AttackStart(argelmach->GetVictim());
                                    itr = adds.erase(itr);
                                }
                                else if (argelmachAdd->GetEntry() == NPC_RAGEREAVER_GOLEM)
                                {
                                    if (argelmachAdd->IsWithinDist2d(argelmach, 10.f))
                                    {
                                        argelmachAdd->RemoveAurasDueToSpell(SPELL_STONED);
                                        argelmachAdd->AI()->AttackStart(argelmach->GetVictim());
                                        itr = adds.erase(itr);
                                    }
                                    else
                                        ++itr;
                                }
                                else
                                {
                                    ++itr;
                                }
                            }
                            else
                            {
                                ++itr;
                            }
                        }

                        if (!adds.empty())
                        {
                            argelmach->SetReactState(REACT_PASSIVE);
                            argelmach->SetTarget();
                            argelmach->AI()->SetData(DATA_GOLEM_LORD_ARGELMACH_INIT, IN_PROGRESS);
                        }
                        else
                        {
                            argelmach->AI()->SetData(DATA_GOLEM_LORD_ARGELMACH_INIT, DONE);
                        }
                    }
                    break;
                }
                case DATA_GOLEM_LORD_ARGELMACH_ADDS:
                {
                    if (Creature* argelmach = instance->GetCreature(ArgelmachGUID))
                    {
                        argelmach->HandleEmoteCommand(EMOTE_ONESHOT_SHOUT);
                        argelmach->m_Events.AddEvent(new RestoreAttack(argelmach), argelmach->m_Events.CalculateTime(3000));

                        for (ObjectGuid const& argelmachAddGUID : ArgelmachAdds)
                        {
                            if (Creature* argelmachAdd = instance->GetCreature(argelmachAddGUID))
                            {
                                if (!argelmachAdd->IsInCombat())
                                {
                                    argelmachAdd->RemoveAurasDueToSpell(SPELL_STONED);
                                    argelmachAdd->AI()->AttackStart(argelmach->GetVictim());
                                }
                            }
                        }
                    }
                    break;
                }
                default:
                    break;
            }

            if (data == DONE || GhostKillCount >= 7)
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << encounter[0] << ' ' << encounter[1] << ' ' << encounter[2] << ' '
                           << encounter[3] << ' ' << encounter[4] << ' ' << encounter[5] << ' ' << GhostKillCount;

                str_data = saveStream.str();

                SaveToDB();
                OUT_SAVE_INST_DATA_COMPLETE;
            }
        }

        uint32 GetData(uint32 type) const override
        {
            switch (type)
            {
                case TOS_DATA_ENCOUNTER_TRIAL_START:
                    return encounterInProgress;

                case TOS_DATA_ENCOUNTER_CURRENT_WAVE:
                    return currentWave;

                case TOS_DATA_ENCOUNTER_GET_RANDOM_CURSE:
                    return GetRandomAvailableCurse();

                case TOS_DATA_ENCOUNTER_CURRENT_WAVE_CLEARED:
                    return IsWaveCleared();

                case TOS_DATA_ENCOUNTER_IS_REWARD_CHEST_EMPTY:
                    return IsRewardChestEmpty();

                case TOS_DATA_ENCOUNTER_HAS_MORE_WAVES:
                    return HasMoreWaves();

                case TOS_DATA_ENCOUNTER_CURRENT_WAVE_REMAINING:
                    return GetRemainingAlive();

                case TOS_DATA_ENCOUNTER_CURRENT_SUBWAVE:
                    return currentSubGroup;

                case TOS_DATA_ENCOUNTER_TOTAL_SUBWAVE:
                    return totalSubGroups;

                case TOS_DATA_ENCOUNTER_TRIAL_COMPLETED:
                    return trialCompleted;

                case TOS_DATA_ENCOUNTER_WAVE_IN_PROGRESS:
                    return waveInProgress;
                case TYPE_RING_OF_LAW:
                    return encounter[0];
                case TYPE_VAULT:
                    return encounter[1];
                case TYPE_BAR:
                    if (encounter[2] == IN_PROGRESS && BarAleCount == 3)
                        return SPECIAL;
                    else
                        return encounter[2];
                case TYPE_TOMB_OF_SEVEN:
                    return encounter[3];
                case TYPE_LYCEUM:
                    return encounter[4];
                case TYPE_IRON_HALL:
                    return encounter[5];
                case DATA_TIME_RING_FAIL:
                    return timeRingFail;
                case DATA_ARENA_MOBS:
                    return arenaMobsToSpawn;
                case DATA_ARENA_BOSS:
                    return arenaBossToSpawn;
            }
            return 0;
        }

        ObjectGuid GetGuidData(uint32 data) const override
        {
            switch (data)
            {
                case DATA_EMPEROR:
                    return EmperorGUID;
                case DATA_PHALANX:
                    return PhalanxGUID;
                case DATA_MOIRA:
                    return MoiraGUID;
                case DATA_COREN:
                    return CorenGUID;
                case DATA_ARENA1:
                    return GoArena1GUID;
                case DATA_ARENA2:
                    return GoArena2GUID;
                case DATA_ARENA3:
                    return GoArena3GUID;
                case DATA_ARENA4:
                    return GoArena4GUID;
                case DATA_GO_BAR_KEG:
                    return GoBarKegGUID;
                case DATA_GO_BAR_KEG_TRAP:
                    return GoBarKegTrapGUID;
                case DATA_GO_BAR_DOOR:
                    return GoBarDoorGUID;
                case DATA_SF_BRAZIER_N:
                    return GoSFNGUID;
                case DATA_SF_BRAZIER_S:
                    return GoSFSGUID;
                case DATA_THRONE_DOOR:
                    return GoThroneGUID;
                case DATA_GOLEM_DOOR_N:
                    return GoGolemNGUID;
                case DATA_GOLEM_DOOR_S:
                    return GoGolemSGUID;
                case DATA_GO_CHALICE:
                    return GoSpectralChaliceGUID;
                case DATA_MAGMUS:
                {
                    return MagmusGUID;
                }
            }

            return ObjectGuid::Empty;
        }

        std::string GetSaveData() override
        {
            return str_data;
        }

        void Load(const char* in) override
        {
            if (!in)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(in);

            std::istringstream loadStream(in);
            loadStream >> encounter[0] >> encounter[1] >> encounter[2] >> encounter[3]
                       >> encounter[4] >> encounter[5] >> GhostKillCount;

            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (encounter[i] == IN_PROGRESS)
                    encounter[i] = NOT_STARTED;
            if (GhostKillCount > 0 && GhostKillCount < 7)
                GhostKillCount = 0;//reset tomb of seven event
            if (GhostKillCount >= 7)
                GhostKillCount = 7;

            OUT_LOAD_INST_DATA_COMPLETE;
        }

        void TombOfSevenEvent()
        {
            if (GhostKillCount < 7 && TombBossGUIDs[TombEventCounter])
            {
                if (Creature* boss = instance->GetCreature(TombBossGUIDs[TombEventCounter]))
                {
                    ++TombEventCounter;
                    boss->SetFaction(FACTION_DARK_IRON_DWARVES);
                    boss->SetImmuneToPC(false);

                    // find suitable target here.
                    Player* target = boss->SelectNearestPlayer(130);
                    if (target && boss->CanCreatureAttack(target, true))
                    {
                        boss->AI()->AttackStart(target);
                        boss->AI()->DoZoneInCombat();
                        tombResetTimer = TIMER_TOMB_RESET;
                    }
                }
            }
        }

        void TombOfSevenReset()
        {
            HandleGameObject(GoTombExitGUID, false);// close exit door
            HandleGameObject(GoTombEnterGUID, true);// open entrance door
            for (uint8 i = 0; i < 7; ++i)
            {
                if (Creature* boss = instance->GetCreature(TombBossGUIDs[i]))
                {
                    if (!boss->IsAlive())
                    {
                        //do not call EnterEvadeMode(), it will create infinit loops
                        boss->Respawn();
                        boss->RemoveAllAuras();
                        boss->GetThreatMgr().ClearAllThreat();
                        boss->CombatStop(true);
                        boss->LoadCreaturesAddon(true);
                        boss->GetMotionMaster()->MoveTargetedHome();
                        boss->SetLootRecipient(nullptr);
                    }
                    boss->SetFaction(FACTION_FRIENDLY);
                    boss->SetImmuneToPC(true); // think this is useless
                    if (i == 6) // doomrel needs explicit reset
                    {
                        boss->AI()->Reset();
                    }
                }
            }

            GhostKillCount = 0;
            TombEventCounter = 0;
            TombTimer = TIMER_TOMB_START;
            SetData(TYPE_TOMB_OF_SEVEN, NOT_STARTED);
        }

        bool CheckTombReset(uint32 diff)
        {
            bool anyBossAlive = false; // status of the bosses up until the current one
            for (uint8 i = 0; i < TombEventCounter; i++)
            {
                Creature* boss = instance->GetCreature(TombBossGUIDs[i]);
                if (boss)
                {
                    anyBossAlive |= boss->IsAlive();
                    if (boss->IsAlive() && boss->IsInCombat())
                    {
                        tombResetTimer = TIMER_TOMB_RESET;
                        return false;  // any boss in combat means we shouldn't reset.
                    }
                }
            }
            if (!anyBossAlive) // no boss alive, put reset timer back up
            {
                tombResetTimer = TIMER_TOMB_RESET;
            }
            tombResetTimer -= diff;
            return tombResetTimer < diff;
        }

        void Update(uint32 diff) override
        {
            if ((GetData(TYPE_TOMB_OF_SEVEN) == IN_PROGRESS) && GhostKillCount < 7)
            {
                if (TombTimer <= diff)
                {
                    TombTimer = TIMER_TOMBOFTHESEVEN;
                    TombOfSevenEvent();
                }
                else
                {
                    TombTimer -= diff;
                }

                if (CheckTombReset(diff))
                {
                    TombOfSevenReset();
                }
            }

            events.Update(diff);

            switch (events.ExecuteEvent())
            {
            case TOS_DATA_ENCOUNTER_TRIAL_START:
                SetupTrialEncounter();
                break;
            case TOS_DATA_ENCOUNTER_ENDLESS_START:
                SetupEndlessEncounter();
                break;

            case TOS_DATA_ENCOUNTER_COMBATANTS_HOSTILE:
                SetCombatantsHostile();
                break;

            case TOS_DATA_ENCOUNTER_CHECK_WAVE_COMPLETE:
                CheckWaveCompletion();
                break;

            case TOS_DATA_ENCOUNTER_START_NEXT_WAVE:
                SpawnNextWave();
                break;

            case TOS_DATA_ENCOUNTER_CHECK_FAILURE:
                if (!CheckFailure())
                {
                    events.RescheduleEvent(TOS_DATA_ENCOUNTER_CHECK_FAILURE, 2s);
                }
                break;
            case TOS_DATA_ENCOUNTER_CHECK_ARENA_MASTER_RELOCATE:
                CheckArenaMasterRelocate();
                events.RescheduleEvent(TOS_DATA_ENCOUNTER_CHECK_ARENA_MASTER_RELOCATE, 2s);
                break;

            case TOS_DATA_ENCOUNTER_CROWD:
                PlayCrowd();
                events.RescheduleEvent(TOS_DATA_ENCOUNTER_CROWD, 1s);
                break;
            case TOS_DATA_ENCOUNTER_TRY_RESURRECT:
                TryResurrectPlayers();
                break;

            case TOS_DATA_PORTAL_TRY_TELEPORT:
                TryTeleportPlayers();
                events.RescheduleEvent(TOS_DATA_PORTAL_TRY_TELEPORT, 1s);
                break;
            }
        }
    };
};

void AddSC_instance_blackrock_depths_tos()
{
    new instance_blackrock_depths_tos();
}
