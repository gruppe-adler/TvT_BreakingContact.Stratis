#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

/*

"carryBoat" Variable

0 - not carrying anything
1 - carrying a boat
2 - pressed mouse button to place boat

*/
hint "bla2";

carryBoat = _this select 0; // "B_Boat_Transport_01_F" createVehicleLocal [position player select 0,position player select 1,100];
[player] call ace_weaponselect_fnc_putWeaponAway;
sleep 1;

// sounds
_strains = [
"strain1",
"strain2",
"strain3",
"strain4"
];


interpretMouseClick = {
  if ((_this select 1) == 0) then {
    player setVariable ["carryBoat",2];
  };
  // hintSilent format ["%1",_this];
};

interpretMouseWheel = {
  _min = 1;
  _max = 2;
  if ((_this select 1) > 1 && (carryAttachH < _max)) then {
    carryAttachH = carryAttachH + 0.1;
    addCamShake [4, 1, 2];
  };
  if ((_this select 1) < -1 && (carryAttachH > _min)) then {
    carryAttachH = carryAttachH - 0.1;
    addCamShake [4, 1, 2];
  };
  carryBoat attachTo [player,[carryAttachX, carryAttachY, carryAttachH]];
  // hintSilent format ["%1",_this];
};


[localize "str_GRAD_carry_place","",""] call EFUNC(interaction,showMouseHint);
_mouseClickEH = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call interpretMouseClick"];
_mouseWheelEH = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call interpretMouseWheel"];

inGameUISetEventHandler ["PrevAction", "true"];
inGameUISetEventHandler ["NextAction", "true"];



carryAttachX = 0;
carryAttachY = 4.5;
carryAttachH = 1.5;


carryBoat attachTo [player,[carryAttachX, carryAttachY, carryAttachH]];
player setVariable ["carryBoat",1];
addCamShake [5, 1, 10];
playSound selectRandom ["pick"];




// hintSilent parseText format ["<t size='1'>" + "str_GRAD_carry_hint1" + "</t><br/><t size='2'>%1 s<br/>" +"</t><t size='1'>" + "str_GRAD_carry_hint1" + "</t>",_maxTime];

// sound and fatigues
[_strains] spawn {
  _sounds = _this select 0;

      while {(player getVariable ["carryBoat",0] == 1)} do {

        
        player setFatigue ((getFatigue player) + 0.05);

            if (getFatigue player > 0.5 && getFatigue player < 0.7) then {
                addCamShake [2, 1, 2];
            };

            if (getFatigue player >= 0.7 && getFatigue player < 0.9) then {
                addCamShake [3, 1, 5];
                if (random 10 > 9) then {
                playSound (selectrandom _sounds);
              };
            };

            if (getFatigue player >= 0.9) then {
              addCamShake [5, 1, 10];
              if (random 3 > 2) then {
                playSound (selectrandom _sounds);
              };
            };

            if (getFatigue player > 0.9) then {
              player setVariable ["carryBoat",2];
            };
        sleep 1;
      };
};

waitUntil {(player getVariable ["carryBoat",0] == 2)};

detach carryBoat;
addCamShake [10, 1, 3];
carryBoat setVelocity [velocity player select 0, velocity player select 1, 1];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseClickEH];
(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", _mouseWheelEH];

// play sound depending on fatigue
if (getFatigue player < 0.4) then {
  playSound "release_easy";
};
if (getFatigue player >= 0.4 && getFatigue player < 0.75) then {
  playSound "release_medium";
};
if (getFatigue player >= 0.75) then {
  playSound "release_hard";
};

[] call EFUNC(interaction,hideMouseHint);

inGameUISetEventHandler ["PrevAction", "false"];
inGameUISetEventHandler ["NextAction", "false"];
player setVariable ["carryBoat",0];
carryBoat allowdamage true;