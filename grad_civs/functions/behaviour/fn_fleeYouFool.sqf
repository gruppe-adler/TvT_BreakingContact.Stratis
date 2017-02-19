_thisUnit = _this select 0;
_group = group _thisUnit;

diag_log format ["civ %1 is fleeing", _thisUnit];

_animationHiding = ["Acts_CivilHiding_1", "Acts_CivilHiding_2"];
_animationSitting = ["Acts_CivilShocked_1", "Acts_CivilShocked_2"];



_buildingPositions = [];

_buildingPositions = nearestBuilding _thisUnit buildingPos -1;

	 		
//hintSilent format ["%1",_bla select 0];
if (count _buildingPositions > 0) then {
	_thisUnit setBehaviour "SAFE";
	_pos = selectRandom _buildingPositions;
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
 	
} else {
	_pos = [_thisUnit,[5,20],random 360] call SHK_pos;
	_thisUnit doMove _pos;
	_thisUnit setSpeedMode "FULL";
	_thisUnit forceSpeed 20;
	_thisUnit playMove "SprintCivilBaseDf";				
	_thisUnit setVariable ["GRAD_fleeing", true];

	diag_log format ["civ %1 is fleeing to %2", _thisUnit, _pos];
	sleep (14 - (random 10));

	_thisUnit playMoveNow (selectRandom _animationSitting); 
	_thisUnit stop true;
 	_thisUnit removeAllEventHandlers "FiredNear";
};