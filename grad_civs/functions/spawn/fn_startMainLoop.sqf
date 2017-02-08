

GRAD_civs_mainLoop = [{
    params ["_args", "_handle"];

    if (MISSION_COMPLETED) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _playerPositions = call GRAD_civs_fnc_getPlayerPositions;

    [
	    _playerPositions, 
		GRAD_CIV_MIN_SPAWN_DISTANCE, 
		GRAD_CIV_MAX_SPAWN_DISTANCE, 
		GRAD_CIV_ONFOOT_GROUPS
	] spawn GRAD_civs_fnc_findRemovableCivilian;

    if (GRAD_CIV_ONFOOT_COUNT < GRAD_CIV_MAX_COUNT) then {
    	[_playerPositions] call GRAD_civs_fnc_addNewCivilian;
    };


},5,[]] call CBA_fnc_addPerFrameHandler;