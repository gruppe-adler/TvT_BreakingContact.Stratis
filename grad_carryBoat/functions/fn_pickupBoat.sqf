#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

/*

"GRAD_carryBoat_status" Variable

0 - not carrying anything
1 - carrying a boat
2 - pressed mouse button to place boat

*/

params ["_boat"];
// "B_Boat_Transport_01_F" createVehicleLocal [position player select 0,position player select 1,100];
[player] call ace_weaponselect_fnc_putWeaponAway;
sleep 1;

// sounds
private _strains = [
"strain1",
"strain2",
"strain3",
"strain4"
];

[localize "str_GRAD_carry_place","",""] call EFUNC(interaction,showMouseHint);

private _mouseClickEH = (findDisplay 46) displayAddEventHandler [
      "MouseButtonDown",
      "_this call GRAD_carryBoat_fnc_interpretMouseClick"
];
private _mouseWheelEH = (findDisplay 46) displayAddEventHandler [
      "MouseZChanged",
      "_this call GRAD_carryBoat_fnc_interpretMouseWheel"
];

inGameUISetEventHandler ["PrevAction", "true"];
inGameUISetEventHandler ["NextAction", "true"];



private _carryAttachX = 0;
private _carryAttachY = 4.5;
private _carryAttachH = 1.5;

_boat setVariable ["GRAD_carryBoat_attachPosition", [_carryAttachX, _carryAttachY, _carryAttachH]];


_boat attachTo [player,[_carryAttachX, _carryAttachY, _carryAttachH]];
player setVariable ["GRAD_carryBoat_status",1];
addCamShake [5, 1, 10];
playSound "pick";


[{
    params ["_args", "_handle"];
    _args params ["_boat", "_strains", "_mouseClickEH", "_mouseWheelEH"];

    // dropped boat, exit loop
    if (player getVariable ["GRAD_carryBoat_status",0] != 1) exitWith {
          [_handle] call CBA_fnc_removePerFrameHandler;
          [_boat, _mouseClickEH, _mouseWheelEH] call GRAD_carryBoat_fnc_dropBoat;
    };

    // drain fatigue
    player setFatigue ((getFatigue player) + 0.05);

    // add camshake
    if (getFatigue player > 0.5 && getFatigue player < 0.7) then {
        addCamShake [2, 1, 2];
    };

    // play sounds
    if (getFatigue player >= 0.7 && getFatigue player < 0.9) then {
        addCamShake [3, 1, 5];
        if (random 10 > 9) then {
        playSound (selectrandom _strains);
      };
    };

    if (getFatigue player >= 0.9) then {
      addCamShake [5, 1, 10];
      if (random 3 > 2) then {
        playSound (selectrandom _strains);
      };
    };

    if (getFatigue player > 0.9) then {
      player setVariable ["GRAD_carryBoat_status",2];
    };

},1, [_boat, _strains, _mouseClickEH, _mouseWheelEH]] call CBA_fnc_addPerFrameHandler;