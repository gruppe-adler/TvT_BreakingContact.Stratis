_thisUnit = _this select 0;
_group = group _thisUnit;

_animationHiding = ["Acts_CivilHiding_1", "Acts_CivilHiding_2"];
_animationSitting = ["Acts_CivilShocked_1", "Acts_CivilShocked_2"];

while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};

_thisUnit disableAI "FSM";

_buildingPosition = 0;

_building = nearestObjects [_thisUnit, ["House", "Building"], 100] select 0;
if (!isNull _building) then {
	_buildingPosition = [_building] call BIS_fnc_buildingPositions;
};

	 		
//hintSilent format ["%1",_bla select 0];
if (count _buildingPosition > 0) then {
	_thisUnit setBehaviour "SAFE";
	_pos = [_buildingPosition] call BIS_fnc_selectRandom;
	_thisUnit doMove _pos;
	_thisUnit setSpeedMode "FULL";
	_thisUnit forceSpeed 25;
	_thisUnit playMove "SprintCivilBaseDf";				
	_thisUnit setVariable ["fleeing", "true"];
	waitUntil {
	  _thisUnit distance _pos < 2
	};
	
	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
 	_thisUnit stop true;
 	_thisUnit disableAI "autoTarget";
 	_thisUnit disableAI "MOVE";
 	_thisUnit disableAI "ANIM";
 	_thisUnit removeAllEventHandlers "FiredNear";

} else {
	_pos = [_thisUnit,[5,20],random 360] call SHK_pos;
	_thisUnit doMove _pos;
	_thisUnit setSpeedMode "FULL";
	_thisUnit forceSpeed 20;
	_thisUnit playMove "SprintCivilBaseDf";				
	_thisUnit setVariable ["fleeing", "true"];
	waitUntil {
	  _thisUnit distance _pos < 2
	};

	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
	_thisUnit stop true;
 	_thisUnit disableAI "autoTarget";
 	_thisUnit disableAI "MOVE";
 	_thisUnit disableAI "ANIM";
 	_thisUnit removeAllEventHandlers "FiredNear";
};