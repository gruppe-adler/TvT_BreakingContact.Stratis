/*
	Author: Cyrokrypto

	Description:
	- Called on each frame, only executes code every 1 second.
	- Updates map, units listbox and units list (CSSA3_spectatableUnits/CSSA3_spectatableGroups).

	Parameter(s):
	NONE

	Returns:
	NOTHING
*/

//Draw 3D HUD
[] call CSSA3_fnc_draw3DHUD;

//Executes 'if' statement every frame.
if ((diag_tickTime >= CSSA3_NextTime) || {CSSA3_frameStage > 0}) then {

	disableSerialization;

	#define CSSA3_TimeToRespawnIDC      79133
	#define CSSA3_mapIDC                7911

	_display = findDisplay 7810;
	CSSA3_frameStage = CSSA3_frameStage + 1;

	//Loop while spectate display is open.
	if (isNull _display) exitWith {

		//Remove oneachframe EH.
		["CSSA3_MainLoop", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

		//Destroy variables.
		CSSA3_frameStage = nil;
		CSSA3_spectatableUnits = nil;
		CSSA3_validGroupsArray = nil;
		CSSA3_validGroupsDataArray = nil;
		CSSA3_spectatedUnit = nil;
		CSSA3_CTIselectedUnit = nil;
		CSSA3_oldUnitList = nil;
		CSSA3_NextTime = nil;
	};

	//Execute code, frame 1.
	if (CSSA3_frameStage == 1) exitWith {

		CSSA3_NextTime = diag_tickTime + 1;

		_CSSA3_fnc_playersInGroup = {
			_players = [];
			{
				if ((alive _x) && {isPlayer _x}) then {_players pushBack _x};
			} count (units (_this select 0));
			_players;
		};

		_groupIsLiving = {
			_alive = false;
			{
				if (alive _x) exitWith {_alive = true};
			} count (units (_this select 0));
			_alive;
		};

		_groupHasPlayer = {
			_hasPlayer = false;
			{
				if ((alive _x) && {isPlayer _x}) exitWith {_hasPlayer = true;};
			} count (units (_this select 0));
			_hasPlayer;
		};

		_tempCSSA3_spectatableUnits = [];
		_tempCSSA3_validGroupsArray = [];
		_tempCSSA3_validGroupsDataArray = [];

		{
			if ((side _x) in CSSA3_sideArray && {[_x] call _groupIsLiving}) then {

				//If only players may be spectated and specified group has no player, ignore this group.
				if (CSSA3_onlySpectatePlayers && {!([_x] call _groupHasPlayer)}) exitWith {};

				_spectatableUnits = [];
				_unitColour = [0.251,0.251,0.251,1];

				if (CSSA3_onlySpectatePlayers) then {
					_spectatableUnits = [_x] call _CSSA3_fnc_playersInGroup;
					{_tempCSSA3_spectatableUnits pushBack _x; false;} count _spectatableUnits;

				} else {
					_spectatableUnits = units _x;
					{_tempCSSA3_spectatableUnits pushBack _x; false;} count _spectatableUnits;
				};

				//Find colour of unit based on side.
				_colour = call {
					//#1919D1
					if (side _x == WEST) exitWith {_unitColour = [0.098,0.361,0.62,1]};
					if (side _x == EAST) exitWith {_unitColour = [0.502,0,0,1]};
					if (side _x == civilian) exitWith {_unitColour = [0.373,0.016,0.706,0.7]};
					if (side _x == resistance) exitWith {_unitColour = [0,1,0,0.7]};
					_unitColour = [0.251,0.251,0.251,1];
			    };

				_tempCSSA3_validGroupsArray pushBack _x;
				_tempCSSA3_validGroupsDataArray pushBack [_spectatableUnits, side _x, _unitColour];
			};
			false;
		} count allGroups;

		CSSA3_validGroupsArray = + _tempCSSA3_validGroupsArray;
		CSSA3_validGroupsDataArray = + _tempCSSA3_validGroupsDataArray;
		CSSA3_spectatableUnits = + _tempCSSA3_spectatableUnits;

		if (!isNil {CSSA3_spectatedUnit} && {!alive CSSA3_spectatedUnit}) then {CSSA3_spectatedUnit = CSSA3_spectatableUnits select 0};
	};

	//Execute code, frame 2.
	if (CSSA3_frameStage == 2) exitWith {

		_timeToRespawn = 0;

		//Updates unit list listbox.
		if !(CSSA3_spectatableUnits isEqualTo CSSA3_oldUnitList) then {
			[] call CSSA3_fnc_updateUnitList;
		};

		CSSA3_oldUnitList = + CSSA3_spectatableUnits;

//		_timeToRespawn = "";
		if (playerRespawnTime >= 999999) then {_timeToRespawn = 'No Respawn';} else {_timeToRespawn = playerRespawnTime;};
		(_display displayCtrl CSSA3_TimeToRespawnIDC) ctrlSetText format ["Respawn: %1",_timeToRespawn, localize "STR_CSSA3_Respawn"];
	};

	if (CSSA3_frameStage == 3) then {
		//Execute code, frame 3.

		// Delete all the previously created map markers in order to refresh them
		if !(isNil "zamf_var_allUnitsPos") then {
			{deleteMarkerLocal _x} count zamf_var_allUnitsPos;
		};

		//Map update code.
		if (ctrlFade (_display displayCtrl CSSA3_mapIDC) < 0.8) then { //If map is open

			zamf_var_allUnitsPos = [];
			{

				// String representation of object
				_object_str = str _x;

				// Create the marker and set it's type using the string reper of the object it's tracking
				createMarkerLocal [_object_str, getPosAtl _x];
				_object_str setMarkerTypeLocal "mil_dot";

				// Decide marker color depending on side
				_color = call {
					if (side group _x == east) exitWith {"colorRed"};
					if (side group _x == west) exitWith {"colorBlue"};
					if (side group _x == civilian) exitWith {"colorCivilian"};
					if (side group _x == resistance) exitWith {"colorGreen"};
					"colorBlack"
				};

				// Set the color
				_object_str setMarkerColorLocal _color;

				// Give the marker the player's name if a player
				if (isPlayer _x && {alive _x}) then {_object_str setMarkerTextLocal (name _x)};

				// Add to the marker array in order to delete later for refresh
				//zamf_var_allUnitsPos set [count zamf_var_allUnitsPos, _object_str];
				zamf_var_allUnitsPos pushBack _object_str;

				false;
			} count CSSA3_spectatableUnits;
		};
	};

	CSSA3_frameStage = 0;
};