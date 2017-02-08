/*
 civ units made from rhs or rds
*/

randomCivilian = {
	_unit = _this select 0;

	_uniform = [
		"LOP_U_AM_Fatigue_01",
	    "LOP_U_AM_Fatigue_01_2",
	    "LOP_U_AM_Fatigue_01_3",
	    "LOP_U_AM_Fatigue_01_4",
	    "LOP_U_AM_Fatigue_01_5",
	    "LOP_U_AM_Fatigue_01_6",
	    "LOP_U_AM_Fatigue_02",
	    "LOP_U_AM_Fatigue_02_2",
	    "LOP_U_AM_Fatigue_02_3",
	    "LOP_U_AM_Fatigue_02_4",
	    "LOP_U_AM_Fatigue_02_5",
	    "LOP_U_AM_Fatigue_02_6",
	    "LOP_U_AM_Fatigue_03",
	    "LOP_U_AM_Fatigue_03_2",
	    "LOP_U_AM_Fatigue_03_3",
	    "LOP_U_AM_Fatigue_03_4",
	    "LOP_U_AM_Fatigue_03_5",
	    "LOP_U_AM_Fatigue_03_6",
	    "LOP_U_AM_Fatigue_04",
	    "LOP_U_AM_Fatigue_04_2",
	    "LOP_U_AM_Fatigue_04_3",
	    "LOP_U_AM_Fatigue_04_4",
	    "LOP_U_AM_Fatigue_04_5",
	    "LOP_U_AM_Fatigue_04_6"
	] call BIS_fnc_selectRandom;

	_headgear = [
	    "LOP_H_Turban",
        "LOP_H_Turban",
        "LOP_H_Pakol",
        "LOP_H_Pakol",
        "LOP_H_Pakol",
        "LOP_H_Pakol"
	] call BIS_fnc_selectRandom;

	_taliFaces = [
		"PersianHead_A3_01",
		"PersianHead_A3_02",
		"PersianHead_A3_03",
		"PersianHead_A3_01",
		"PersianHead_A3_02",
		"PersianHead_A3_03",
		"PersianHead_A3_01",
		"PersianHead_A3_02",
		"PersianHead_A3_03",
		"WhiteHead_08",
		"WhiteHead_16",
		"GreekHead_A3_01",
		"GreekHead_A3_02",
		"GreekHead_A3_03",
		"GreekHead_A3_04"
	] call BIS_fnc_selectRandom;




	_stripHimEngima = {
		_it = _this select 0;
			removeAllWeapons _it;
			removeAllItems _it;
			removeAllAssignedItems _it;
			removeUniform _it;
			removeVest _it;
			removeBackpack _it;
			removeHeadgear _it;
			removeGoggles _it;	
	};

	_reclotheHimEngima = {
		_guy = _this select 0;
		_guy forceAddUniform _uniform;
		if (random 2 > 1) then {
			_guy addHeadgear _headgear;
		};

		[[_guy,_taliFaces], "setCustomFace"] call BIS_fnc_MP;
		_guy setVariable ["BIS_noCoreConversations", true];
		
	};

	

	_addBehaviourEngima = {
		group (_this select 0) setBehaviour "CARELESS";
		(_this select 0) disableAI "TARGET";
		(_this select 0) disableAI "AUTOTARGET";
	};


    _addKilledNewsEngima = {
       (_this select 0) addEventhandler ["Killed",
        {
         CIV_KILLED = [(position (_this select 0)), (_this select 0) getVariable ["ace_medical_lastDamageSource", objNull]];
         diag_log format ["civ killed: %1",CIV_KILLED];
         publicVariableServer "CIV_KILLED";
         (_this select 0) removeAllEventHandlers "Killed";
         (_this select 0) removeAllEventHandlers "FiredNear";
        }];

    };

    _addGunfightNewsEngima = {
       (_this select 0) addEventhandler ["FiredNear",
        {
         CIV_GUNFIGHT_POS = (position (_this select 0));
         diag_log format ["civ gunfight at %1",CIV_GUNFIGHT_POS];
         publicVariableServer "CIV_GUNFIGHT_POS";
        }];

    };

	[_unit] call _stripHimEngima;
	sleep 0.1;
	[_unit] call _reclotheHimEngima;
	// [_unit] call addFleeingBehaviour;
    [_unit] call _addKilledNewsEngima;
    [_unit] call _addGunfightNewsEngima;
    [_unit] call _addBehaviourEngima;
};