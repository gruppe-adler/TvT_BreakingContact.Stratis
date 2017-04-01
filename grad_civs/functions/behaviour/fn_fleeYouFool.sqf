_thisUnit = _this select 0;
_group = group _thisUnit;

if (vehicle _thisUnit != _thisUnit && random 2 > 0.5) then {
	dostop _thisUnit; 
	sleep 1;	
	_group leaveVehicle (vehicle _thisUnit);
};

diag_log format ["civ %1 is fleeing", _thisUnit];

_animationHiding = ["Acts_CivilHiding_1", "Acts_CivilHiding_2"];
_animationSitting = ["Acts_CivilShocked_1", "Acts_CivilShocked_2"];

_pos = [position _thisUnit] call GRAD_civs_fnc_findPositionOfInterest;

_thisUnit setBehaviour "SAFE";
_thisUnit doMove _pos;
diag_log format ["buildingpos is %1", _pos];
_thisUnit setSpeedMode "FULL";
_thisUnit forceSpeed 25;
_thisUnit playMove "SprintCivilBaseDf";				
_thisUnit setVariable ["GRAD_fleeing", true];

diag_log format ["civ %1 is fleeing to building", _thisUnit];
sleep (14 - (random 10));

_thisUnit playMoveNow (selectRandom _animationHiding); 
_thisUnit stop true;
_thisUnit enableDynamicSimulation true;