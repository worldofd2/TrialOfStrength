DELETE FROM `instance_template` WHERE `map`=44;
-- INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES (44, 0, 'instance_trial_of_strength', 0);

-- Trial of Strength / Arena Master
DELETE FROM `creature_template` WHERE `entry`=441250;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441250, 0, 0, 0, 0, 0, 18039, 0, 0, 0, 'Fortichad Ironfist', 'Arena Master', NULL, 0, 80, 80, 0, 35, 3, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'ToSArenaMasterScript', 1);

-- Trial of Strength / Arena Spectator
DELETE FROM `creature_template` WHERE `entry`=441253;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441253, 0, 0, 0, 0, 0, 1485, 3606, 4123, 2224, 'Arena Spectator', NULL, NULL, 0, 78, 80, 0, 35, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NullCreatureAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'ToSAIArenaSpectator', 1);


DELETE FROM `npc_text` WHERE `ID`=441250;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441250, 'Greetings, $n.|n|nI am the Arena Master for the Trial of Strength.|n|nIf you seek to test your abilities, then I can transport you to the arena.|n|nAre you ready to face the challenges that lie ahead?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `npc_text` WHERE `ID`=441251;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441251, 'Welcome $n, are you ready to start the Trial of Strength?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `npc_text` WHERE `ID`=441252;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441252, 'You must finish the current trial before speaking to me again.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `npc_text` WHERE `ID`=441253;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441253, 'Are you ready for the next trial?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `npc_text` WHERE `ID`=441254;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441254, 'Congratulations, $n!|n|nYou have triumphed in the Trial of Strength, proving your mettle and determination. Your strength and skill have shone brightly, and your name will be celebrated in the annals of our arena\'s history.|n|nWhat would you like to do now?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `npc_text` WHERE `ID`=441255;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (441255, 'You are not skilled enough to enter the Trial of Strength, come back later!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

DELETE FROM `gameobject_template` WHERE `entry`=441250;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441250, 3, 259, 'Arena Master\'s Lootbox', '', '', '', 1.25, 57, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);

DELETE FROM `gameobject_template` WHERE `entry`=441251;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441251, 5, 3272, 'Arena Master\'s Lootbox Beam', '', '', '', 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);

DELETE FROM `gameobject_template` WHERE `entry`=441252;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441252, 2, 327, 'Curse Crystal', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'ToSCurseCrystalScript', 1);

DELETE FROM `gameobject_template` WHERE `entry`=441350;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441350, 5, 5975, 'WestfallTree1', '', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);

DELETE FROM `gameobject_template` WHERE `entry`=441352;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441352, 5, 7148, 'ToSArenaPortal', '', '', '', 0.85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL);

DELETE FROM `gameobject_template` WHERE `entry`=441353;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (441353, 5, 6815, 'ToSStatue1', '', '', '', 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);


CREATE TABLE IF NOT EXISTS `tos_reward_template` (
  `id` int DEFAULT NULL,
  `item_entry` int DEFAULT '0',
  `count_min` int DEFAULT '1',
  `count_max` int DEFAULT '1',
  `count_cap` int DEFAULT NULL,
  `chance` float DEFAULT '100',
  `curse_scalar` float DEFAULT '0',
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELETE FROM `tos_reward_template`;
INSERT INTO `tos_reward_template` (`id`, `item_entry`, `count_min`, `count_max`, `count_cap`, `chance`, `curse_scalar`, `note`) VALUES (1, 21215, 5, 10, 20, 50, 0, 'Graccu\'s Fruitcake');
INSERT INTO `tos_reward_template` (`id`, `item_entry`, `count_min`, `count_max`, `count_cap`, `chance`, `curse_scalar`, `note`) VALUES (1, 44990, 1, 2, 500, 5, 0, 'Champion\'s Seal');
INSERT INTO `tos_reward_template` (`id`, `item_entry`, `count_min`, `count_max`, `count_cap`, `chance`, `curse_scalar`, `note`) VALUES (1, 47241, 1, 3, 500, 5, 0, 'Emblem of Triumph');


CREATE TABLE IF NOT EXISTS `tos_wave_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` int DEFAULT NULL,
  `sub_group` int DEFAULT NULL,
  `creature` int DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELETE FROM `tos_wave_groups`;
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 1, 441500, 'Wave 1/1 - Outrunner');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 1, 441501, 'Wave 1/1 - Runt');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 2, 441500, 'Wave 1/2 - Outrunner');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 2, 441500, 'Wave 1/2 - Outrunner');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 2, 441501, 'Wave 1/2 - Runt');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (1, 3, 441502, 'Wave 1/3 - Hogger');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 1, 441504, 'Wave 2/1 - Smuggler');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 1, 441503, 'Wave 2/1 - Trapper');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 2, 441505, 'Wave 2/2 - Pillager');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 2, 441505, 'Wave 2/2 - Pillager');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 2, 441503, 'Wave 2/2 - Trapper');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (2, 3, 441506, 'Wave 2/3 - Edwin Vancleef');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 1, 441508, 'Wave 3/1 - Hungering Dead');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 1, 441509, 'Wave 3/1 - Ravaged Corpse');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 1, 441507, 'Wave 3/1 - Rotting Dead');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 2, 441508, 'Wave 3/2 - Hungering Dead');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 2, 441509, 'Wave 3/2 - Ravaged Corpse');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 2, 441507, 'Wave 3/2 - Rotting Dead');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (3, 3, 441510, 'Wave 3/3 - Leprithus');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (4, 1, 441511, 'Wave 4/1 - Radioactive Bot');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (4, 1, 441511, 'Wave 4/1 - Radioactive Bot');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (4, 1, 441511, 'Wave 4/1 - Radioactive Bot');

INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (5, 1, 16193, 'Wave 5/1 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (5, 1, 16193, 'Wave 5/1 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (5, 1, 16193, 'Wave 5/1 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (5, 1, 16146, 'Wave 5/1 - Death Knight');

INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 1, 16146, 'Wave 6/1 - Death Knight');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 1, 16146, 'Wave 6/1 - Death Knight');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 1, 16156, 'Wave 6/1 - Dark Touched Warrior');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 2, 16156, 'Wave 6/2 - Dark Touched Warrior');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 2, 16193, 'Wave 6/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 2, 16193, 'Wave 6/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 2, 16193, 'Wave 6/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 2, 16193, 'Wave 6/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 3, 16145, 'Wave 6/3 - Death Knight Captain');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (6, 3, 16145, 'Wave 6/3 - Death Knight Captain');

INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 1, 16146, 'Wave 7/1 - Death Knight');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 1, 16146, 'Wave 7/1 - Death Knight');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 1, 16145, 'Wave 7/1 - Death Knight Captain');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 2, 16145, 'Wave 7/2 - Death Knight Captain');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 2, 16145, 'Wave 7/2 - Death Knight Captain');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 2, 16193, 'Wave 7/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 2, 16193, 'Wave 7/2 - skeletal smith');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 3, 16193, 'Wave 7/3 - Dark Touched Warrior');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 3, 16193, 'Wave 7/3 - Dark Touched Warrior');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 3, 16145, 'Wave 7/3 - Death Knight Captain');
INSERT INTO `tos_wave_groups` (`group`, `sub_group`, `creature`, `note`) VALUES (7, 3, 16145, 'Wave 7/3 - Death Knight Captain');


CREATE TABLE IF NOT EXISTS `tos_wave_template` (
  `wave` int DEFAULT NULL,
  `enemy_group` int DEFAULT NULL,
  `has_reward` tinyint DEFAULT NULL,
  `reward_template` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELETE FROM `tos_wave_template`;
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (1, 1, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (2, 2, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (3, 3, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (4, 4, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (5, 5, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (6, 6, 1, 1);
INSERT INTO `tos_wave_template` (`wave`, `enemy_group`, `has_reward`, `reward_template`) VALUES (7, 7, 1, 1);


-- For Endless we use ranks to classify difficulty of creatures
CREATE TABLE IF NOT EXISTS `tos_endless_wave_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank` int DEFAULT NULL,
  `miniboss` tinyint DEFAULT NULL,
  `creature` int DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELETE FROM `tos_endless_wave_template`;
-- Rank 1 is wave 1 to 8
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441500, 'Riverpaw Outrunner');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441501, 'Runt');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441502, 'Hogger');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441503, 'Trapper');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441504, 'Smuggler');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 0, 441505, 'Pillager');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (1, 1, 441506, 'Edwin Vancleef');
-- Rank 2 is wave 9 to 16
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (2, 0, 16193, 'Skeletal Smith');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (2, 0, 16146, 'Death Knight');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (2, 0, 16156, 'Dark Touched Warrior');
INSERT INTO `tos_endless_wave_template` (`rank`, `miniboss`, `creature`, `note`) VALUES (2, 1, 16145, 'Death Knight Captain');


