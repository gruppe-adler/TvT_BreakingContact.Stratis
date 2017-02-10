// Do not serialize this script
disableSerialization;

// Common defines
#include "\a3\Ui_f\hpp\defineResinclDesign.inc"

// For variables
#define VAR_OBJECTS 		"BIS_progressVisualizer_objects"
#define VAR_DISPLAYS 		"BIS_progressVisualizer_displays"

// Gather all objects
private "_objects";
_objects = missionNamespace getVariable [VAR_OBJECTS, []];

{
	private _context = _x;

	if (!isNull _context) then
	{
		private _displays = missionNamespace getVariable [VAR_DISPLAYS, []];
		private _objects = missionNamespace getVariable [VAR_OBJECTS, []];
		private _index = _objects find _context;
		private _display = displayNull;

		if (_index > -1 && { count _displays >= _index - 1 }) then
		{
			_display = _displays select _index;
		};

		if (!isNull _display) then
		{
			private ["_widget", "_scaleX", "_scaleY"];
			_widget = _display displayCtrl IDC_RSCEGPROGRESS_DOWNLOAD;
			_scaleX = (ctrlPosition _widget) select 2;
			_scaleY = (ctrlPosition _widget) select 3;

			private _posWorld = getPosATLVisual _context; _posWorld set [2, (_posWorld select 2) + 2.0];
			private _posScreen = worldToScreen _posWorld;

			if (count _posScreen > 0) then
			{
				_widget ctrlSetPosition _posScreen;
				_widget ctrlShow true;
				_widget ctrlCommit 0.0;
			}
			else
			{
				_widget ctrlShow false;
				_widget ctrlCommit 0.0;
			};
		};
	};
} forEach _objects;