/*
	Author:
	Nelson Duarte

	Description:
	Spectator camera framework

	Returns:
	Multiple values / none

	Event Handlers:
	EGSpectator_OnCameraModeChanged

	Notes:
	Not to be used directly
*/
// Do not serialize this script
disableSerialization;

// Name this script
scriptName "GRAD_fnc_EGSpectatorCamera";

// Common spectator defines
#include "GRAD_EGSpectatorCommonDefines.inc"

// Params
private ["_mode", "_params"];
_mode 	= _this param [0, "", [""]];
_params = _this param [1, [], [[]]];

// Sub functions
switch _mode do
{
	/**
	 * Initialize camera
	 * @return <OBJECT> The created camera
	 */
	case "Initialize":
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: Initialize";

		private _cameraType = _params param [0, TYPE_CURATOR, [""]];
		private _cameraMode = _params param [1, MODE_FREE, [""]];

		// Make sure type is valid
		if !(_cameraType in CAMERA_TYPES) exitWith
		{
			["Initialize: Invalid camera type %1, can be camcurator or camera", _cameraType] call BIS_fnc_error;
		};

		// Create the camera
		private _camera = _cameraType camCreate eyePos player;

		// Make sure camera was created
		if (!isNull _camera) then
		{
			_camera cameraEffect ["internal", "back"];
			_camera setPosASL eyePos player;
			_camera setDir getDirVisual player;
			_camera camCommand "maxPitch 89.0";
			_camera camCommand "minPitch -89.0";
			_camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
			_camera camCommand format ["speedMax %1", SPEED_FAST];
			_camera camCommand "ceilingHeight 5000";
			_camera spawn { sleep 1; _this camCommand "surfaceSpeed off"; };
			cameraEffectEnableHUD true;

			// Store camera
			missionNamespace setVariable [VAR_CAMERA, _camera];

			// Start ticking
			missionNamespace setVariable [VAR_CAMERA_TICK, addMissionEventHandler ["Draw3D", { [] call CAM_TICK; }]];

			// Reset vision mode
			missionNamespace setVariable [VAR_CAMERA_VISIONMODE, 0];

			// Create dummy target
			missionNamespace setVariable [VAR_CAMERA_DUMMY_TARGET, "Land_HelipadEmpty_F" createVehicleLocal getPosASLVisual player];

			// Whether our target is in a vehicle
			missionNamespace setVariable [VAR_CAMERA_TARGET_IN_VEHICLE, false];

			// Set the default zoom as half
			missionNamespace setVariable [VAR_FOLLOW_CAMERA_ZOOM, 0.5];

			// Set camera height mode
			["SetCameraHeightMode", [false]] call CAM;

			// Set camera relative speed mode
			["SetCameraUseSurfaceSpeed", [true]] call CAM;

			// If free camera is disabled do not allow to control it
			if !(missionNamespace getVariable [VAR_ALLOW_FREE_CAMERA, true]) then
			{
				["SetCameraManual", [false]] call CAM;
			};

			// Spectator display event handlers
			[missionNamespace, "RscDisplayEGSpectator_MapStateChanged", { ["OnDisplayMapStateChanged", _this] call CAM; }] call BIS_fnc_addScriptedEventHandler;
		};

		// Return the created camera
		_camera;
	};

	/**
	 * Terminate camera
	 * @return <BOOL> Whether camera was destroyed
	 */
	case "Terminate":
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: Terminate";

		private _camera = ["GetCamera"] call CAM;
		private _bDestroyed = false;

		if (!isNull _camera) then
		{
			_camera cameraEffect ["terminate", "back"];
			deleteVehicle _camera;
			_bDestroyed = true;
		};

		// Reset inputs, only for Follow camera
		["ResetInputs"] call CAM;

		// Reset camera
		missionNamespace setVariable [VAR_CAMERA, nil];

		// Stop ticking
		removeMissionEventHandler ["Draw3D", missionNamespace getVariable [VAR_CAMERA_TICK, -1]];
		missionNamespace setVariable [VAR_CAMERA_TICK, nil];

		// Reset vision mode
		missionNamespace setVariable [VAR_CAMERA_VISIONMODE, nil];

		// Destroy dummy target
		deleteVehicle (missionNamespace getVariable [VAR_CAMERA_DUMMY_TARGET, objNull]);
		missionNamespace setVariable [VAR_CAMERA_DUMMY_TARGET, nil];

		// Whether our target is in a vehicle
		missionNamespace setVariable [VAR_TARGET_IN_VEHICLE, nil];

		// Default follow camera zoom
		missionNamespace setVariable [VAR_FOLLOW_CAMERA_ZOOM, nil];

		// Show HUD
		showHUD [true, true, true, true, true, true, true, true];
		showChat true;

		// Success or failure handling
		_bDestroyed;
	};

	/**
	 * Whether camera is valid (was created)
	 * @return <BOOL> Whether camera was initialized
	 */
	case "IsInitialized":
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: IsInitialized";
		!isNull (missionNamespace getVariable [VAR_CAMERA, objNull]);
	};

	/**
	 * The spectator camera which player is currently controlling / viewing
	 * @return <OBJECT> The camera player is controlling / viewing
	 */
	case "GetCamera" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: GetCamera";
		missionNamespace getVariable [VAR_CAMERA, objNull];
	};

	/**
	 * Returns the desired camera type to use
	 * @return <STRING> The camera type which can be "camcurator" or "camera"
	 */
	case "GetCameraType" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: GetCameraType";
		missionNamespace getVariable [VAR_CAMERA_TYPE, "camcurator"];
	};

	/**
	 * Toggles camera vision
	 */
	case "ToggleVisionMode" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: ToggleVisionMode";

		// We do not allow switching vision mode when in first person camera
		if (["GetCameraMode"] call CAM != MODE_FPS) then
		{
			private ["_currentMode", "_newMode"];
			_currentMode = missionNamespace getVariable [VAR_CAMERA_VISIONMODE, 0];
			_newMode = _currentMode;

			switch (_currentMode) do
			{
				case 1 : { camUseNVG false; true setCamUseTi 0; missionNamespace setVariable [VAR_CAMERA_VISIONMODE, 2]; _newMode = 2; };
				case 2 : { camUseNVG false; false setCamUseTi 0; missionNamespace setVariable [VAR_CAMERA_VISIONMODE, 0]; _newMode = 0; };
				default  { camUseNVG true; false setCamUseTi 0; missionNamespace setVariable [VAR_CAMERA_VISIONMODE, 1]; _newMode = 1; };
			};

			["OnVisionModeChanged", [_newMode]] call CAM;
		};
	};

	/**
	 * Vision mode is changed
	 */
	case "OnVisionModeChanged" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: OnVisionModeChanged";

		private "_newMode";
		_newMode = _params select 0;

		playSound "RscDisplayCurator_visionMode";
	};

	/**
	 * Get's the current camera mode
	 * @return <STRING> The current camera mode
	 */
	case "GetCameraMode" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: GetCameraMode";
		missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
	};

	/**
	 * Set's the current camera mode
	 * @param <STRING> The current camera mode
	 */
	case "SetCameraMode" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: SetCameraMode";

		private _newMode = _params select 0;
		private _oldMode = missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
		private _bValidMode = _newMode in CAMERA_MODES;
		private _bAllowFreeCamera = missionNamespace getVariable [VAR_ALLOW_FREE_CAMERA, true];
		private _bAllow3PPCamera = missionNamespace getVariable [VAR_ALLOW_3PP_CAMERA, true];

		if (_bValidMode && {_newMode != MODE_FREE || {_bAllowFreeCamera}} && {_newMode != MODE_FOLLOW || {_bAllow3PPCamera}}) then
		{
			private "_focus";
			_focus = ["GetFocus"] call DISPLAY;

			if (!isNull _focus || _newMode == MODE_FREE) then
			{
				missionNamespace setVariable [VAR_CAMERA_MODE, _newMode];
				["OnCameraModeChanged", [_newMode, _oldMode]] call CAM;
			};
		};
	};

	/**
	 * Toggles the current camera mode by cycling the available modes
	 */
	case "ToggleCameraMode" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: ToggleCameraMode";

		private _mode = missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
		private _bAllowFreeCamera = missionNamespace getVariable [VAR_ALLOW_FREE_CAMERA, true];
		private _bAllow3PPCamera = missionNamespace getVariable [VAR_ALLOW_3PP_CAMERA, true];

		switch (true) do
		{
			case (_mode == MODE_FREE) :
			{
				if (_bAllow3PPCamera) then
				{
					["SetCameraMode", [MODE_FOLLOW]] call CAM;
				}
				else
				{
					["SetCameraMode", [MODE_FPS]] call CAM;
				};
			};

			case (_mode == MODE_FOLLOW) :
			{
				["SetCameraMode", [MODE_FPS]] call CAM;
			};

			case (_mode == MODE_FPS) :
			{
				if (_bAllowFreeCamera) then
				{
					["SetCameraMode", [MODE_FREE]] call CAM;
				}
				else
				{
					if (_bAllow3PPCamera) then
					{
						["SetCameraMode", [MODE_FOLLOW]] call CAM;
					}
					else
					{
						["SetCameraMode", [MODE_FPS]] call CAM;
					};
				};
			};

			default
			{
				["SetCameraMode", [MODE_FPS]] call CAM;
			};
		};
	};

	/**
	 * Camera mode changed event
	 */
	case "OnCameraModeChanged" :
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: OnCameraModeChanged";

		private ["_newMode", "_oldMode"];
		_newMode = _params select 0;
		_oldMode = _params select 1;

		private ["_focus", "_camera"];
		_focus = ["GetFocus"] call DISPLAY;
		_camera = ["GetCamera"] call CAM;

		switch (_newMode) do
		{
			case MODE_FPS:
			{
				_camera cameraEffect ["Terminate", "BACK"];
				_focus switchCamera "INTERNAL";

				[] call CAM_RESET_TARGET;

				// Reset vision mode
				camUseNVG false;
				false setCamUseTi 1;
				missionNamespace setVariable [VAR_CAMERA_VISIONMODE, 0];

				// Disable camera input
				["SetCameraManual", [false]] call CAM;

				cameraEffectEnableHUD true;
				showHUD [true, false, false, false, false, false, false, true];
			};

			case MODE_FOLLOW:
			{
				_camera cameraEffect ["Internal", "BACK"];
				_focus switchCamera "EXTERNAL";

				[] call CAM_RESET_TARGET;

				// Disable camera input
				["SetCameraManual", [false]] call CAM;

				cameraEffectEnableHUD true;
				showHUD [true, true, true, true, true, true, true, true];
			};

			case MODE_FREE:
			{
				_camera cameraEffect ["Internal", "BACK"];
				player switchCamera "INTERNAL";
				_camera setDir getDirVisual _camera;

				if (!isNull _focus) then
				{
					if (_oldMode == MODE_FPS) then
					{
						[_focus] call CAM_PREPARE_TARGET;
					};

					[_focus] call CAM_SET_TARGET;
				};

				// Enable camera input
				if !(["IsMapVisible"] call DISPLAY) then
				{
					["SetCameraManual", [true]] call CAM;
				};

				cameraEffectEnableHUD true;
				showHUD [true, true, true, true, true, true, true, true];
			};
		};

		[missionNamespace, "GRAD_EGSpectator_OnCameraModeChanged", [_newMode]] call BIS_fnc_callScriptedEventHandler;
	};

	/**
	 * Set's camera transform
	 */
	case "SetCameraTransform" :
	{
		private ["_location", "_vectorUp", "_vectorDir", "_dirOverride"];
		_location = _params select 0;
		_vectorUp = _params select 1;
		_vectorDir = _params select 2;
		_dirOverride = _params select 3;

		private "_camera";
		_camera = ["GetCamera"] call CAM;

		if (!isNull _camera) then
		{
			_camera setPosASL _location;
			_camera setVectorDirAndUp [_vectorDir, _vectorUp];

			if (_dirOverride select 1) then
			{
				_camera setDir (_dirOverride select 0);
			};
		};
	};

	/**
	 * Get's camera transform
	 * @param <ARRAY> The current camera transformation in format [<positionASL>, <vectorDir>, <vectorUp>, <direction, override>]
	 */
	case "GetCameraTransform" :
	{
		private "_camera";
		_camera = ["GetCamera"] call CAM;

		if (!isNull _camera) then
		{
			[getPosASLVisual _camera, vectorDirVisual _camera, vectorUpVisual _camera, [getDirVisual _camera, false]];
		}
		else
		{
			[[0,0,0], [0,0,0], [0,0,0], [0, false]];
		};
	};

	/**
	 * Returns position of this camera
	 * @param <ARRAY> The current camera position in ASL
	 */
	case "GetCameraPosition" :
	{
		private "_camera";
		_camera = ["GetCamera"] call CAM;

		if (!isNull _camera) then
		{
			getPosASLVisual _camera;
		}
		else
		{
			[0,0,0];
		};
	};

	/**
	 * Returns direction of this camera
	 * @param <SCALAR> The current camera direction
	 */
	case "GetCameraDirection" :
	{
		private "_camera";
		_camera = ["GetCamera"] call CAM;

		if (!isNull _camera) then
		{
			getDirVisual _camera;
		}
		else
		{
			0;
		};
	};

	/**
	 * Returns dummy target object
	 * @return <OBJECT> The target object
	 */
	case "GetDummyTarget" :
	{
		missionNamespace getVariable [VAR_CAMERA_DUMMY_TARGET, objNull];
	};

	/**
	 * State of the spectator display map is changed
	 * @return <BOOL> True if shown, false if hidden
	 */
	case "OnDisplayMapStateChanged" :
	{
		private "_shown";
		_shown = _params select 0;

		if (_shown) then
		{
			["SetCameraManual", [false]] call CAM;
		}
		else
		{
			if (["GetCameraMode"] call CAM == MODE_FREE) then
			{
				["SetCameraManual", [true]] call CAM;
			};
		};
	};

	/**
	 * Set's the camera manual state
	 */
	case "SetCameraManual" :
	{
		private "_manual";
		_manual = _params select 0;

		private "_camera";
		_camera = missionNamespace getVariable [VAR_CAMERA, objNull];

		if (!isNull _camera) then
		{
			if (_manual) then
			{
				_camera camCommand "manual on";
			}
			else
			{
				_camera camCommand "manual off";
			};

			missionNamespace setVariable [VAR_CAMERA_MANUAL, _manual];
		};
	};


	case "SetCameraInertia" : 
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: Inertia";
        private "_inertia";
        _inertia= _params select 0;

        private "_camera";
        _camera = missionNamespace getVariable [VAR_CAMERA, objNull];

        if (!isNull _camera) then
        {
            if (_inertia) then
            {
                _camera camCommand "inertia on"; // --> inertia on
            }
            else
            {
                _camera camCommand "inertia off"; // --> inertia off
            };

            missionNamespace setVariable [VAR_CAMERA_INERTIA, _inertia];
        };
    };
    

	/**
	 * Get's the camera manual state
	 */
	case "GetCameraManual" :
	{
		missionNamespace getVariable [VAR_CAMERA_MANUAL, true];
	};

	/**
	 * Set's the camera height mode
	 */
	case "SetCameraHeightMode" :
	{
		private "_atl";
		_atl = _params select 0;

		private "_camera";
		_camera = missionNamespace getVariable [VAR_CAMERA, objNull];

		if (!isNull _camera) then
		{
			if (_atl) then
			{
				_camera camCommand "atl on";
			}
			else
			{
				_camera camCommand "atl off";
			};

			missionNamespace setVariable [VAR_CAMERA_HEIGHT_MODE, _atl];
		};
	};

	/**
	 * Get's the camera height mode
	 */
	case "GetCameraHeightMode" :
	{
		missionNamespace getVariable [VAR_CAMERA_HEIGHT_MODE, true];
	};

	/**
	 * Set's the camera surface speed mode
	 */
	case "SetCameraUseSurfaceSpeed" :
	{
		private "_surfaceSpeed";
		_surfaceSpeed = _params select 0;

		private "_camera";
		_camera = missionNamespace getVariable [VAR_CAMERA, objNull];

		if (!isNull _camera) then
		{
			if (_surfaceSpeed) then
			{
				_camera camCommand "surfaceSpeed on";
			}
			else
			{
				_camera camCommand "surfaceSpeed off";
			};

			missionNamespace setVariable [VAR_CAMERA_USE_SURFACE_SPEED, _surfaceSpeed];
		};
	};

	/**
	 * Get's the camera manual state
	 */
	case "GetCameraUseSurfaceSpeed" :
	{
		missionNamespace getVariable [VAR_CAMERA_USE_SURFACE_SPEED, true];
	};

	/**
	 * Adds zoom input to the follow camera
	 */
	case "AddZoomInput" :
	{
		private "_value";
		_value = _params select 0;

		private "_zoom";
		_zoom = missionNamespace getVariable [VAR_FOLLOW_CAMERA_ZOOM, 0.0];
		_zoom = _zoom + _value;

		if (_zoom > FOLLOW_CAMERA_MAX_DISTANCE) then
		{
			_zoom = FOLLOW_CAMERA_MAX_DISTANCE;
		};

		if (_zoom < 0) then
		{
			_zoom = 0.0;
		};

		missionNamespace setVariable [VAR_FOLLOW_CAMERA_ZOOM, _zoom];
	};

	/**
	 * Adds yaw input to camera
	 * Only works for Follow camera mode
	 */
	case "AddYawInput" :
	{
		private "_value";
		_value = _params select 0;

		private "_yaw";
		_yaw = missionNamespace getVariable [VAR_FOLLOW_CAMERA_YAW, 0.0];
		_yaw = _yaw + _value;

		if (_yaw > 180.0) then
		{
			_yaw = _yaw - 360.0;
		};

		if (_yaw < -180.0) then
		{
			_yaw = _yaw + 360.0;
		};

		missionNamespace setVariable [VAR_FOLLOW_CAMERA_YAW, _yaw];
	};

	/**
	 * Adds pitch input to camera
	 * Only works for Follow camera mode
	 */
	case "AddPitchInput" :
	{
		private "_value";
		_value = _params select 0;

		private "_pitch";
		_pitch = missionNamespace getVariable [VAR_FOLLOW_CAMERA_PITCH, 0.0];
		_pitch = _pitch - _value;

		if (_pitch > 90.0) then
		{
			_pitch = 90.0;
		};

		if (_pitch < -90.0) then
		{
			_pitch = -90.0;
		};

		missionNamespace setVariable [VAR_FOLLOW_CAMERA_PITCH, _pitch];
	};

	/**
	 * Resets camera pitch / yaw / zoom
	 * Only works for Follow camera mode
	 */
	case "ResetInputs" :
	{
		missionNamespace setVariable [VAR_FOLLOW_CAMERA_ZOOM, 0.5];
		missionNamespace setVariable [VAR_FOLLOW_CAMERA_YAW, 0.0];
		missionNamespace setVariable [VAR_FOLLOW_CAMERA_PITCH, 0.0];
	};

	/**
	 * Turns on / off camera lights
	 */
	case "ToggleCameraLights" :
	{
		private ["_camera", "_on"];
		_camera = missionNamespace getVariable [VAR_CAMERA, objNull];
		_on = missionNamespace getVariable [VAR_CAMERA_LIGHTS_ON, false];

		if (_on) then
		{
			{
				deleteVehicle _x;
			} forEach (missionNamespace getVariable [VAR_CAMERA_LIGHTS, []]);

			missionNamespace setVariable [VAR_CAMERA_LIGHTS, []];
			missionNamespace setVariable [VAR_CAMERA_LIGHTS_ON, false];
		}
		else
		{
			private "_cameraLight";
			_cameraLight = "#lightpoint" createvehicleLocal getPosASL _camera;
			_cameraLight setLightBrightness 2;
			_cameraLight setLightAmbient [1,1,1];
			_cameraLight setLightColor [0,0,0];
			_cameraLight lightAttachObject [_camera, [0,0,0]];

			private "_pointerLight";
			_pointerLight = "#lightpoint" createvehicleLocal getPosASL _camera;
			_pointerLight setLightBrightness 1;
			_pointerLight setLightAmbient [1,1,1];
			_pointerLight setLightColor [0,0,0];

			missionNamespace setVariable [VAR_CAMERA_LIGHTS, [_cameraLight, _pointerLight]];
			missionNamespace setVariable [VAR_CAMERA_LIGHTS_ON, true];
		};
	};

	/**
	 * Enable or disable the very fast, free camera movement speed
	 */
	case "ToggleVeryFastSpeed" :
	{
		private _bEnable = _params param [0, false, [false]];

		if !(missionNamespace getVariable [VAR_IS_VERY_FAST_SPEED, false] isEqualTo _bEnable) then
		{
			private _camera = ["GetCamera"] call CAM;
			private _cameraMode = ["GetCameraMode"] call CAM;

			if (_cameraMode == MODE_FREE) then
			{
				missionNamespace setVariable [VAR_IS_VERY_FAST_SPEED, _bEnable];

				if (_bEnable) then
				{
					_camera camCommand format ["speedDefault %1", SPEED_VERYFAST];
				}
				else
				{
					_camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
				};
			}
			else
			{
				_camera camCommand format ["speedDefault %1", SPEED_DEFAULT];
				missionNamespace setVariable [VAR_IS_VERY_FAST_SPEED, false];
			};
		};
	};

	/**
	 * unknown function call
	 */
	default
	{
		scriptName "GRAD_fnc_EGSpectatorCamera: Default";
		["Unknown mode: %1", _mode] call BIS_fnc_error;
	};
};