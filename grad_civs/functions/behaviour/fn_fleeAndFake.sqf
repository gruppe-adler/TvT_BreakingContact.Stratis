_thisUnit = _this select 0;
_group = group _thisUnit;

diag_log format ["civ %1 is faking a human", _thisUnit];



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
	
	diag_log format ["civ %1 is fake fleeing to building", _thisUnit];
	sleep (14 - (random 10));
	
	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
 	_thisUnit stop true;
 	_thisUnit disableAI "autoTarget";
 	_thisUnit disableAI "MOVE";
 	_thisUnit disableAI "ANIM";
 	_thisUnit removeAllEventHandlers "FiredNear";

} else {
	_pos = [_thisUnit,[50,1000],random 360] call SHK_pos;
	_thisUnit doMove _pos;
	_thisUnit setSpeedMode "FULL";
	_thisUnit forceSpeed 20;
	_thisUnit playMove "SprintCivilBaseDf";				
	_thisUnit setVariable ["GRAD_fleeing", true];

	diag_log format ["civ %1 is fake fleeing to %2", _thisUnit, _pos];

	sleep 60;

	[group _thisUnit, _pos, 400 - (random 300), [3,6], [0,2,10]] call GRAD_civs_fnc_taskPatrol;
	_thisUnit setVariable ["GRAD_fleeing", false];
};