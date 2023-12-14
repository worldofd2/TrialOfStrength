#include "ToSMapMgr.h"

std::string ToSMapManager::GetHexColorFromClass(uint8 classId)
{
    switch (classId)
    {
    case CLASS_DEATH_KNIGHT:
        return "|cffFC2A43";
    case CLASS_HUNTER:
        return "|cffAAD174";
    case CLASS_PALADIN:
        return "|cffF28CBC";
    case CLASS_ROGUE:
        return "|cffFEF262";
    case CLASS_WARLOCK:
        return "|cff9A81C2";
    case CLASS_DRUID:
        return "|cffF67404";
    case CLASS_MAGE:
        return "|cff70C9F1";
    case CLASS_PRIEST:
        return "|cffF5F3F6";
    case CLASS_SHAMAN:
        return "|cff05D7BA";
    case CLASS_WARRIOR:
        return "|cffC9A074";
    }

    return "|cffFFFFFF";
}

std::string ToSMapManager::GetDifficultyString(uint32 difficulty)
{
    std::stringstream ss;

    ss << ((difficulty >= 0) ? TOS_ICON_CROWN : TOS_ICON_CROWN_BW);
    ss << ((difficulty >= 20) ? TOS_ICON_CROWN : TOS_ICON_CROWN_BW);
    ss << ((difficulty >= 40) ? TOS_ICON_CROWN : TOS_ICON_CROWN_BW);
    ss << ((difficulty >= 60) ? TOS_ICON_CROWN : TOS_ICON_CROWN_BW);
    ss << ((difficulty >= 80) ? TOS_ICON_CROWN : TOS_ICON_CROWN_BW);

    return ss.str();
}

std::vector<ToSCurseTemplate> ToSMapManager::GetCurses()
{
    std::vector<ToSCurseTemplate> curses;

    for (auto curse : CurseTemplates)
    {
        curses.push_back(curse.second);
    }

    return curses;
}

void ToSMapManager::ClearCurses(Unit* unit)
{
    if (!unit)
    {
        return;
    }
    std::vector<ToSCurseTemplate> curses = sToSMapMgr->GetCurses();

    for (auto curse : curses)
    {
        if (unit->HasAura(curse.aura))
        {
            unit->RemoveAura(curse.aura);
        }
    }
}

ToSCurseTemplate* ToSMapManager::GetCurseById(uint32 curseId)
{
    auto it = CurseTemplates.find(curseId);
    if (it == CurseTemplates.end())
    {
        return nullptr;
    }

    return &it->second;
}

ToSWaveTemplate* ToSMapManager::GetWaveTemplateForWave(uint32 wave)
{
    auto it = WaveTemplates.find(wave);
    if (it == WaveTemplates.end())
    {
        return nullptr;
    }

    return &it->second;
}

std::vector<ToSEndlessWaveTemplate> ToSMapManager::GetRandomWavesForEndless(uint32 wave)
{
    std::vector<ToSEndlessWaveTemplate> enemies;

    auto rank = (int)((wave / 8) + 1);
    auto difficulty = std::max((int)wave % 8, 1);
    auto minMobs = 3;
    auto mobIncreaseCoeff = (rank * 0.25) + 1;
    auto maxMobs = (int)(minMobs * mobIncreaseCoeff);
    //to keep it spicy
    maxMobs += urand(0, difficulty);

    //5% chance to get a miniboss + 5% everyrank
    auto percent = 0.05 * rank;
    if (roll_chance_i(std::min((int)percent * 100, 100))) {
        //miniboss
    }

    auto templates = sToSMapMgr->GetEndlessWaveTemplate(rank);
    if (!templates)
    {
        //We probably don't have configuration for this rank, try to find a configuration for a lower rank
        for (int i = rank; i > 0; i--) {
            templates = sToSMapMgr->GetEndlessWaveTemplate(rank);
            if (templates) break;
        }
        if (!templates) {
            return enemies;
        }
    }

    //get random maxMobs mobs
    std::sample(templates->begin(), templates->end(), std::back_inserter(enemies), maxMobs,
        std::mt19937{ std::random_device{}() });

    return enemies;
}

uint32 ToSMapManager::GetTotalWaves()
{
    return WaveTemplates.size();
}

std::vector<ToSCreature> ToSMapManager::GetEnemiesFromGroup(uint32 groupId, uint32 subGroup)
{
    std::vector<ToSCreature> groups;

    for (auto it = EnemyGroups.begin(); it != EnemyGroups.end(); ++it)
    {
        if (it->second.group == groupId &&
            it->second.subGroup == subGroup)
        {
            ToSCreature creature;
            creature.creatureEntry = *(&it->second.creatureEntry);
            groups.push_back(creature);
        }
    }

    return groups;
}

std::vector<uint32> ToSMapManager::GetSubGroups(uint32 groupId)
{
    std::vector<uint32> subgroups;

    for (auto it = EnemyGroups.begin(); it != EnemyGroups.end(); ++it)
    {
        if (it->second.group == groupId)
        {
            uint32 subgroup = it->second.subGroup;

            auto it = std::find(subgroups.begin(), subgroups.end(), subgroup);
            if (it != subgroups.end())
            {
                continue;
            }

            subgroups.push_back(subgroup);
        }
    }

    return subgroups;
}

std::vector<ToSRewardTemplate>* ToSMapManager::GetRewardTemplates(uint32 rewardId)
{
    auto it = RewardTemplates.find(rewardId);
    if (it == RewardTemplates.end())
    {
        return nullptr;

    }

    return &it->second;
}

std::vector<ToSEndlessWaveTemplate>* ToSMapManager::GetEndlessWaveTemplate(uint32 rank)
{
    auto it = EndlessWaveTemplates.find(rank);
    if (it == EndlessWaveTemplates.end())
    {
        return nullptr;
    }

    return &it->second;
}

Creature* ToSMapManager::SpawnNPC(uint32 entry, Map* map, Position* position)
{
    if (!map || !position)
    {
        return nullptr;
    }

    if (!sObjectMgr->GetCreatureTemplate(entry))
    {
        return nullptr;
    }

    return map->SummonCreature(entry, *position);
}

double ToSMapManager::LinearDistribution(double min, double max, double count, double index)
{
    double total = abs(min) + abs(max);

    double amount = total / count;

    return (min + (amount * index) + (amount / 2.0));
}

void ToSMapManager::ResetCooldowns(Player* player)
{
    if (!player)
    {
        return;
    }

    player->RemoveAllSpellCooldown();
}

bool ToSMapManager::CanPlayerEnter(Player* player)
{
    if (!player)
    {
        return false;
    }

    if (player->GetLevel() < 80)
    {
        return false;
    }

    return true;
}
