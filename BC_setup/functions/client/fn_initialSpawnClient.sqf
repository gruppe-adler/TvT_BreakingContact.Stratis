private _playerPositionsForCurrentWorld = 	[
	["spawnPosOpf", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosBlu", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosInd", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry
];

[{!isNull player}, {
	params ["_playerPositionsForCurrentWorld"];

	if ((typeOf player) == "VirtualSpectator_F" && !isNil "CLib_fnc_registerEntryPoint") then {
		{
			if ("Streamator" call CLib_fnc_modLoaded) then {
				[] spawn {
					waitUntil {!isNull (missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull])};
					bc_setup_fnc_streamator call CLib_fnc_directCall;
				};
			} else {
				call bc_setup_fnc_streamingSpectator; // if only CLib is loaded but not the streamator call normal Spectator function
			};
		} call CLib_fnc_registerEntryPoint;
	} else {
		call bc_setup_fnc_streamingSpectator;
	};

	_targetPosition = switch (playerSide) do {
		case (EAST): {_playerPositionsForCurrentWorld select 0};
		case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
		default {_playerPositionsForCurrentWorld select 1};
	};

	_tmpPos = [_targetPosition,[0,10],[0,360]] call BC_setup_fnc_findRandomPos;
	player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height
	player switchmove "AmovPercMstpSnonWnonDnon";


}, [_playerPositionsForCurrentWorld]] call CBA_fnc_waitUntilAndExecute;
