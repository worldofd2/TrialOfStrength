#ifndef MODULE_TRIAL_OF_STRENGTH_CURSE_CRYSTAL_SCRIPT_H
#define MODULE_TRIAL_OF_STRENGTH_CURSE_CRYSTAL_SCRIPT_H

#include "ScriptMgr.h"
#include "Player.h"

#include "ToSMapMgr.h"

class ToSCurseCrystalScript : public GameObjectScript
{
public:
    ToSCurseCrystalScript() : GameObjectScript("ToSCurseCrystalScript") { }

    bool OnGossipHello(Player* /*player*/, GameObject* /*go*/) override;
    bool OnGossipSelect(Player* /*player*/, GameObject* /*go*/, uint32 /*sender*/, uint32 /*action*/) override;

private:
    std::unordered_map<uint64, uint32> assignedCurses;

};

#endif // MODULE_TRIAL_OF_STRENGTH_CURSE_CRYSTAL_SCRIPT_H
