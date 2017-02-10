
// todo: probably this thing isnt called at all currently
scriptName "GRAD_downloadSpectator.sqf";
disableSerialization;

// Functions / scripts
#define SELF 			{ _this call (missionNamespace getVariable ["BIS_fnc_EGObjectiveVisualizer", {}]); }
#define DRAW 			{ _this call (missionNamespace getVariable ["BIS_fnc_EGObjectiveVisualizerDraw", {}]); }
#define WIDGET 			{ _this call (uiNamespace getVariable ["RscEGProgress_script", {}]); }

// For variables
#define VAR_TICK		"BIS_progressVisualizer_tick"
#define VAR_LOOP		"BIS_progressVisualizer_loop"
#define VAR_OBJECTS 		"BIS_progressVisualizer_objects"
#define VAR_DISPLAYS 		"BIS_progressVisualizer_displays"
#define VAR_BLINKING_INCREASING	"BIS_progressVisualizer_blinkingIncreasing"
#define VAR_BLINKING_INPUT	"BIS_progressVisualizer_blinkingInput"

// Defines related to end game download / upload
#define VAR_IS_UPLOAD		"BIS_download_isUpload"
#define VAR_PROGRESS		"BIS_download_progress"
#define VAR_DOWNLOADING		"BIS_download_side"
#define VAR_DOWNLOADED_BY	"BIS_hvt_intelDownloadedBy"
#define VAR_INTEL_DESTROYED	"BIS_hvt_intelDestroyed"

// Misc defines
#define MAX_PROGRESS_DISTANCE	250.0
#define MAX_BLINK_OPACITY	0.5
#define MIN_BLINK_OPACITY	0.2

private ["_mode", "_params"];
_mode 	= _this param [0, "", [""]];
_params = _this param [1, [], [[]]];

