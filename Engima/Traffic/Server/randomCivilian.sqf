/*
 civ units made from rhs or rds
*/

randomCivilian = {
	_unit = _this select 0;

	_rds_rhs_civilian = [
	"rds_uniform_Worker1",
	"rds_uniform_Worker2",
	"rds_uniform_Worker3",
	"rds_uniform_Worker4",
	"rds_uniform_Woodlander1",
	"rds_uniform_Woodlander2",
	"rds_uniform_Woodlander3",
	"rds_uniform_Woodlander4",
	"rds_uniform_Villager1",
	"rds_uniform_Villager2",
	"rds_uniform_Villager3",
	"rds_uniform_Villager4",
	"rds_uniform_Profiteer1",
	"rds_uniform_Profiteer2",
	"rds_uniform_Profiteer3",
	"rds_uniform_Profiteer4",
	"rds_uniform_citizen1",
	"rds_uniform_citizen2",
	"rds_uniform_citizen3",
	"rds_uniform_citizen4"
	] call BIS_fnc_selectRandom;

	_rhsHeadGear = [
	"rds_Villager_cap1",
	"rds_Villager_cap2",
	"rds_Villager_cap3",
	"rds_Villager_cap4",
	"rds_worker_cap1",
	"rds_worker_cap2",
	"rds_worker_cap3",
	"rds_worker_cap4",
	"rds_Profiteer_cap1",
	"rds_Profiteer_cap2",
	"rds_Profiteer_cap3",
	"rds_Profiteer_cap4",
	"rhs_beanie_green",
	"rhs_beanie_green"
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




	_stripHim = {
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

	_reclotheHim = {
		_guy = _this select 0;
		_guy forceAddUniform _rds_rhs_civilian;
		if (random 2 > 1) then {
			_guy addHeadgear _rhsHeadGear;
		};

		[[_guy,_taliFaces], "setCustomFace"] call BIS_fnc_MP;
		_guy setVariable ["BIS_noCoreConversations", true];
		
	};

	/*
	addFleeingBehaviour = {
		(_this select 0) setVariable ["fleeing",false];

		(_this select 0) addEventHandler ["FiredNear", {

			if ((_this select 0) getVariable "fleeing" == "true") exitWith {};

			_thisUnit = _this select 0;		

			sleep (random 1);
		 	{[_x] execVM "Engima\Traffic\Server\fleeYouFool.sqf";} forEach crew (vehicle _thisUnit);
		}];
	};*/

	addBehaviour = {
		group (_this select 0) setBehaviour "CARELESS";
		(_this select 0) disableAI "TARGET";
		(_this select 0) disableAI "AUTOTARGET";
	};


    addKilledNews = {
       (_this select 0) addEventhandler ["Killed",
        {
         CIV_KILLED_POS = (position (_this select 0));
         diag_log format ["civ killed at %1",CIV_KILLED_POS];
         publicVariableServer "CIV_KILLED_POS";
         (_this select 0) removeAllEventHandlers "Killed";
         (_this select 0) removeAllEventHandlers "FiredNear";
        }];

    };

    addGunfightNews = {
       (_this select 0) addEventhandler ["FiredNear",
        {
         CIV_GUNFIGHT_POS = (position (_this select 0));
         diag_log format ["civ gunfight at %1",CIV_GUNFIGHT_POS];
         publicVariableServer "CIV_GUNFIGHT_POS";
        }];

    };

	[_unit] call _stripHim;
	sleep 0.1;
	[_unit] call _reclotheHim;
	// [_unit] call addFleeingBehaviour;
    [_unit] call addKilledNews;
    [_unit] call addGunfightNews;
    [_unit] call addBehaviour;
};