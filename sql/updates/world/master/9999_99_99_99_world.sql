-- Quest: Razorbeak Friends (26546)

-- Smart_script
-- Trained Razorbeak SAI
SET @ENTRY := 2657;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4500,14000,15000,11,3147,0,0,0,0,0,2,0,0,0,0,0,0,0,'Trained Razorbeak - In Combat - Cast Rend Flesh'),
(@ENTRY,0,1,2,8,0,100,0,80782,0,0,0,33,43236,0,0,0,0,0,7,0,0,0,0,0,0,0,'Trained Razorbeak - On Spellhit Feed Trained Razorbeak - Quest Credit'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,114,0,0,0,0,0,0,1,0,0,0,0,0,190,0,'Trained Razorbeak - On Spellhit - Move Z'),
(@ENTRY,0,3,0,34,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Trained Razorbeak - On MovementInform - Despawn Instant');

-- This allow player to complete quest with items choice
UPDATE `quest_template` SET `RewardChoiceItemId1` = 59235,`RewardChoiceItemQuantity1` = 1,`RewardChoiceItemId2` = 59236,`RewardChoiceItemQuantity2` = 1,`RewardChoiceItemId3` = 59237,`RewardChoiceItemQuantity3` = 1,`RewardChoiceItemId4` = 59238,`RewardChoiceItemQuantity4` = 1,`RewardChoiceItemId5` = 134553,`RewardChoiceItemQuantity5` = 1 WHERE `Id`=26546;

-- Spell can be used only on Trained Razorbeak
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=80782;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,80782,0,0,31,1,3,2657,0,0,0,0,'','');