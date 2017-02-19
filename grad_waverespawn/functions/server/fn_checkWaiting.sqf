[{
    params ["_args", "_handle"];
    if (MISSION_COMPLETED) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (count deadPlayersBlu > 0) then {
    	_respawningUnit = deadPlayersBlu select 0;
    	[_respawningUnit, WEST] call GRAD_waveRespawn_fnc_canRespawn;
    	
    	diag_log format ["checkWaiting checks %1 if respawn is available", _respawningUnit];

	};
   
} , 2, []] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    if (MISSION_COMPLETED) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (count deadPlayersOpf > 0) then {
    	_respawningUnit = deadPlayersOpf select 0;
    	[_respawningUnit, EAST] call GRAD_waveRespawn_fnc_canRespawn;
    	
        diag_log format ["checkWaiting checks %1 if respawn is available", _respawningUnit];
	};
   
} , 2, []] call CBA_fnc_addPerFrameHandler;