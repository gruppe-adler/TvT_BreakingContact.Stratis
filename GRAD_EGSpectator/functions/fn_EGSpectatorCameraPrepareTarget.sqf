#include "GRAD_EGSpectatorCommonDefines.inc"

private _target = _this select 0;

if (!isNull _target) then
{
	private _deltaTime = missionNamespace getVariable [VAR_CAMERA_DELTA_TIME, 0.0];

	private ["_camera", "_cameraMode", "_dummy"];
	_camera = missionNamespace getVariable [VAR_CAMERA, objNull];
	_cameraMode = missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
	_dummy = missionNamespace getVariable [VAR_CAMERA_DUMMY_TARGET, objNull];

	private ["_zoom", "_zoomTemp"];
	_zoom = if (_cameraMode == MODE_FOLLOW) then { missionNamespace getVariable [VAR_FOLLOW_CAMERA_ZOOM, 0.0] } else { 0.0 };
	_zoomTemp = missionNamespace getVariable [VAR_FOLLOW_CAMERA_ZOOM_TEMP, 0.0];
	if (_zoomTemp != _zoom) then
	{
		_zoomTemp = [_zoomTemp, _zoom, 10.0, _deltaTime] call BIS_fnc_lerp;
		missionNamespace setVariable [VAR_FOLLOW_CAMERA_ZOOM_TEMP, _zoomTemp];
	};

	private ["_vehicle", "_isMan", "_distance", "_height"];
	_vehicle = vehicle _target;
	_isMan = _vehicle isKindOf "Man";
	_bbd = [_vehicle] call BIS_fnc_getObjectBBD;
	_distance = (_bbd select 1) + _zoomTemp;
	_height = if (!_isMan) then { (_bbd select 2) / 3.0 } else { switch (stance _vehicle) do { case "STAND": {1.4}; case "CROUCH": {0.8}; default {0.4}; }; };

	// The pivot on the target vehicle
	private "_center";
	_center = if (_isMan) then { AGLToASL (_vehicle modelToWorldVisual (_vehicle selectionPosition "Spine3")) } else { AGLToASL (_vehicle modelToWorldVisual [0,0,_height]) };

	// The camera pitch and yaw
	private ["_cameraYaw", "_cameraPitch"];
	_cameraYaw = missionNamespace getVariable [VAR_FOLLOW_CAMERA_YAW, 0.0];
	_cameraPitch = missionNamespace getVariable [VAR_FOLLOW_CAMERA_PITCH, 0.0];

	private _dirTemp = missionNamespace getVariable [VAR_FOLLOW_CAMERA_DIR_TEMP, 0.0];

	// Set dumy location and rotation
	_dummy setPosASL _center;
	[_dummy, [_dirTemp + _cameraYaw, _cameraPitch, 0.0]] call BIS_fnc_setObjectRotation;

	private ["_pos", "_vDir", "_vUp"];
	_pos = AGLToASL (_dummy modelToWorldVisual [0, -_distance, 0]);
	_vDir = vectorDirVisual _dummy;
	_vUp = vectorUpVisual _dummy;

	// Check for collision between character and camera
	// If a collision is found we put camera at hit point
	private _intersections = [];//lineIntersectsSurfaces [_center, _pos, _vehicle, _target, true, 1];

	if (count _intersections > 0) then
	{
		private _intersection = _intersections select 0;
		private _hitLoc = _intersection select 0;
		private _hitOffset = 0.25;
		private _minOffsetFromCenter = 1.0;

		// The direction from hit point to center
		private _dirToTarget = vectorNormalized (_center vectorDiff _hitLoc);

		// Finally, project camera location a little backwards
		// So it stays with offset from hit point, otherwise could end up in geometry
		_pos = _hitLoc vectorAdd (_dirToTarget vectorMultiply _hitOffset);

		// In case we are too close to center, project it back
		if (_pos distance _center <= _minOffsetFromCenter) then
		{
			// The direction from center to hit point
			private _dirToCenter = _dirToTarget vectorMultiply -1;

			// Final position
			_pos = _center vectorAdd (_dirToCenter vectorMultiply _minOffsetFromCenter);
		};
	};

	// Apply location and rotation to camera
	_camera setPosASL _pos;
	_camera setVectorDirAndUp [_vDir, _vUp];
};