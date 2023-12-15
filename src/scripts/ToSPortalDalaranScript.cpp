#include "ToSPortalDalaranScript.h"

#include "TrialOfStrength.h"

#include <ScriptedGossip.h>

bool ToSPortalDalaranScript::OnGossipHello(Player* player, GameObject* go)
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

    player->SetPhaseMask(1, true);
    player->CastSpell(player, 68328, true);

    return true;
}

bool ToSPortalDalaranScript::OnGossipSelect(Player* player, GameObject* go, uint32 /*sender*/, uint32 action)
{
    if (!action)
    {
        return false;
    }

    if (!go || !player)
    {
        return false;
    }

    CloseGossipMenuFor(player);

    return true;
}

