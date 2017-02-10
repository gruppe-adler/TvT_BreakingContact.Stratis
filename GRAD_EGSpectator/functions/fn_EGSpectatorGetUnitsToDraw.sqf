#include "GRAD_EGSpectatorCommonDefines.inc"

private _entities = ["GetTargetEntities"] call SPEC;
private _icons = [];

{
	private _showAiGroups = missionNamespace getVariable [VAR_SHOW_AI_GROUPS, true];
	private _camera	= missionNamespace getVariable [VAR_CAMERA, objNull];
	private _distanceToCamera = _camera distance _x;
	private _pickupOwner = ((missionNamespace getVariable ["BIS_hvt_pickupInfo", [objNull, [objNull]]]) select 1) select 0;

	private ["_group", "_groupSide", "_groupName", "_groupLeader", "_groupColor", "_text"];
	_group		= group _x;
	_groupSide	= side _group;
	_groupName 	= groupId _group;
	_groupLeader	= leader _group;
	_groupColor	= [_groupSide] call BIS_fnc_sideColor;
	_text 		= _groupName;

	if
	(
		_x != _pickupOwner &&
		{ _distanceToCamera <= 1500.0 } &&
		{ (isPlayer _x || _showAiGroups) } &&
		{ vehicle _x == _x || { _x == driver vehicle _x } }
	) then
	{
		private _fadeDistanceList = [[500, 1.0], [1000, 0.6], [1500, 0.3]];
		private _sizeDistanceList = [[500, 3.5, -2.15, 0.035], [1000, 3.0, -1.9, 0.03], [1500, 2.5, -1.6, 0.025]];

		// Calculate distance fade
		private _fadeByDistance = switch (true) do
		{
			case (_distanceToCamera <= (_fadeDistanceList select 0) select 0) : { (_fadeDistanceList select 0) select 1 };
			case (_distanceToCamera <= (_fadeDistanceList select 1) select 0) : { (_fadeDistanceList select 1) select 1 };
			default { (_fadeDistanceList select 2) select 1 };
		};

		// Calculate distance size
		private _sizeByDistance = switch (true) do
		{
			case (_distanceToCamera <= (_sizeDistanceList select 0) select 0) : { (_sizeDistanceList select 0) select 1 };
			case (_distanceToCamera <= (_sizeDistanceList select 1) select 0) : { (_sizeDistanceList select 1) select 1 };
			default { (_sizeDistanceList select 2) select 1 };
		};

		// Calculate distance height offset (for texts)
		private _heightByDistance = switch (true) do
		{
			case (_distanceToCamera <= (_sizeDistanceList select 0) select 0) : { (_sizeDistanceList select 0) select 2 };
			case (_distanceToCamera <= (_sizeDistanceList select 1) select 0) : { (_sizeDistanceList select 1) select 2 };
			default { (_sizeDistanceList select 2) select 2 };
		};

		// Calculate distance font size (for texts)
		private _fontSizeByDistance = switch (true) do
		{
			case (_distanceToCamera <= (_sizeDistanceList select 0) select 0) : { (_sizeDistanceList select 0) select 3 };
			case (_distanceToCamera <= (_sizeDistanceList select 1) select 0) : { (_sizeDistanceList select 1) select 3 };
			default { (_sizeDistanceList select 2) select 3 };
		};

		// Apply color fade
		_groupColor set [3, _fadeByDistance];

		// Show unit name only if camera is near enough
		if (_distanceToCamera < DISTANCE_NAMES) then
		{
			private _name = [_x, nil, NAME_MAX_CHARACTERS] call BIS_fnc_getName;

			// Set text to meet unit name, or show "Dead" if unit is dead
			_text = if (isPlayer _x) then { _name } else { format ["%1: %2", localize "str_player_ai", _name] };

			// Icon unit name
			_icons pushBack [_x, 2, ["", [1,1,1,1], [0,0,0], 0.0, _heightByDistance, 0, _text, 2, _fontSizeByDistance, "PuristaMedium", "center"]];
		};

		if (_x == _groupLeader) then
		{
			_icons pushBack [_x, 0, [ICON_GROUP, _groupColor, [0,0,0], _sizeByDistance, _sizeByDistance, 0.0, "", 0, 0.035, "PuristaMedium", "center"]];
			_icons pushBack [_x, 0, ["", [1,1,1,_fadeByDistance], [0,0,0], 0.0, _heightByDistance, 0, _text, 2, _fontSizeByDistance, "PuristaMedium", "center"]];
		};

		// Icon properties
		private _unitColor = if (time <= _x getVariable [VAR_HIGHLIGHT_TIME, 0]) then { [1,1,1,_fadeByDistance]; } else { _groupColor; };
		private _unitIcon = if (_x getVariable [VAR_INCAPACITATED, false]) then { ICON_REVIVE } else { ICON_UNIT };

		// Draw unit icon
		_icons pushBack [_x, 1, [_unitIcon, _groupColor, [0,0,0], _sizeByDistance, _sizeByDistance, 0.0, "", 0, 0.035, "PuristaMedium", "center"]];
	};
} forEach _entities;

_icons;