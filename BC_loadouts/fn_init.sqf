BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

// make sure you use same identifier for loadout as for buyable

private _factionsBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesBlufor = (_factionsBlufor select BUYABLES_BLUFOR_INDEX);

private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesOpfor =  (_factionsOpfor select BUYABLES_OPFOR_INDEX);

private _loadoutsBlufor = [(_buyablesBlufor >> "loadout"), "text", ""] call CBA_fnc_getConfigEntry;
private _loadoutsOpfor = [(_buyablesOpfor >> "loadout"), "text", ""] call CBA_fnc_getConfigEntry;
diag_log format ["setting loadout to %1 vs %2", _loadoutsOpfor, _loadoutsBlufor];

["BLU_F", _loadoutsBlufor] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", _loadoutsOpfor] call GRAD_Loadout_fnc_FactionSetLoadout;
["CIV_F", "referee"] call GRAD_Loadout_fnc_FactionSetLoadout;