_class = _this select 0;
_side = _this select 1;

if (_side == west) then {
	[player, "Russian_Rifleman"] call BIS_fnc_removeRespawnInventory;
	[player, "Russian_Medic"] call BIS_fnc_removeRespawnInventory;
	[player, "Russian_Marksman"] call BIS_fnc_removeRespawnInventory;
	[player, "Russian_AT"] call BIS_fnc_removeRespawnInventory;
	[player, "Russian_MG"] call BIS_fnc_removeRespawnInventory;

	[player, _class] call BIS_fnc_addRespawnInventory;
};

switch (_class) {

	case "Russian_MG": { PC_RUSSIAN_MG = PC_RUSSIAN_MG + 1; publicVariable "PC_RUSSIAN_MG"; };
	case "Russian_AT": { PC_RUSSIAN_AT = PC_RUSSIAN_AT + 1; publicVariable "PC_RUSSIAN_AT"; };
	case "Russian_Marksman": { PC_RUSSIAN_MARKSMAN = PC_RUSSIAN_MARKSMAN + 1; publicVariable "PC_RUSSIAN_MARKSMAN"; };
	case "Russian_Medic": { PC_RUSSIAN_MEDIC = PC_RUSSIAN_MEDIC + 1; publicVariable "PC_RUSSIAN_MEDIC"; };
	
	case "Taliban_MG": { PC_TALIBAN_MG = PC_TALIBAN_MG + 1; publicVariable "PC_TALIBAN_MG"; };
	case "Taliban_AT": { PC_TALIBAN_AT = PC_TALIBAN_AT + 1; publicVariable "PC_TALIBAN_AT"; };
	case "Taliban_Marksman": { PC_TALIBAN_MARKSMAN = PC_TALIBAN_MARKSMAN + 1; publicVariable "PC_TALIBAN_MARKSMAN"; };
	case "Taliban_Medic": { PC_TALIBAN_MEDIC = PC_TALIBAN_MEDIC + 1; publicVariable "PC_TALIBAN_MEDIC"; };
	
	default: {};	

};