switch _mode do
{
	case "Initialize" :
	{
		missionNamespace setVariable [VAR_OBJECTS, []];
		missionNamespace setVariable [VAR_DISPLAYS, []];
		missionNamespace setVariable [VAR_TICK, addMissionEventHandler ["Draw3D", { [] call DRAW; }]];
		missionNamespace setVariable [VAR_LOOP, [] spawn { while { true } do { ["Loop"] call SELF; }; }];
	};

	case "Terminate" :
	{
		{
			["TerminateContext", [_x]] call SELF;
		} forEach (missionNamespace getVariable [VAR_OBJECTS, []]);

		missionNamespace setVariable [VAR_OBJECTS, nil];
		missionNamespace setVariable [VAR_DISPLAYS, nil];

		// Stop ticking
		removeMissionEventHandler ["Draw3D", missionNamespace getVariable [VAR_TICK, -1]];
		missionNamespace getVariable [VAR_TICK, nil];

		// Stop loop
		terminate (missionNamespace getVariable [VAR_LOOP, scriptNull]);
		missionNamespace setVariable [VAR_LOOP, nil];
	};

	case "Loop" :
	{
		// Gather all objects
		private "_objects";
		_objects = missionNamespace getVariable [VAR_OBJECTS, []];

		{
			private _context = _x;

			if (!isNull _context) then
			{
				private _display = ["GetAssociatedDisplay", [_context]] call SELF;

				if (!isNil {_display} && {!isNull _display}) then
				{
					private ["_isUpload", "_progress", "_side", "_isInUse"];
					_isUpload = _context getVariable [VAR_IS_UPLOAD, false];
					_progress = _context getVariable [VAR_PROGRESS, 0.0];
					_side = _context getVariable [VAR_DOWNLOADING, sideUnknown];
					_isInUse = _side != sideUnknown;

					private ["_isVisible", "_isProgressVisible", "_isConflictVisible"];
					_isVisible = ["IsVisible", [_display, _context]] call WIDGET;
					_isProgressVisible = ["IsProgressVisible", [_display, _context]] call WIDGET;
					_isConflictVisible = ["IsConflictVisible", [_display, _context]] call WIDGET;

					private ["_distance", "_color"];
					_distance = (positionCameraToWorld [0,0,0]) distance2D _context;
					_color = if (!_isInUse) then { [0,0,0,MAX_BLINK_OPACITY] } else { [_side] call BIS_fnc_sideColor }; _color set [3, MAX_BLINK_OPACITY];

					// Update contents and position on screen
					["UpdateContent", [_display, _context, _isUpload, _progress, _side]] call WIDGET;

					// Blinking handling
					if (_isInUse) then
					{
						private _input = _context getVariable [VAR_BLINKING_INPUT, 0.0];
						private _goingUp = _context getVariable [VAR_BLINKING_INCREASING, true];

						if (_goingUp) then
						{
							_input = _input + 0.25;

							if (_input > MAX_BLINK_OPACITY) then
							{
								_input = MAX_BLINK_OPACITY;
								_context setVariable [VAR_BLINKING_INCREASING, false];
							};

							_context setVariable [VAR_BLINKING_INPUT, _input];
						};

						if (!_goingUp) then
						{
							_input = _input - 0.25;

							if (_input < MIN_BLINK_OPACITY) then
							{
								_input = MIN_BLINK_OPACITY;
								_context setVariable [VAR_BLINKING_INCREASING, true];
							};

							_context setVariable [VAR_BLINKING_INPUT, _input];
						};

						_color set [3, _input];
					};

					private ["_nearEntities", "_countW", "_countE"];
					_nearEntities = _context nearEntities ["Man", 250.0];
					_countW = { side group _x == WEST } count _nearEntities;
					_countE = { side group _x == EAST } count _nearEntities;

					// Conflict visibility
					if (!_isConflictVisible && _countW > 0 && _countE > 0) then
					{
						["SetConflictVisibility", [_display, _context, true]] call WIDGET;
					};

					if (_isConflictVisible && (_countW < 1 || _countE < 1)) then
					{
						["SetConflictVisibility", [_display, _context, false]] call WIDGET;
					};

					if (!_isInUse && ((_countW > 0 && _countE < 1) || (_countE > 0 && _countW < 1))) then
					{
						if (_countW > 0 && _countE < 1) then
						{
							_color = [WEST] call BIS_fnc_sideColor;
						}
						else
						{
							_color = [EAST] call BIS_fnc_sideColor;
						};

						 _color set [3, MAX_BLINK_OPACITY];
					};

					// Set correct side color
					["SetSideColor", [_display, _context, _color]] call WIDGET;

					// Check whether we should start showing progress
					if (!_isProgressVisible && {_isInUse} && {_distance <= MAX_PROGRESS_DISTANCE}) then
					{
						["SetProgressVisibility", [_display, _context, true, true]] call WIDGET;
					};

					// Check whether we should stop showing progress
					if (_isProgressVisible && {!_isInUse || {_distance > MAX_PROGRESS_DISTANCE}}) then
					{
						["SetProgressVisibility", [_display, _context, false, false]] call WIDGET;
					};

					// Whether we should destroy ourselves
					if (!isNil { _context getVariable VAR_INTEL_DESTROYED } || {count (_context getVariable [VAR_DOWNLOADED_BY, []]) > 1}) then
					{
						["TerminateContext", [_context]] call SELF;
					};
				};
			};

			sleep 0.05;
		} forEach _objects;

		sleep 0.20;
	};

	case "InitializeContext" :
	{
		private _context = _params param [0, objNull, [objNull]];

		if (!isNull _context) then
		{
			// Add context to objects list
			private _objects = missionNamespace getVariable [VAR_OBJECTS, []];
			_objects pushBack _context;
			missionNamespace setVariable [VAR_OBJECTS, _objects];

			// Generate unique object id
			private _id = format ["RscEGProgress_%1", [_context] call BIS_fnc_objectVar];

			// Create widget
			// This will also add the assigned display to the displays list
			(_id call BIS_fnc_rscLayer) cutRsc ["RscEGProgress", "PLAIN"];
		};
	};

	case "TerminateContext" :
	{
		private _context = _params param [0, objNull, [objNull]];

		if (!isNull _context && {_context in (missionNamespace getVariable [VAR_OBJECTS, []])}) then
		{
			private _display = ["GetAssociatedDisplay", [_context]] call SELF;

			if (!isNil {_display} && {!isNull _display}) then
			{
				private _displays = missionNamespace getVariable [VAR_DISPLAYS, []];
				_displays = _displays - [_display];
				missionNamespace setVariable [VAR_DISPLAYS, _displays];

				private _objects = missionNamespace getVariable [VAR_OBJECTS, []];
				_objects = _objects - [_context];
				missionNamespace setVariable [VAR_OBJECTS, _objects];

				private _id = format ["RscEGProgress_%1", [_context] call BIS_fnc_objectVar];

				// Destroy widget
				(_id call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

				// Needs to be called in order for widget to be properly destroyed
				["onUnload"] call WIDGET;
			};
		};
	};

	case "GetAssociatedDisplay" :
	{
		private _context = _params param [0, objNull, [objNull]];

		if (!isNull _context) then
		{
			private _displays = missionNamespace getVariable [VAR_DISPLAYS, []];
			private _objects = missionNamespace getVariable [VAR_OBJECTS, []];
			private _index = _objects find _context;

			if (_index > -1 && { count _displays >= _index - 1 }) then
			{
				_displays select _index;
			}
			else
			{
				displayNull;
			};
		}
		else
		{
			displayNull;
		};
	};

	default
	{
		["Unknown mode: %1", _mode] call BIS_fnc_error;
	};
};