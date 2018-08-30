#include "\z\ace\addons\main\script_component.hpp"

params ["_position"];

["Preparing teleport..."] call EFUNC(common,displayTextStructured);
cutText ["", "BLACK OUT", 0.1];
if (str player != "opfor_teamlead") then { sleep (random 7);};

private _emptyPosition = _position findEmptyPosition[2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _emptyPosition];

sleep 1;

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

["<img size= '6' shadow='false' image='pic\kv13gaopt.paa'/><br/>
<t size='.9' color='#FFFFFF'>Breaking Contact</t>",0,0,2,2] spawn BIS_fnc_dynamicText;

BIS_fnc_establishingShot_skip = true; // just in case its necessary