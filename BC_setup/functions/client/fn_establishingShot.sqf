/*
    Author: Thomas Ryan

    ripped and modified by nomisum for BC
*/

if (missionNamespace getVariable ["BIS_fnc_establishingShot_skip", false]) exitWith { diag_log format ["skipping establishing shot completely for jip"]; };

params [
   ["_tgt", objNull, [objNull, []]],
   ["_txt", "", [""]],
   ["_alt", 500, [500]],
   ["_rad", 200, [200]],
   ["_ang", random 360, [0]],
   ["_dir", round random 1, [0]],
   ""
];


0 fadeSound 0;
"down" cutText ["loading", "BLACK FADED", 10e10];

disableSerialization;

waitUntil {!(isNull ([] call BIS_fnc_displayMission))};


if (playerSide == east) then {
    100 cutRsc ["gui_opfor_pleasewait", "PLAIN",0];

} else {
    100 cutRsc ["gui_blufor_pleasewait","PLAIN",0];
};

[{
    (BLUFOR_TELEPORT_TARGET select 0 != 0) || player getVariable ["BC_choosingSpawn", false]
},
{
    2 fadeSound 1;
    100 cutText ["", "PLAIN"];
    enableEnvironment true;
    openMap [true, false];
    "down" cutText ["", "PLAIN"];
}] call CBA_fnc_waitUntilAndExecute;
