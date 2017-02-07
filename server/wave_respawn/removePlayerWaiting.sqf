params ["_unit","_side"];

switch (_side) do {
    case (WEST): {
        if (_unit in deadPlayersBlu) then {
            deadPlayersBlu deleteAt (([deadPlayersBlu,_unit] call BIS_fnc_arrayFindDeep) select 0);
            diag_log format ["Player %1 respawned and has been removed from deadPlayersBlu.", name _unit];
        } else {
            diag_log format ["Player %1 is not in deadPlayersBlu.", name _unit];
        };
    };

    case (EAST): {
        if (_unit in deadPlayersOpf) then {
            deadPlayersOpf deleteAt (([deadPlayersOpf,_unit] call BIS_fnc_arrayFindDeep) select 0);
            diag_log format ["Player %1 respawned and has been removed from deadPlayersOpf.", name _unit];
        } else {
            diag_log format ["Player %1 is not in deadPlayersOpf", name _unit];
        };
    };

    default {diag_log format ["Player %1 is neither WEST nor EAST.", name _unit];
};