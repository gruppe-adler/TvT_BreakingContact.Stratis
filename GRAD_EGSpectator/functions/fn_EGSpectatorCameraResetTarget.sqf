#include "GRAD_EGSpectatorCommonDefines.inc"

private ["_camera", "_dummy"];
_camera = missionNamespace getVariable [VAR_CAMERA, objNull];
_dummy = missionNamespace getVariable [VAR_CAMERA_DUMMY_TARGET, objNull];

if (!isNull _camera && !isNull _dummy) then
{
	_camera camPrepareTarget objNull;
	_camera camCommitPrepared 0.0;

	detach _dummy;

	missionNamespace setVariable [VAR_CAMERA_HAS_TARGET, false];
};