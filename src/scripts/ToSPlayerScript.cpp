#include "ToSPlayerScript.h"

#include "TrialOfStrength.h"
#include "ToSMapMgr.h"

#include "Chat.h"

void ToSPlayerScript::OnLogin(Player* player)
{
    if (!player)
    {
        return;
    }

    sToSMapMgr->ClearCurses(player);
}

bool ToSPlayerScript::CanRepopAtGraveyard(Player* player)
{
    if (!player)
    {
        return true;
    }

    if (player->GetMapId() != TOS_MAP_ID)
    {
        return true;
    }

    if (player->GetPhaseMask() != 2) {
        return true;
    }

    auto iScript = player->GetInstanceScript();

    bool checkProgress = iScript->GetData(TOS_DATA_ENCOUNTER_TRIAL_START);
    if (checkProgress  && iScript->IsEncounterInProgress())
    {
        //TODO: needed?
        player->SendTransferAborted(TOS_MAP_ID, TRANSFER_ABORT_ZONE_IN_COMBAT);
        return false;
    }

    player->TeleportTo(TOS_MAP_ID, 629.948, -179.466, -52.732, 3.137);
    player->SetPhaseMask(2, true);

    if (player->isDead())
    {
        player->ResurrectPlayer(100, false);

        if (player->HasCorpse())
        {
            player->RemoveCorpse();
        }
    }

    return false;
}

bool ToSPlayerScript::OnBeforeTeleport(Player* player, uint32 mapId, float /*x*/, float /*y*/, float /*z*/, float /*orientation*/, uint32 /*options*/, Unit* /*target*/)
{
    if (!player)
    {
        return true;
    }

    auto oldMapId = player->GetMapId();
    if (oldMapId != TOS_MAP_ID)
    {
        return true;
    }

    if (player->GetPhaseMask() == 2) {
        player->SetPhaseMask(1, true);
    }

    sToSMapMgr->ClearCurses(player);

    return true;
}
