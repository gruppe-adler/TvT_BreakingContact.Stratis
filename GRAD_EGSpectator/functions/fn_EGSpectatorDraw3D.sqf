#include "GRAD_EGSpectatorCommonDefines.inc"

private ["_uiVisible", "_mapVisible", "_camera"];
_uiVisible = uiNamespace getVariable [VAR_INTERFACE_VISIBLE, false];
_mapVisible = uiNamespace getVariable [VAR_MAP_VISIBLE, false];
_camera	= missionNamespace getVariable [VAR_CAMERA, objNull];

if (_uiVisible && !_mapVisible) then
{
	// Groups and Units
	{
		private ["_unit", "_type", "_icon"];
		_unit 	= _x select 0;
		_type	= _x select 1;
		_icon 	= _x select 2;

		private _unitColor = if (_type == 1 && { time <= _unit getVariable [VAR_HIGHLIGHT_TIME, 0] }) then { [1,1,1, ((_icon select 1) select 3)]; } else { _icon select 1 };
		private _position = _unit modelToWorldVisual (_unit selectionPosition "Head"); _position set [2, (_position select 2) + HEIGHT_OFFSET];

		if (_type == 2 && { _unit distance _camera < DISTANCE_NAMES }) then
		{
			private _focus = uiNamespace getVariable [VAR_FOCUS, objNull];
			private _cursorObject = uiNamespace getVariable [VAR_CURSOR_OBJECT, objNull];

			// Highlight unit name if unit is currenly our focus or our cursor object
			if (_focus == _unit || _cursorObject == _unit) then
			{
				private _fade = if (_focus == _unit) then { 0.8 } else { 0.4 };
				drawIcon3D [ICON_BACKGROUND_UNIT, [0,0,0,_fade], _position, 5.0, 3.5, 0, "", 0, 0.035, "PuristaMedium", "center"];
			};
		};

		// Apply modifiers
		private _modifiedIcon = [] + _icon;
		_modifiedIcon set [1, _unitColor];
		_modifiedIcon set [2, _position];

		// Draw icon
		drawIcon3D _modifiedIcon;
	} forEach (missionNamespace getVariable [VAR_UNITS_ICONS_TO_DRAW, []]);

	// Custom icons
	{
		private ["_target", "_iconParams", "_background", "_conditionShow"];
		_target 	= _x select 1;
		_iconParams 	= _x select 2;
		_background 	= _x select 3;
		_conditionShow	= _x select 4;

		if (_target call _conditionShow) then
		{
			private _position = if (typeName _target == typeName objNull) then { getPosATLVisual _target; } else { _target; };

			if (_background select 0) then
			{
				drawIcon3D [ICON_BACKGROUND, _background select 1, _position, 1.0, 1.0, 0, "", 0];
			};

			private _icon = [] + _iconParams;
			_icon set [2, _position];

			drawIcon3D _icon;
		};
	} forEach (missionNamespace getVariable [VAR_CUSTOM_ICONS, []]);

	// Draw locations
	if (missionNamespace getvariable [VAR_DRAW_3D_LOCATIONS, true]) then
	{
		{
			private ["_id", "_name", "_description", "_texture", "_cameraOffset"];
			_id 		= _x select 0;
			_name 		= _x select 1;
			_description 	= _x select 2;
			_texture	= _x select 3;
			_cameraOffset 	= _x select 4;

			drawIcon3D [_texture, [1,1,1,0.4], _cameraOffset select 0, 0.8, 0.8, 0, _name];
		} forEach (missionNamespace getVariable [VAR_LOCATIONS, []]);
	};

	// Draw projectiles and grenades paths
	if (missionNamespace getVariable [VAR_DRAW_PROJECTILES_PATH, false]) then
	{
		private _projectiles = missionNamespace getVariable [VAR_PROJECTILES, []];
		private _grenades = missionNamespace getVariable [VAR_GRENADES, []];
		private _projectilesNew = [];
		private _grenadesNew = [];

		// Draw projectiles if there are any
		if (count _projectiles > 0) then
		{
			// Go through all projectiles and draw their path
			{
				private _projectile = _x param [0, objNull, [objNull]];
				private _segments = _x param [1, [], [[]]];

				// Projectile may be null at this point, if so ignore
				// This will also prevent it's data from being added to next frame
				if (!isNull _projectile) then
				{
					// Calculate color depending on projectile speed
					private _speed = vectorMagnitude velocity _projectile;
					private _newColor = switch (true) do
					{
						case (_speed < 250) : {[0,0,1,1]};
						case (_speed < 500) : {[0,1,0,1]};
						default {[1,0,0,1]};
					};

					// Store new segment
					_segments pushBack [getPosVisual _projectile, _newColor];

					// Clamp number of projectiles to be drawn
					if (count _segments > MAX_PROJECTILE_SEGMENTS) then
					{
						reverse _segments;
						_segments resize MAX_PROJECTILE_SEGMENTS;
						reverse _segments;
					};

					// Go through all projectile segments and draw them
					{
						private _nextSegmentIndex = _forEachIndex + 1;

						if (count _segments > _nextSegmentIndex) then
						{
							private _locOld = _x select 0;
							private _colorOld = _x select 1;

							private _locNew = (_segments select _nextSegmentIndex) select 0;
							private _colorNew = (_segments select _nextSegmentIndex) select 1;

							drawLine3D [_locOld, _locNew, _colorNew];
						};
					}
					forEach _segments;

					// Store projectile data for next frame
					_projectilesNew pushBack [_projectile, _segments];
				};
			}
			forEach _projectiles;
		};

		// Draw grenades if there are any
		if (count _grenades > 0) then
		{
			{
				private _grenade = _x param [0, objNull, [objNull]];

				// Grenade may be null at this point, if so ignore
				// This will also prevent it's data from being added to next frame
				if (!isNull _grenade) then
				{
					// The grenade velocity
					private _grenadeVelocity = velocity _grenade;
					private _grenadeVelocityMagnitude = vectorMagnitude _grenadeVelocity;

					// The icon angle
					private _iconAngle = if (_grenadeVelocityMagnitude > 0) then {time * 100 * _grenadeVelocityMagnitude} else {0};

					// Draw grenade
					drawIcon3D [GRENADE_ICON, [1,0,0,1], getPosVisual _grenade, 0.6, 0.6, _iconAngle, "", 0, 0.05, "TahomaB"];

					// Store grenade for next frame
					_grenadesNew pushBack _grenade;
				};
			}
			forEach _grenades;
		};

		// Store new data for next frame
		missionNamespace setVariable [VAR_PROJECTILES, _projectilesNew];
		missionNamespace setVariable [VAR_GRENADES, _grenadesNew];
	};
};