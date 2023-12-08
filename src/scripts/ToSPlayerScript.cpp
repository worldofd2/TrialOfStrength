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
