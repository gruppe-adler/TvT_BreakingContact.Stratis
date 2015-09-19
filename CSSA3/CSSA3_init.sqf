/*
	Author: Cyrokrypto

	Description:
	- CSSA3 init. Executes on mission start / Player join.
	- Needs to be tidied up.

	Parameter(s):
	_CSSA3_UID : String - Player UID
	_player : Object - Player

	Returns:
	NOTHING
*/

private ["_allowRejoin","_allowJIP","_timeToJIP","_allowJip", "_sentArray"];

CSSA3_version = 0.3;

//Server Init
if (isServer) then
{
	diag_log text "[CSSA3 Notice]: CSSA3 starting. (CSSA3_init.sqf)";
	CSSA3_beforeJIPClients = [];
	CSSA3_allowJIP = [_this, 0, true, [true]] call BIS_fnc_param;
	CSSA3_timeToJIP = [_this, 1, 60, [0]] call BIS_fnc_param;

	CSSA3_fnc_addToJIP = {
		private ["_playerNetID","_CSSA3_UID","_player","_currentTime"];

		_playerNetID = _this select 0;
		_player = objectFromNetId _playerNetID;
		_CSSA3_UID = getPlayerUID _player;
		_currentTime = time;
		diag_log text format ["[CSSA3 Notice]: Player connected; netID: %1, Player: %2, playerUID: %3, Time Of Join: %4",_playerNetID, name _player, _CSSA3_UID, _currentTime];

		if (_currentTime <= CSSA3_timeToJIP) then {
			if !(_CSSA3_UID in CSSA3_beforeJIPClients) then
			{
				CSSA3_beforeJIPClients pushBack _CSSA3_UID;
				diag_log text format ["[CSSA3 Notice]: Added %1 to JIP array. %2",_CSSA3_UID,CSSA3_beforeJIPClients];
			};
		};

		if !(CSSA3_allowJIP) exitWith
		{
			if ((_currentTime > CSSA3_timeToJIP) && {!(_CSSA3_UID in CSSA3_beforeJIPClients)}) then
			{
				diag_log text format ["[CSSA3 Notice]: Player %1 forced to spectate, joined after allowed time. Time: %2", name _player,_currentTime];
				forceRespawn _player;
			};
		};
	};
};

