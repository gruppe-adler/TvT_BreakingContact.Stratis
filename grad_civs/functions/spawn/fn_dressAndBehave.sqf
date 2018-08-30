/*
 civ unit redressing
*/


params ["_unit"];
_unit setVariable ["asr_ai_exclude", true];
/*
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
	_return = true;
	_return
};
*/


//_unitLoadout = [[],[],[],[""LOP_U_AM_Fatigue_01"",[]],[],[],""LOP_H_Pakol"","""",[],["""","""","""","""","""",""""]];

_unitLoadout = [[],[],[],[selectRandom GRAD_civ_clothes,[]],[],[],selectRandom GRAD_civ_headgear,"""",[],["""","""","""","""","""",""""]];


_reclotheHim = {
	params ["_guy", "_loadout"];
	
	_guy setUnitLoadout _loadout;

	[[_guy, selectRandom GRAD_civ_faces], "setCustomFace"] call BIS_fnc_MP;
	_guy setVariable ["BIS_noCoreConversations", true];
	
};

_addBeard = {
	params ["_guy"];

	_firstBeard = GRAD_civ_beards select 0;
	// add beards if possible
	if (!(isClass (configfile >> "CfgGlasses" >> "TRYK_Beard"))) exitWith {};

   	_guy addGoggles selectRandom GRAD_civ_beards;
};

_addBackpack = {
	params ["_unit"];

	if (random 2 > 1) then {
		_unit addBackpackGlobal "rhs_sidor";
	};
};



_addBehaviour = {
	group (_this select 0) setBehaviour "CARELESS";
	(_this select 0) disableAI "FSM";
};


_addKilledNews = {
   (_this select 0) addEventhandler ["Killed",
    {
     CIV_KILLED = [(position (_this select 0)), (_this select 0) getVariable ["ace_medical_lastDamageSource", objNull]];
     diag_log format ["civ killed: %1",CIV_KILLED];
     publicVariableServer "CIV_KILLED";
     
     (_this select 0) removeAllEventHandlers "Killed";
     (_this select 0) removeAllEventHandlers "FiredNear";
     (_this select 0) switchMove "";
     GRAD_CIV_ONFOOT_COUNT = GRAD_CIV_ONFOOT_COUNT - 1;
     GRAD_CIV_ONFOOT_GROUPS = GRAD_CIV_ONFOOT_GROUPS - [(_this select 0)];
    }];
};

// _stripped = [_unit] call _stripHim;
[_unit, _unitLoadout] call _reclotheHim;


[_unit] call _addKilledNews;
[_unit] call _addBehaviour;
[_unit] call _addBeard;
[_unit] call _addBackpack;