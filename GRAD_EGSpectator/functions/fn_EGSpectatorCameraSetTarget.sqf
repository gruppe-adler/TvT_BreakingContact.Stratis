#include "GRAD_EGSpectatorCommonDefines.inc"

private "_object";
_object = _this select 0;

private ["_camera", "_dummy", "_location"];
_camera = missionNamespace getVariable [VAR_CAMERA, objNull];
_dummy = missionNamespace getVariable [VAR_CAMERA_DUMMY_TARGET, objNull];
_location = _object worldToModel (_object modelToWorldVisual (_object selectionPosition "Head"));

if (!isNull _camera && !isNull _dummy) then
{
	_dummy attachTo [vehicle _object, _location];
	_camera camPrepareTarget _dummy;
	_camera camCommitPrepared CAMERA_TARGET_CHANGE_TIME;

	missionNamespace setVariable [VAR_CAMERA_HAS_TARGET, true];
};