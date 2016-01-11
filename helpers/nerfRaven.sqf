/* Disables thermal imaging of Raven drone
*
* Executed via init.sqf:
* [] execVM "helpers\nerfRaven.sqf"
*/ 


// Executed on any keydown while GCS camera feed is open
TI_onKeyDown = {
	_dikCode = (_this select 0) select 1;

	// N-key
	if (_dikCode == 49) then {
		TI_activeGCS setVariable ["mavCameraOn",0,false];
		TI_activeGCS setVariable ["mavVisionMode",0,true];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", TI_deh];
		player say "error2";
		hint localize "str_GRAD_ravenError1";
	};

	// G-key
	if (_dikCode == 34) then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", TI_deh];
	};
};

// Executed when any addaction-action is performed
TI_onAction = '
	_actionDesc = _this select 4;
	TI_activeGCS = _this select 0;

	if (_actionDesc == "   MINICAM: MODE") then {
		player setVariable ["miniCamMode",-1,false];
		miniCamOn = [-1] call BIS_fnc_liveFeedEffects;
		player say "error2";
		hint localize "str_GRAD_ravenError2";
	};

	_actionDescArray = _actionDesc splitString " ";
	_firstWord = _actionDescArray select 0;
	_secondWord = _actionDescArray select 1;

	if ((_firstWord == "CAMERA") && (_secondWord == "FEED")) then {
	TI_deh = (findDisplay 46) displayAddEventHandler ["KeyDown", "[_this] call TI_onKeyDown"];
	};
	false;
';

// Add Eventhandler to player
inGameUISetEventHandler ["Action", TI_onAction];
