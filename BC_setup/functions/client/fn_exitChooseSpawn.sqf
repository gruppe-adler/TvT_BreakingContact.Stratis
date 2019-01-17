params ["_display", "_exitCode"];

if (_exitCode == 2) then {

    [{
        [] call BC_setup_fnc_chooseSpawn;
    }, 1] call CBA_fnc_waitAndExecute;

};