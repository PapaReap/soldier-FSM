//Set default settings unless previously defined
if(isNil "SFSM_FlinchTreshHold")
then{
		SFSM_disableSoldierFSM  = false; // disable soldier FSM
		SFSM_Debugger			= true;  // show debug-info, and 3D markers
		SFSM_allowFlinching     = true;  // Units will flinch on incoming fire.
		SFSM_allowDodging       = true;  // Units will dodge(change position) when incoming fire reaches the treshHold (SFSM_RpsDodgeTrigger).
		SFSM_hideFromVehicles   = true;  // Units will run away / hide from vehicles they cannot hurt.
		SFSM_AtSpecHuntVehicles = true;  // Units with launchers will target enemy vehicles instead of hiding.
        SFSM_mgSuppressClusters = true;  // MachineGunners will spray enemy positions upon initial contact
		SFSM_enableCustomEH     = true;  // disable custom eventhandler for enemy-spotted. Deactivating this is VERY good for performance.
		SFSM_ExcludeZcommand    = false; // stop units that have been given waypoints by a curator from dodging
		SFSM_PlayerGrpDodge     = false; // Allows units in a group lead by a player to dodge / hide, dodging can be frustrating for players who like to micro-manage their AI

		SFSM_FlinchTreshHold 	= 1;	 // unit will not flinch if suppression is higher than this value
		SFSM_ProneTreshHold 	= 0.8;	 // unit will stay prone if suppression is higher than this value
		SFSM_FlinchCoolDown		= 5;	 // Minimum Time between each flinch-response
		SFSM_RpsDodgeTrigger	= 4;	 // Continous Incoming bullets with no less than 1 second break, to trigger Dodging
		SFSM_DodgeCoolDown		= 10;	 // Time between each dodge-response
		SFSM_DodgeDistance		= 70;	 // How far the man will run when dodging
		SFSM_DodgeTimer			= 30;	 // max time before ending a dodge.
		SFSM_forceDodge			= true;  // Override the Vanilla FSM in order to force the unit to move when dodging
		SFSM_noCoverPanic       = true;  // unit will panic upon initiating a battle if no cover is found
		SFSM_reactFireCoolDown	= 180; 	 // Time between each returnFire-response		
		SFSM_panicCoef          = 0.5;   // chance that a man will panic upon start of engagement if he cannot see a cover-position

		SFSM_KnowledgeToFight   = 0;     // the amount of knowledge needed to start a battle between 2 units.
		SFSM_sprintSpeed        = 1.3;   // speed coef for dodging / taking cover / hiding. 1 = vanilla. 2 = twice the normal speed
		SFSM_stayCoverPosTime   = 15;    // the amount of time the soldier will stay in his position upon taking cover.
		SFSM_flinchStopDodge    = true;  // if this is toggled then the unit will stop running towards cover and instead flinch
		SFSM_emergencyRearm     = true   // Soldiers pick up launchers from killed squad-mates, or off the ground if a vehicle is nearby
};


//Make sure settings are available globally.

missionNamespace setVariable ["SFSM_FlinchTreshHold",	SFSM_FlinchTreshHold, 	true];
missionNamespace setVariable ["SFSM_ProneTreshHold", 	SFSM_ProneTreshHold, 	true];
missionNamespace setVariable ["SFSM_FlinchCoolDown", 	SFSM_FlinchCoolDown, 	true];
missionNamespace setVariable ["SFSM_RpsDodgeTrigger", 	SFSM_RpsDodgeTrigger, 	true];
missionNamespace setVariable ["SFSM_DodgeCoolDown", 	SFSM_DodgeCoolDown, 	true];
missionNamespace setVariable ["SFSM_DodgeDistance", 	SFSM_DodgeDistance, 	true];
missionNamespace setVariable ["SFSM_DodgeTimer", 		SFSM_DodgeTimer, 		true];
missionNamespace setVariable ["SFSM_forceDodge", 		SFSM_forceDodge, 		true]; 
 
missionNamespace setVariable ["SFSM_Debugger", 			SFSM_Debugger, 			true]; 
missionNamespace setVariable ["SFSM_noCoverPanic", 		SFSM_noCoverPanic, 		true];
missionNamespace setVariable ["SFSM_reactFireCoolDown", SFSM_reactFireCoolDown, true];
missionNamespace setVariable ["SFSM_ExcludeZcommand", 	SFSM_ExcludeZcommand, 	true];
missionNamespace setVariable ["SFSM_PlayerGrpDodge", 	SFSM_PlayerGrpDodge, 	true];
missionNamespace setVariable ["SFSM_hideFromVehicles", 	SFSM_hideFromVehicles, 	true];
missionNamespace setVariable ["SFSM_AtSpecHuntVehicles",SFSM_AtSpecHuntVehicles,true];
missionNamespace setVariable ["SFSM_mgSuppressClusters",SFSM_mgSuppressClusters,true];
missionNamespace setVariable ["SFSM_disableSoldierFSM", SFSM_disableSoldierFSM, true];
missionNamespace setVariable ["SFSM_enableCustomEH",    SFSM_enableCustomEH,    true];
missionNamespace setVariable ["SFSM_allowFlinching",    SFSM_allowFlinching,    true];
missionNamespace setVariable ["SFSM_allowDodging",      SFSM_allowDodging,      true];
missionNamespace setVariable ["SFSM_panicCoef",         SFSM_panicCoef,         true];
missionNamespace setVariable ["SFSM_KnowledgeToFight",  SFSM_KnowledgeToFight,  true];
missionNamespace setVariable ["SFSM_sprintSpeed",       SFSM_sprintSpeed,       true];
missionNamespace setVariable ["SFSM_emergencyRearm",    SFSM_emergencyRearm,       true];

true;