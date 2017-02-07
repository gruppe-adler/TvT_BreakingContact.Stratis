params ["_blu", "_opf"];

[{
    params ["_blu", "_handle"];
    if (MISSION_COMPLETED) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (count _blu > 0) then {
    	_respawningUnit = _blu select 0;
    	[_respawningUnit, WEST] call GRAD_wr_canRespawn;
    	[_respawningUnit] call GRAD_wr_removePlayerWaiting;
    	diag_log format ["checkWaiting releases %1 for respawn", _respawningUnit];

	};
   
} , 1, _blu] call CBA_fnc_addPerFrameHandler;

[{
    params ["_opf", "_handle"];
    if (MISSION_COMPLETED) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (count _opf > 0) then {
    	_respawningUnit = _opf select 0;
    	[_respawningUnit, EAST] call GRAD_wr_canRespawn;
    	[_respawningUnit] call GRAD_wr_removePlayerWaiting;
    	diag_log format ["checkWaiting releases %1 for respawn", _respawningUnit];
	};
   
} , 1, _opf] call CBA_fnc_addPerFrameHandler;