CREATE TABLE IF NOT EXISTS `tos_curse_template` (
  `id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `aura` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELETE FROM `tos_curse_template`;
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (1, 0, 50, 68335, 'Enrage', 'Combatants are enraged, increasing their damage by 50%.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (2, 0, 100, 29476, 'Astral Armor', 'Combatants are protected, decreasing the damage they receive by 90%.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (3, 1, 60, 34102, 'Curse of the Violet Tower', 'Players are weakened, dealing 50% less damage.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (4, 0, 75, 34337, 'Armored Skin', 'Combatants skin have been strengthened, taking 75% less physical damage.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (5, 0, 0, 45673, 'Bigger!', 'Combatants are 15-25 percent larger!');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (6, 0, 20, 45444, 'Hot Hands', 'Combatants have bonfire\'s blessing, infusing their attacks with flame.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (7, 1, 50, 69127, 'Chill of the Throne', 'Players have a 20% reduced chance to dodge.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (8, 1, 10, 41631, 'Cold Feet', 'Players have a 20% reduced movement speed.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (9, 0, 10, 41630, 'Hot Feet', 'Combatants have a 30% increased movement speed.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (10, 0, 50, 64193, 'Heart Broken', 'Combatants have 15% increased damage and 60% increased health.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (11, 1, 0, 45672, 'Shorter!', 'Players are 45-75 percent smaller!');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (12, 0, 20, 33795, 'Strength of Halaa', 'Combatants have 5% increased damage.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (13, 0, 100, 58361, 'Might of Mograine', 'Combatants have 500% increased damage, 15000% increased health and 25% of health is regenerated every 2 seconds.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (14, 0, 20, 33779, 'Twin Spire Blessing', 'Combatants have 5% increased damage.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (15, 0, 100, 69491, 'Aura of Darkness', 'Combatants are consumed by darkness, radiating very high shadow damage every 2 seconds.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (16, 0, 50, 25820, 'Fearful', 'Combatants have a 10% chance when taking damage to fear players.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (17, 0, 30, 39444, 'Vengeance', 'Combatants have a 10% chance when taking damage to deal holy damage to the player.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (18, 1, 60, 35500, 'Dampened', 'Players have 50% reduced maximum health and 50% increased mana cost of spells.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (19, 0, 60, 31317, 'Vampiric', 'Combatants melee attacks heal for 300% of the damage.');
INSERT INTO `tos_curse_template` (`id`, `type`, `difficulty`, `aura`, `name`, `description`) VALUES (20, 0, 20, 39007, 'Lesser Immolation', 'Combatants are engulfed in flame, emitting low amounts of fire damage every 2 seconds.');


-- For previous versions of module
DELETE FROM `gameobject` WHERE map = 44;

-- Arena doors
DELETE FROM `gameobject` WHERE (`id` = 161523 AND `phaseMask` = 2);
INSERT INTO `gameobject` (`id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(161523, 230, 1584, 1584, 1, 2, 555.751, -199.744, -52.908, 0.261799, 0, 0, 0.130526, 0.991445, 600, 100, 1, '', 0, NULL);

DELETE FROM `gameobject` WHERE (`id` = 161524 AND `phaseMask` = 2);
INSERT INTO `gameobject` (`id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(161524, 230, 1584, 1584, 1, 2, 585.739, -147.762, -52.8988, 1.8326, 0, 0, 0.793354, 0.608761, 600, 100, 1, '', 0, NULL);

DELETE FROM `gameobject` WHERE (`id` = 161522 AND `phaseMask` = 2);
INSERT INTO `gameobject` (`id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(161522, 230, 1584, 1584, 1, 2, 637.64, -177.801, -52.8988, 0.261799, 0, 0, 0.130526, 0.991445, 600, 100, 1, '', 0, NULL);

DELETE FROM `gameobject` WHERE (`id` = 161525 AND `phaseMask` = 2);
INSERT INTO `gameobject` (`id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`, `Comment`) VALUES
(161525, 230, 1584, 1584, 1, 2, 607.668, -229.653, -52.8988, 1.8326, 0, 0, 0.793354, 0.608761, 600, 100, 1, '', 0, NULL);


-- For previous versions of module
DELETE FROM `creature` WHERE map = 44;

-- Trial of Strength / Arena Master ring of law spawn
DELETE FROM `creature` WHERE (`id1` = 441250);
INSERT INTO `creature` (`id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(441250, 0, 0, 230, 0, 0, 1, 2, 0, 603.344, -187.545, -54.150, 0.278, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL);

-- Spectators
DELETE FROM `creature` WHERE (`id1` = 441253);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(3110490, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 542.305, -194.327, -36.9744, 6.25495, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110491, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 542.214, -185.782, -36.9594, 6.18033, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110492, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 537.98, -190.601, -35.5491, 6.27458, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110493, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 545.026, -215.855, -35.5474, 0.439066, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110494, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 553.651, -228.154, -35.5041, 0.615779, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110495, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 544.147, -225.977, -34.1692, 0.439065, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110496, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 536.705, -211.319, -34.1997, 0.356598, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110497, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 552.763, -156.07, -36.9481, 5.65254, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110498, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 552.627, -150.37, -35.5195, 5.61327, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110499, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 561.071, -141.536, -35.5596, 5.35412, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110500, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 567.554, -132.5, -34.1289, 5.00069, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110501, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 542.687, -166.918, -35.4879, 5.99654, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110502, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 544.906, -173.564, -36.9526, 5.93764, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110503, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 610.379, -136.947, -36.9726, 4.32367, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110504, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 618.035, -135.245, -35.5556, 4.35116, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110505, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 622.4, -141.716, -36.9821, 4.41006, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110506, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 632.626, -142.743, -35.5957, 4.06056, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110507, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 639.352, -148.952, -35.5751, 3.80138, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110508, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 640.244, -143.197, -34.1653, 3.82887, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110509, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 651.282, -157.334, -34.1612, 3.55006, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110510, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 646.568, -159.374, -35.6114, 3.55006, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110511, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 645.338, -166.58, -37.0089, 3.55006, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110512, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 653.168, -172.665, -35.5925, 3.53435, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110513, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 650.625, -183.261, -36.9811, 3.2359, 300, 0, 0, 5052, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110514, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 655.154, -186.457, -35.5601, 3.20841, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110515, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 655.202, -195.439, -35.5745, 3.0317, 300, 0, 0, 5342, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110516, 441253, 0, 0, 230, 0, 0, 1, 2, 0, 653.229, -207.398, -35.2822, 2.82907, 300, 0, 0, 5194, 0, 0, 0, 0, 0, '', NULL, 0, NULL);


-- Wave 5
DELETE FROM `creature_template` WHERE `entry`=441517;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441517, 0, 0, 0, 0, 0, 328, 0, 0, 0, 'Rabbit', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);
DELETE FROM `creature_template` WHERE `entry`=441516;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441516, 0, 0, 0, 0, 0, 304, 0, 0, 0, 'Chicken', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);
DELETE FROM `creature_template` WHERE `entry`=441515;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441515, 0, 0, 0, 0, 0, 1060, 0, 0, 0, 'Cow', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);
DELETE FROM `creature_template` WHERE `entry`=441514;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441514, 0, 0, 0, 0, 0, 6297, 0, 0, 0, 'Frog', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);
DELETE FROM `creature_template` WHERE `entry`=441513;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441513, 0, 0, 0, 0, 0, 856, 0, 0, 0, 'Sheep', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);
DELETE FROM `creature_template` WHERE `entry`=441512;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441512, 0, 0, 0, 0, 0, 1418, 0, 0, 0, 'Rat', NULL, NULL, 0, 80, 80, 0, 16, 0, 1, 1.14286, 1, 1, 20, 1, 0, 0, 5, 2000, 2000, 1, 1, 0, 0, 2048, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 4, 1, 1, 0, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeCritter', -1);


-- Wave 4
DELETE FROM `creature_template` WHERE `entry`=441511;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441511, 0, 0, 0, 0, 0, 6977, 0, 0, 0, 'Radioactive Bot', '', '', 0, 80, 80, 0, 14, 0, 1, 0.35, 1, 1, 20, 1, 1, 0, 1, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 9, 8, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 2.5, 1, 1, 1, 0, 144, 1, 617284383, 0, 0, 'ToSAISpellRadioactive', -1);


-- Wave 3
DELETE FROM `creature_template` WHERE `entry`=441510;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441510, 0, 0, 0, 0, 0, 1065, 0, 0, 0, 'Leprithus', NULL, NULL, 0, 80, 80, 0, 21, 0, 0.777776, 1.14286, 1, 1, 20, 1, 1, 0, 3, 1500, 2000, 1, 1, 2, 0, 2048, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 4, 1, 1, 0, 0, 0, 1, 8388624, 0, 0, 'ToSAIMeleeNecrotic', -1);
DELETE FROM `creature_template` WHERE `entry`=441509;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441509, 0, 0, 0, 0, 0, 1202, 0, 0, 0, 'Hungering Dead', NULL, NULL, 0, 80, 80, 0, 21, 0, 1, 0.85714, 1, 1, 18, 1, 0, 0, 1.5, 1500, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1.5, 1, 1, 0, 0, 100, 1, 8388624, 0, 0, '', -1);
DELETE FROM `creature_template` WHERE `entry`=441508;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441508, 0, 0, 0, 0, 0, 1201, 0, 0, 0, 'Ravaged Corpse', NULL, NULL, 0, 80, 80, 0, 21, 0, 1, 0.85714, 1, 1, 18, 1, 0, 0, 1.5, 1500, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1.5, 1, 1, 0, 0, 100, 1, 8388624, 0, 0, '', -1);
DELETE FROM `creature_template` WHERE `entry`=441507;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441507, 0, 0, 0, 0, 0, 1200, 0, 0, 0, 'Rotting Dead', NULL, NULL, 0, 80, 80, 0, 21, 0, 1, 0.85714, 1, 1, 18, 1, 0, 0, 1.5, 1500, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1.5, 1, 1, 0, 0, 100, 1, 8388624, 0, 0, 'ToSAIMeleeNecrotic', -1);

-- Wave 2
DELETE FROM `creature_template` WHERE `entry`=441506;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441506, 0, 0, 0, 0, 0, 2029, 0, 0, 0, 'Edwin VanCleef', 'Defias Kingpin', NULL, 0, 80, 80, 0, 17, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 5, 2000, 2000, 1, 1, 1, 64, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 3, 1, 1, 2, 0, 0, 1, 0, 0, 0, '', -1);
DELETE FROM `creature_template` WHERE `entry`=441505;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441505, 0, 0, 0, 0, 0, 2338, 2339, 0, 0, 'Defias Pillager', '', NULL, 0, 80, 80, 0, 17, 0, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 8, 32768, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 2, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'ToSAISpellElemental', -1);
DELETE FROM `creature_template` WHERE `entry`=441504;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441504, 0, 0, 0, 0, 0, 4418, 4419, 0, 0, 'Defias Smuggler', '', NULL, 0, 80, 80, 0, 17, 0, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 32768, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeAngry', -1);
DELETE FROM `creature_template` WHERE `entry`=441503;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441503, 0, 0, 0, 0, 0, 2331, 2332, 0, 0, 'Defias Trapper', '', NULL, 0, 80, 80, 0, 17, 0, 1, 1.14286, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 32768, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 'ToSAIMeleeTrapper', -1);

-- Wave 1
DELETE FROM `creature_template` WHERE `entry`=441502;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441502, 0, 0, 0, 0, 0, 384, 0, 0, 0, 'Hogger', NULL, NULL, 0, 80, 80, 0, 20, 0, 1.2, 1.14286, 1, 1, 20, 1, 1, 0, 5, 2000, 2000, 1, 1, 1, 64, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 3, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', -1);
DELETE FROM `creature_template` WHERE `entry`=441501;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441501, 0, 0, 0, 0, 0, 10791, 0, 0, 0, 'Riverpaw Runt', NULL, NULL, 0, 80, 80, 0, 20, 0, 1, 0.85714, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1, 1, 1, 1, 0, 100, 1, 0, 0, 0, 'ToSAIMeleeAngry', -1);
DELETE FROM `creature_template` WHERE `entry`=441500;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (441500, 0, 0, 0, 0, 0, 512, 0, 0, 0, 'Riverpaw Outrunner', NULL, NULL, 0, 80, 80, 0, 20, 0, 1.2, 0.85714, 1, 1, 18, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 1, 1, 1, 1, 0, 100, 1, 0, 0, 0, '', -1);


DELETE FROM `creature_equip_template` WHERE `CreatureID`=441506 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441506, 1, 2179, 2147, 0, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441505 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441505, 1, 1907, 0, 0, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441504 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441504, 1, 5281, 0, 6886, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441503 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441503, 1, 5278, 0, 0, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441502 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441502, 1, 1905, 0, 0, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441501 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441501, 1, 1895, 0, 0, 18019);
DELETE FROM `creature_equip_template` WHERE `CreatureID`=441500 AND `ID`=1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (441500, 1, 1905, 0, 0, 18019);
