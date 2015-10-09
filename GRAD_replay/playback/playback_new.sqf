#include "\z\ace\addons\main\script_component.hpp"

_speed = _this select 0;


[{["Starting Replay."] call EFUNC(common,displayTextStructured);},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[{openMap [true,false];},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

if (isServer || isDedicated) then {

	getDayTimeConverted = {
		_getdaytime = _this select 0;
		//daytime = 1.66046
		_hour = floor _getdaytime;
		_minute = floor ((_getdaytime - _hour) * 60);
		_second = floor (((((_getdaytime) - (_hour))*60) - _minute)*60);
		_time24 = text format ["%1:%2:%3",_hour,_minute,_second];
		if (_minute < 10) then {
		_time24 = text format ["%1:0%2:%3",_hour,_minute,_second];
		};
		if (_second < 10) then {
		_time24 = text format ["%1:%2:0%3",_hour,_minute,_second];
		};
		if (_second < 10 && _minute < 10) then {
		_time24 = text format ["%1:0%2:0%3",_hour,_minute,_second];
		};
		//_time24 = 1:39:37
		_time24
	};

	checkArrayLength = {
		_value = _this select 0;
		_array = _this select 1;
		if (_value < 0) then {_value = 0};
		if (_value > count _array - 1) then {_value = count _array - 1};
		_value
	};

	// **** change : faster Option (If) added
	getSideMarkerColor = {
		_mySide = _this select 0;
		_result = "ColorCivilian";
		switch(true)do
		{
		  case (_mySide == west):{_result = "ColorBLUFOR";};
		  case (_mySide == resistance):{_result = "ColorIndependent";};
		  case (_mySide == east):{_result = "ColorOPFOR";};
		};
		_result
	};

	refreshMarkers = {
			{deleteMarker _x;} forEach current_markers;

		for [{_k=0}, {_k < (((local_recording) select local_recording_counter) select 1)}, {_k=_k+1}] do {
			_prepare_unit = (((((local_recording) select 0) select 2) select _k) select 0);
			_prepare_side = (((((local_recording) select 0) select 2) select _k) select 1);
			_prepare_pos = (((((local_recording) select 0) select 2) select _k) select 2);
			_prepare_dir = (((((local_recording) select 0) select 2) select _k) select 3);
			_prepare_kindof = (((((local_recording) select 0) select 2) select _k) select 4);
			_prepare_veh = (((((local_recording) select 0) select 2) select _k) select 5);
			
			if (!(_prepare_unit in deadUnitMarkers)) then {
			//diag_log format ["marker for %1 created",_prepare_unit];
				_marker = createMarker [format["%1",_prepare_unit],_prepare_pos];
				_marker setMarkerShape "ICON";
				_marker setMarkerType _prepare_kindof;
				_marker setMarkerAlpha 1;
				_marker setMarkerDir _prepare_dir;
				_marker setMarkerColor ([_prepare_side] call getSideMarkerColor);
				current_markers = current_markers + [_marker];
			};
		};
	};

	[] spawn {
		local_recording_length = count local_recording;
		local_recording_counter = 0;
		current_markers = [];
		deadUnitMarkers = [];
		local_recording_playback_speed = 1;
		_tempCurrentPlayerCount = 0;


		// CREATE EVERY UNIT MARKER ONLY ONCE// **** change : ((count players) - 1)
		
		sleep 1; //debug
		while {true} do
		{

		if (_tempCurrentPlayerCount != ((local_recording) select local_recording_counter) select 1) then {
			[] call refreshMarkers;
			_tempCurrentPlayerCount = (((local_recording) select local_recording_counter) select 1);
			diag_log format ["Replay: refreshing Markers."];
		};
			for [{_i=0}, {_i < count current_markers}, {_i=_i+1}] do {
			if (count current_markers < 1) exitWith {};
			_curMarker = current_markers select _i;
			_unit = (((((local_recording) select local_recording_counter) select 2) select _i) select 0);
			_pos = [((((((local_recording) select local_recording_counter) select 2) select _i) select 2) select 0),((((((local_recording) select local_recording_counter) select 2) select _i) select 2) select 1)];
			_dir = (((((local_recording) select local_recording_counter) select 2) select _i) select 3);
			_kindof = (((((local_recording) select local_recording_counter) select 2) select _i) select 4);
			_veh= (((((local_recording) select local_recording_counter) select 2) select _i) select 5);
		
			_curMarker setMarkerPos _pos;
			_curMarker setMarkerDir _dir;
			_curMarker setMarkerType _kindof;
			
				if (_kindof == "KIA" && !(_unit in deadUnitMarkers)) then {
					_marker_kia = createMarker [format["kia_%1",_unit],_pos];
					_marker_kia setMarkerShape "ICON";
					_marker_kia setMarkerType _kindof;
					_marker_kia setMarkerAlpha 1;        //**** change : new Command added
					_marker_kia setMarkerDir _dir;
					_marker_kia setMarkerColor ([(((((local_recording) select local_recording_counter) select 2) select _a) select 1)] call getSideMarkerColor);
					deadUnitMarkers = deadUnitMarkers + [_unit];
				};
			
			};
		
		local_recording_counter = local_recording_counter + local_recording_playback_speed;

		if (local_recording_counter > local_recording_length) exitWith {
			[{["Replay finished."] call EFUNC(common,displayTextStructured);},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		
		sleep 0.05; // debug slower
		};
	};
};
