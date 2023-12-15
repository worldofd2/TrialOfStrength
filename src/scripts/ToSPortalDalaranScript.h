#ifndef MODULE_TRIAL_OF_STRENGTH_PORTAL_DALARAN_SCRIPT_H
#define MODULE_TRIAL_OF_STRENGTH_PORTAL_DALARAN_SCRIPT_H

#include "ScriptMgr.h"
#include "Player.h"

#include "ToSMapMgr.h"

class ToSPortalDalaranScript : public GameObjectScript
{
public:
    ToSPortalDalaranScript() : GameObjectScript("ToSPortalDalaranScript") { }

    bool OnGossipHello(Player* /*player*/, GameObject* /*go*/) override;
    bool OnGossipSelect(Player* /*player*/, GameObject* /*go*/, uint32 /*sender*/, uint32 /*action*/) override;
};

#endif // MODULE_TRIAL_OF_STRENGTH_PORTAL_DALARAN_SCRIPT_H