//Player Init
if (hasInterface) then
{

	//Compile functions
	CSSA3_fnc_classExists = compile preprocessFileLineNumbers ("CSSA3\functions\fn_classExists.sqf");
	CSSA3_fnc_draw3DHUD = compile preprocessFileLineNumbers ("CSSA3\functions\fn_draw3DHUD.sqf");
	CSSA3_fnc_mainSpectateFunctions = compile preprocessFileLineNumbers ("CSSA3\functions\fn_CSSA3_MainFunctions.sqf");
	CSSA3_fnc_createSpectateDialog = compile preprocessFileLineNumbers ("CSSA3\functions\fn_createSpectateDialog.sqf");
	CSSA3_fnc_mainUpdateLoop = compile preprocessFileLineNumbers ("CSSA3\functions\fn_mainUpdateLoop.sqf");
	CSSA3_fnc_forceReopen = compile preprocessFileLineNumbers ("CSSA3\functions\fn_forceReopen.sqf");
	CSSA3_fnc_unitListIndexChange = compile preprocessFileLineNumbers ("CSSA3\functions\fn_unitListIndexChanged.sqf");
	CSSA3_fnc_updateUnitList = compile preprocessFileLineNumbers ("CSSA3\functions\fn_updateUnitList.sqf");
	CSSA3_fnc_settingsHandler = compile preprocessFileLineNumbers ("CSSA3\functions\fn_settingsHandler.sqf");
	CSSA3_fnc_camMove = compile preprocessFileLineNumbers ("CSSA3\functions\fn_camMove.sqf");
	CSSA3_fnc_camRotate = compile preprocessFileLineNumbers ("CSSA3\functions\fn_camRotate.sqf");
	CSSA3_fnc_LMBhandler = compile preprocessFileLineNumbers ("CSSA3\functions\fn_LMBhandler.sqf");
	CSSA3_fnc_changeView = compile preprocessFileLineNumbers ("CSSA3\functions\fn_changeView.sqf");
	CSSA3_fnc_ctrlActive = compile preprocessFileLineNumbers ("CSSA3\functions\fn_ctrlActive.sqf");
	CSSA3_fnc_closeInteractRose = compile preprocessFileLineNumbers ("CSSA3\functions\fn_closeInteractRose.sqf");
	CSSA3_fnc_addremoveFavourite = compile preprocessFileLineNumbers ("CSSA3\functions\fn_addremoveFavourite.sqf");
	CSSA3_fnc_strToUnit = compile preprocessFileLineNumbers ("CSSA3\functions\fn_strToUnit.sqf");
	CSSA3_fnc_findInNested = compile preprocessFileLineNumbers ("CSSA3\functions\fn_findInNested.sqf");
	CSSA3_fnc_forceExit = compile preprocessFileLineNumbers ("CSSA3\functions\fn_forceExit.sqf");

	diag_log text "[CSSA3 Notice]: Functions compiled. Initiating player join. (CSSA3_init.sqf)";

	//Wait until player is no longer null
	waitUntil {(!isNull player) && {alive player}};
	CSSA3_playerSide = side player;
	sleep 0.1;
	diag_log text "[CSSA3 Notice]: Player no longer null, adding eventhandlers. (CSSA3_init)";

	player addEventHandler ["killed", {['killed',_this] spawn CSSA3_fnc_createSpectateDialog}];
	player addEventHandler ["respawn", {['respawn',_this] spawn CSSA3_fnc_createSpectateDialog}];

	//Add player UID to array of players who joined before out of time (_timeToJIP).
	_sentArray = [[netID player],"CSSA3_fnc_addToJIP",false,false,false] call bis_fnc_MP;
	diag_log text format ["[CSSA3 Notice]: Player netID: %1", netID player];

	//Check if API vars are Nil.
	_defaultSides = [blufor,opfor,civilian,resistance];
	if (isNil {CSSA3_onlySpectatePlayers}) then {CSSA3_onlySpectatePlayers = false};
	if (isNil {CSSA3_lockThirdPerson}) then {CSSA3_lockThirdPerson = false};
	if (isNil {CSSA3_allowedModes} || {count CSSA3_allowedModes < 1}) then {CSSA3_allowedModes = ["freeCam","firstPerson","thirdPerson"]};
	if (isNil {CSSA3_bluforSpectateable} || {count CSSA3_bluforSpectateable < 1}) then {CSSA3_bluforSpectateable = _defaultSides};
	if (isNil {CSSA3_opforSpectateable} || {count CSSA3_opforSpectateable < 1}) then {CSSA3_opforSpectateable = _defaultSides};
	if (isNil {CSSA3_civilianSpectateable} || {count CSSA3_civilianSpectateable < 1}) then {CSSA3_civilianSpectateable = _defaultSides};
	if (isNil {CSSA3_independentSpectateable} || {count CSSA3_independentSpectateable < 1}) then {CSSA3_independentSpectateable = _defaultSides};

	//Calculate player's spectateable units.
	_setSide = [] call {
		if (CSSA3_playerSide == blufor) exitWith {CSSA3_sideArray = CSSA3_bluforSpectateable};
		if (CSSA3_playerSide == opfor) exitWith {CSSA3_sideArray = CSSA3_opforSpectateable};
		if (CSSA3_playerSide == civilian) exitWith {CSSA3_sideArray = CSSA3_civilianSpectateable};
		if (CSSA3_playerSide == resistance) exitWith {CSSA3_sideArray = CSSA3_independentSpectateable};
	};

	if (!alive player) exitWith {['killed',_this] spawn CSSA3_fnc_createSpectateDialog};

};