#ifndef MODULE_TRIAL_OF_STRENGTH_H
#define MODULE_TRIAL_OF_STRENGTH_H

#include "Player.h"
#include "ScriptMgr.h"
#include "CombatAI.h"
#include "Config.h"
#include "ScriptedGossip.h"

#include <vector>
#include <unordered_map>
#include <sstream>

enum DataTypes
{
    TYPE_RING_OF_LAW = 1,
    TYPE_VAULT = 2,
    TYPE_BAR = 3,
    TYPE_TOMB_OF_SEVEN = 4,
    TYPE_LYCEUM = 5,
    TYPE_IRON_HALL = 6,

    DATA_EMPEROR = 10,
    DATA_PHALANX = 11,

    DATA_ARENA1 = 12,
    DATA_ARENA2 = 13,
    DATA_ARENA3 = 14,
    DATA_ARENA4 = 15,

    DATA_GO_BAR_KEG = 16,
    DATA_GO_BAR_KEG_TRAP = 17,
    DATA_GO_BAR_DOOR = 18,
    DATA_GO_CHALICE = 19,

    DATA_GOLEM_DOOR_N = 22,
    DATA_GOLEM_DOOR_S = 23,

    DATA_THRONE_DOOR = 24,

    DATA_SF_BRAZIER_N = 25,
    DATA_SF_BRAZIER_S = 26,
    DATA_MOIRA = 27,
    DATA_PRIESTESS = 28,
    DATA_OPEN_COFFER_DOORS = 30,

    DATA_GOLEM_LORD_ARGELMACH_INIT = 31,
    DATA_GOLEM_LORD_ARGELMACH_ADDS = 32,
    DATA_MAGMUS = 33,

    DATA_COREN = 34,

    DATA_ANUBSHIAH,
    DATA_EVISCERATOR,
    DATA_GOROSH,
    DATA_GRIZZLE,
    DATA_HEDRUM,
    DATA_OKTHOR,
    DATA_TIME_RING_FAIL,
    DATA_ARENA_MOBS,
    DATA_ARENA_BOSS,


    //TOS_DATA_ENCOUNTER_START = 44,
    TOS_DATA_ENCOUNTER_CURRENT_WAVE = 45,
    TOS_DATA_ENCOUNTER_CURRENT_WAVE_CLEARED = 46,
    TOS_DATA_ENCOUNTER_HAS_MORE_WAVES = 47,
    TOS_DATA_ENCOUNTER_RESET = 48,
    TOS_DATA_ENCOUNTER_CURRENT_WAVE_REMAINING = 49,
    TOS_DATA_ENCOUNTER_COMBATANTS_HOSTILE = 50,
    TOS_DATA_ENCOUNTER_CHECK_WAVE_COMPLETE = 51,
    TOS_DATA_ENCOUNTER_START_NEXT_WAVE = 52,
    TOS_DATA_ENCOUNTER_CHECK_FAILURE = 53,
    TOS_DATA_ENCOUNTER_CURRENT_SUBWAVE = 54,
    TOS_DATA_ENCOUNTER_TOTAL_SUBWAVE = 55,
    TOS_DATA_ENCOUNTER_TRIAL_COMPLETED = 56,
    TOS_DATA_ENCOUNTER_CHECK_ARENA_MASTER_RELOCATE = 57,
    TOS_DATA_ENCOUNTER_WAVE_IN_PROGRESS = 58,
    TOS_DATA_ENCOUNTER_CROWD = 59,
    TOS_DATA_PORTAL_TRY_TELEPORT = 60,
    TOS_DATA_ENCOUNTER_IS_REWARD_CHEST_EMPTY = 61,
    TOS_DATA_ENCOUNTER_SELECTED_CURSE = 62,
    TOS_DATA_ENCOUNTER_TRIAL_START = 63,
    TOS_DATA_ENCOUNTER_ENDLESS_START = 64,

};

enum ToSConstants {
    //TOS_MAP_ID = 44,
    TOS_MAP_ID = 230,
    TOS_NPC_ARENA_MASTER = 441250,
    TOS_SPELL_TELEPORT_VISUAL = 64446,

    TOS_CURSE_TYPE_ENEMY = 0,
    TOS_CURSE_TYPE_PLAYER = 1,

    TOS_DATA_UINT32_BASE = 4411,
    TOS_DATA_UINT32_CURSE_ID = 0,
    TOS_GO_PORTAL_TO_DALARAN = 195682,
};

struct ToSWaveTemplate {
    uint32 wave;
    uint32 enemyGroup;
    bool hasReward;
    uint32 rewardTemplate;
};

struct ToSEnemyGroup {
    uint32 id;
    uint32 group;
    uint32 subGroup;
    uint32 creatureEntry;
};

struct ToSRewardTemplate {
    uint32 itemEntry;
    uint32 countMin;
    uint32 countMax;
    uint32 countCap;
    uint32 chance;
    float curseScalar;
};

struct ToSCurseTemplate {
    uint32 id;
    uint32 type;
    uint32 difficulty;
    uint32 aura;

    std::string name;
    std::string description;
};

class ToSWorldScript : public WorldScript
{
public:
    ToSWorldScript() : WorldScript("ToSWorldScript") { }

    void OnAfterConfigLoad(bool /*reload*/) override;
};

#endif // MODULE_TRIAL_OF_STRENGTH_H
