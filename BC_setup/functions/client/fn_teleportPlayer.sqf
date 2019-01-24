#include "\z\ace\addons\main\script_component.hpp"

params ["_position"];

["Preparing teleport..."] call EFUNC(common,displayTextStructured);
cutText ["", "BLACK OUT", 0.1];
if (str player != "opfor_teamlead") then { sleep (random 7);};

private _emptyPosition = [];
private _foundPosition = false;
while {!_foundPosition} do {
    _emptyPosition = [_position, 15, 50, 3, 0, 20, 0] call BIS_fnc_findSafePos; // _position findEmptyPosition [15, 30, "B_Soldier_F"];
    _foundPosition = count _emptyPosition > 0;
    diag_log ["searching teleport target for player: %1", _emptyPosition];
    sleep 0.1;
};

diag_log format ["teleporting %1 to %2.", player, _emptyPosition];

sleep 1;

player setVariable ["BC_choosingSpawn", true];

playSound "beam";
player setPos _emptyPosition;
openMap [false, false];
hintSilent "";

sleep 2;
cutText ["", "BLACK IN", 1];

// make player vulnerable again if necessary
player allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;
sleep 1;
cutText ["", "PLAIN"];

["<img size= '8' shadow='false' image='pic\bc_logo.paa'/>",0,0,4,2] spawn BIS_fnc_dynamicText;

BIS_fnc_establishingShot_skip = true; // just in case its necessary