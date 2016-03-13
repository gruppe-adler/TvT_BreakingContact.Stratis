_thisUnit = _this select 0;

deleteWaypoint [group _thisUnit, all];
_thisUnit unassignVehicle (vehicle _thisUnit);
_thisUnit leaveVehicle (vehicle _thisUnit);
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
	_thisUnit playMove "AmovPercMevaSnonWnonDf";				
	_thisUnit setVariable ["fleeing", "true"];
	waitUntil {
	  _thisUnit distance _pos < 2
	};
	
	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
 	_thisUnit stop true;
 	_thisUnit disableAI "autoTarget";
 	_thisUnit disableAI "MOVE";
 	_thisUnit removeAllEventHandlers "FiredNear";

} else {
	_pos = [_thisUnit,[5,20],random 360] call SHK_pos;
	_thisUnit doMove _pos;
	_thisUnit setSpeedMode "FULL";
	_thisUnit forceSpeed 20;
	_thisUnit playMove "AmovPercMevaSnonWnonDf";				
	_thisUnit setVariable ["fleeing", "true"];
	waitUntil {
	  _thisUnit distance _pos < 2
	};

	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
	_thisUnit stop true;
 	_thisUnit disableAI "autoTarget";
 	_thisUnit disableAI "MOVE";
 	_thisUnit removeAllEventHandlers "FiredNear";
};