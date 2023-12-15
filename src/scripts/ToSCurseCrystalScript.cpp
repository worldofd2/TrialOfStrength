#include "ToSCurseCrystalScript.h"

#include "TrialOfStrength.h"

#include <ScriptedGossip.h>

bool ToSCurseCrystalScript::OnGossipHello(Player* player, GameObject* go)
{
    ClearGossipMenuFor(player);

    if (!go)
    {
        return false;
    }

    auto map = go->GetMap();
    if (!map)
    {
        return false;
    }

    auto instance = map->ToInstanceMap();
    if (!instance)
    {
        return false;
    }

    auto iScript = instance->GetInstanceScript();
    if (!iScript)
    {
        return false;
    }

    uint32 curseId;
    auto it = assignedCurses.find(go->GetGUID().GetRawValue());
    if (it == assignedCurses.end()) {
        curseId = iScript->GetData(TOS_DATA_ENCOUNTER_GET_RANDOM_CURSE);
        assignedCurses.emplace(go->GetGUID().GetRawValue(), curseId);
    }
    else {
        curseId = it->second;
    }
     
    if (!curseId)
    {
        LOG_INFO("module", "Failed to get curse id for crystal.");
        return false;
    }

    auto curseInfo = sToSMapMgr->GetCurseById(curseId);
    if (!curseInfo)
    {
        LOG_INFO("module", "Failed to get curse information for crystal.");
        return false;
    }
   

    AddGossipItemFor(player, GOSSIP_ICON_CHAT, Acore::StringFormatFmt("|cff000000{}|n|cff212121{}|r|n{}", curseInfo->name, curseInfo->description, sToSMapMgr->GetDifficultyString(curseInfo->difficulty)), GOSSIP_SENDER_MAIN, curseInfo->id);
    SendGossipMenuFor(player, 1, go->GetGUID());

    return true;
}

bool ToSCurseCrystalScript::OnGossipSelect(Player* player, GameObject* go, uint32 /*sender*/, uint32 action)
{
    if (!action)
    {
        return false;
    }

    if (!go || !player)
    {
        return false;
    }

    auto map = go->GetMap();
    if (!map)
    {
        return false;
    }

    auto instance = map->ToInstanceMap();
    if (!instance)
    {
        return false;
    }

    auto iScript = instance->GetInstanceScript();
    if (!iScript)
    {
        return false;
    }

    iScript->SetData(TOS_DATA_ENCOUNTER_SELECTED_CURSE, action);

    CloseGossipMenuFor(player);

    return true;
}

