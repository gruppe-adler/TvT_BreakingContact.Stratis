#include "GRAD_EGSpectatorCommonDefines.inc"

private _camera = missionNamespace getVariable [VAR_CAMERA, objNull];

if (!isNull _camera) then
{
	private ["_cameraMode", "_focus"];
	_cameraMode = missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
	_focus = uiNamespace getVariable [VAR_FOCUS, objNull];

	// Calculate delta time
	private ["_curTime", "_lastTickTime", "_deltaTime"];
	_curTime = time;
	_lastTickTime = missionNamespace getVariable [VAR_CAMERA_LAST_TICK_TIME, 0.0];
	_deltaTime = _curTime - _lastTickTime;
	missionNamespace setVariable [VAR_CAMERA_LAST_TICK_TIME, _curTime];
	missionNamespace setVariable [VAR_CAMERA_DELTA_TIME, _deltaTime];

	// Follow camera update
	if (_cameraMode == MODE_FOLLOW || {_cameraMode == MODE_FPS}) then
	{
		private _curFocus = ["GetFocus"] call DISPLAY;
		private _focus = if (!isNull _curFocus) then {_curFocus} else {["FindFocus"] call DISPLAY};

		if (!isNull _focus && {_focus != _curFocus}) then
		{
			["SetFocus", [_focus]] call DISPLAY;
		};

		if (!isNull _focus && {_cameraMode == MODE_FOLLOW}) then
		{
			[_focus] call CAM_PREPARE_TARGET;
		};
	};

	// Focus get in / out of vehicle state
	if (!isNull _focus) then
	{
		private ["_targetInVeh", "_hastarget"];
		_targetInVeh = missionNamespace getVariable [VAR_CAMERA_TARGET_IN_VEHICLE, false];
		_hastarget = missionNamespace getVariable [VAR_CAMERA_HAS_TARGET, false];

		if (_hastarget) then
		{
			if (!_targetInVeh && { vehicle _focus != _focus }) then
			{
				[_focus] call CAM_SET_TARGET;
				missionNamespace setVariable [VAR_CAMERA_TARGET_IN_VEHICLE, true];
			};

			if (_targetInVeh && { vehicle _focus == _focus }) then
			{
				[_focus] call CAM_SET_TARGET;
				missionNamespace setVariable [VAR_CAMERA_TARGET_IN_VEHICLE, false];
			};
		};
	}
	else
	{
		missionNamespace setVariable [VAR_CAMERA_TARGET_IN_VEHICLE, false];
	};

	// Camera lights
	private _lights = missionNamespace getVariable [VAR_CAMERA_LIGHTS, []];
	if (count _lights > 1) then
	{
		private ["_light", "_pos"];
		_light = _lights select 1;
		_pos = AGLToASL (screenToWorld getMousePosition);

		_light setPosASL _pos;
	};
};