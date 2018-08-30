/*     Author: Thomas Ryan
     Description:     Play a fake UAV observational sequence which serves as an establishing shot.
     Parameters:     	_this select 0: OBJECT or ARRAY - Target position/object     	_this select 1: STRING - Text to display     	_this select 2 (Optional): NUMBER - Altitude (in meters)     	_this select 3 (Optional): NUMBER - Radius of the circular movement (in meters)     	_this select 4 (Optional): NUMBER - Viewing angle (in degrees)     	_this select 5 (Optional): NUMBER - Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)     	_this select 6 (Optional): ARRAY -	Objects/positions/groups to display icons over     						Syntax: [[icon, color, target, size X, size Y, angle, text, shadow]]     	_this select 7 (Optional): NUMBER - Mode (0: normal (default), 1: world scenes)     	_this select 8 (Optional): BOOL - Fade in after completion (default: true)
*/

private ["_tgt", "_txt", "_alt", "_rad", "_ang", "_dir"];
_tgt = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;
_txt = [_this, 1, "", [""]] call BIS_fnc_param;
_alt = [_this, 2, 500, [500]] call BIS_fnc_param;
_rad = [_this, 3, 200, [200]] call BIS_fnc_param;
_ang = [_this, 4, random 360, [0]] call BIS_fnc_param;
_dir = [_this, 5, round random 1, [0]] call BIS_fnc_param;

BIS_fnc_establishingShot_icons = [_this, 6, [], [[]]] call BIS_fnc_param;

private ["_mode"];
_mode = [_this, 7, 0, [0]] call BIS_fnc_param;

if (_mode == 0) then {     enableSaving [false, false];     BIS_missionStarted = nil;
};

private ["_fade"];
_fade = [_this, 8, true, [true]] call BIS_fnc_param;

if (_fade) then {     ["BIS_fnc_establishingShot",false] call BIS_fnc_blackOut;
} else {     0 fadeSound 0;     titleCut ["", "BLACK FADED", 10e10];
};

// Create fake UAV
if (isNil "BIS_fnc_establishingShot_fakeUAV") then {     BIS_fnc_establishingShot_fakeUAV = "Camera" camCreate [10,10,10];
};

BIS_fnc_establishingShot_fakeUAV cameraEffect ["INTERNAL", "BACK"];

cameraEffectEnableHUD true;

private ["_pos", "_coords"];
_pos = if (typeName _tgt == typeName objNull) then {position _tgt} else {_tgt};
_coords = [_pos, _rad, _ang] call BIS_fnc_relPos;
_coords set [2, _alt];

BIS_fnc_establishingShot_fakeUAV camPrepareTarget _tgt;
BIS_fnc_establishingShot_fakeUAV camPreparePos _coords;
BIS_fnc_establishingShot_fakeUAV camPrepareFOV 0.700;
BIS_fnc_establishingShot_fakeUAV camCommitPrepared 0;

// Timeout the preload after 3 seconds
BIS_fnc_establishingShot_fakeUAV camPreload 3;

// Apply post-process effects
private ["_ppColor"];
_ppColor = ppEffectCreate ["colorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.1, 0.1, 0.1, 1], [1, 1, 1, 1.0]];
_ppColor ppEffectCommit 0;

private ["_ppGrain"];
_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;

// Disable stuff after simulation starts
[] spawn
{     waitUntil {time > 0};     showCinemaBorder false;     enableEnvironment false;
};

private ["_SITREP", "_key"];

if (_mode == 1) then {     optionsMenuOpened = {     	disableSerialization;     	{(_x call BIS_fnc_rscLayer) cutText ["", "PLAIN"]} forEach ["BIS_layerStatic", "BIS_layerInterlacing"];     };
} else {     // Compile SITREP text     private ["_month", "_day", "_hour", "_minute"];     _month = str (date select 1);     _day = str (date select 2);     _hour = str (date select 3);     _minute = str (date select 4);
     if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};     if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};     if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};     if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};
     private ["_time", "_date"];     _time = format ["%1:%2", _hour, _minute];     _date = format ["%1-%2-%3", str (date select 0), _month, _day];
     //_SITREP = format [localize "STR_A3_BIS_fnc_establishingShot_SITREP" + "||%1|%2||" + localize "STR_A3_BIS_fnc_establishingShot_Time", toUpper _txt, _date, _time];          /* _SITREP = [     	[_date + " ", ""],     	[_time, "font = 'PuristaMedium'"],     	["", "<br/>"],     	[toUpper _txt, ""]     ]; */
     disableSerialization;
     waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
     // Compile key     _key = format ["BIS_%1.%2_establishingShot", missionName, worldName];
     // Remove eventhandler if it exists (only happens when restarting)     if (!(isNil {uiNamespace getVariable "BIS_fnc_establishingShot_skipEH"})) then {     	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_establishingShot_skipEH"];     	uiNamespace setVariable ["BIS_fnc_establishingShot_skipEH", nil];     };
     // Add skipping eventhandler     private ["_skipEH"];     _skipEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [     	"KeyDown",     	format [     		"     			if (BLUFOR_TELEPORT_TARGET select 0 != 0) then {     				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'BIS_fnc_establishingShot_skipEH'];     				uiNamespace setVariable ['BIS_fnc_establishingShot_skipEH', nil];
     				playSound ['click', true];
     				BIS_fnc_establishingShot_skip = true;     			};
     			     			if (_this select 1 != 1) then {true};     		",     		_key     	]     ];
     
     uiNamespace setVariable ["BIS_fnc_establishingShot_skipEH", _skipEH];
     // Create vignette & tiles     ("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];
     // Remove effects if video options opened     optionsMenuOpened = {     	disableSerialization;     	{(_x call BIS_fnc_rscLayer) cutText ["", "PLAIN"]} forEach ["BIS_layerEstShot", "BIS_layerStatic", "BIS_layerInterlacing"];     };
     optionsMenuClosed = {     	disableSerialization;     	("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];     };
     waitUntil {!(isNull (uiNamespace getVariable "RscEstablishingShot"))};
};

// Wait for the camera to load
waitUntil {camPreloaded BIS_fnc_establishingShot_fakeUAV || !(isNil "BIS_fnc_establishingShot_skip")};

private ["_drawEH"];

if (isNil "BIS_fnc_establishingShot_skip") then {     BIS_fnc_establishingShot_playing = true;
     // Create logic to play sounds     BIS_fnc_establishingShot_logic_group = createGroup sideLogic;     BIS_fnc_establishingShot_logic1 = BIS_fnc_establishingShot_logic_group createUnit ["Logic", [10,10,10], [], 0, "NONE"];     BIS_fnc_establishingShot_logic2 = BIS_fnc_establishingShot_logic_group createUnit ["Logic", [10,10,10], [], 0, "NONE"];     BIS_fnc_establishingShot_logic3 = BIS_fnc_establishingShot_logic_group createUnit ["Logic", [10,10,10], [], 0, "NONE"];
     [] spawn {     	scriptName "BIS_fnc_establishingShot: UAV sound loop";
     	// Determine duration     	private ["_sound", "_duration"];     	_sound = "UAV_loop";     	_duration = getNumber (configFile >> "CfgSounds" >> _sound >> "duration");
     	while {!(isNull BIS_fnc_establishingShot_logic1)} do {     		BIS_fnc_establishingShot_logic1 say _sound;     		sleep _duration;
     		if (!(isNull BIS_fnc_establishingShot_logic2)) then {     			BIS_fnc_establishingShot_logic2 say _sound;     			sleep _duration;     		};     	};     };
     [] spawn {     	scriptName "BIS_fnc_establishingShot: random sounds control";
     	while {!(isNull BIS_fnc_establishingShot_logic3)} do {     		// Choose random sound     		private ["_sound", "_duration"];     		_sound = format ["UAV_0%1", round (1 + random 8)];     		_duration = getNumber (configFile >> "CfgSounds" >> _sound >> "duration");
     		BIS_fnc_establishingShot_logic3 say _sound;
     		sleep (_duration + (5 + random 5));     	};     };
     // Move camera in a circle     [_pos, _alt, _rad, _ang, _dir] spawn {     	scriptName "BIS_fnc_establishingShot: camera control";
     	private ["_pos", "_alt", "_rad", "_ang", "_dir"];     	_pos = _this select 0;     	_alt = _this select 1;     	_rad = _this select 2;     	_ang = _this select 3;     	_dir = _this select 4;
     	while {isNil "BIS_missionStarted"} do {     		private ["_coords"];     		     		_coords = [_pos, _rad, _ang] call BIS_fnc_relPos;     		     		_coords set [2, _alt];
     		BIS_fnc_establishingShot_fakeUAV camPreparePos _coords;     		BIS_fnc_establishingShot_fakeUAV camCommitPrepared 0.5;
     		waitUntil {camCommitted BIS_fnc_establishingShot_fakeUAV || !(isNil "BIS_missionStarted")};
     		BIS_fnc_establishingShot_fakeUAV camPreparePos _coords;     		BIS_fnc_establishingShot_fakeUAV camCommitPrepared 0;     		     		_ang = if (_dir == 0) then {_ang - 0.5} else {_ang + 0.5};     	};     };
     sleep 1;
     if (isNil "BIS_fnc_establishingShot_skip") then {     	enableEnvironment true;     	2 fadeSound 1;
     	// Static fade-in     	("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];     	waitUntil {!(isNull (uiNamespace getVariable "RscStatic_display")) || !(isNil "BIS_fnc_establishingShot_skip")};     	waitUntil {isNull (uiNamespace getVariable "RscStatic_display")  || !(isNil "BIS_fnc_establishingShot_skip")};
     	if (isNil "BIS_fnc_establishingShot_skip") then {     		// Show interlacing     		("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
     		// Show screen     		if (_fade) then {     			("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];     		} else {     			titleCut ["", "PLAIN"];     		};
     		// Add interlacing to optionsMenuClosed     		optionsMenuClosed = if (_mode == 0) then {     			{     				("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];     				("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];     			};     		} else {     			{     				("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];     			};     		};
     		// Show icons     		if (count BIS_fnc_establishingShot_icons > 0) then {     			_drawEH = addMissionEventHandler [     				"Draw3D",     				{     					{     						private ["_icon", "_color", "_target", "_sizeX", "_sizeY", "_angle", "_text", "_shadow"];     						_icon = [_x, 0, "", [""]] call BIS_fnc_param;     						_color = [_x, 1, [], [[]]] call BIS_fnc_param;     						_target = [_x, 2, [], [[], objNull, grpNull]] call BIS_fnc_param;     						_sizeX = [_x, 3, 1, [1]] call BIS_fnc_param;     						_sizeY = [_x, 4, 1, [1]] call BIS_fnc_param;     						_angle = [_x, 5, random 360, [0]] call BIS_fnc_param;     						_text = [_x, 6, "", [""]] call BIS_fnc_param;     						_shadow = [_x, 7, 0, [0]] call BIS_fnc_param;
     						// Determine condition and position     						private ["_condition", "_position"];     						_condition = true;     						_position = _target;
     						switch (typeName _target) do {     							// Object     							case typeName objNull: {     								_condition = alive _target;     								_position = getPosATL _target;     							};
     							// Group     							case typeName grpNull: {     								_condition = {alive _x} count units _target > 0;     								_position = getPosATL leader _target;     							};     						};
     						// Draw icon     						if (_condition) then {     							drawIcon3D [_icon, _color, _position, _sizeX, _sizeY, _angle, _text, _shadow];     						};     					} forEach BIS_fnc_establishingShot_icons;     				}     			];     		};
     		if (_mode == 0) then {     			// Spawn instructions separately to allow for no delay in skipping     			_key spawn {     				scriptName "BIS_fnc_establishingShot: instructions control";
     				disableSerialization;
     				private ["_key"];     				_key = _this;
     				if (!(isKeyActive _key) && isNil "BIS_fnc_establishingShot_skip") then {     					// Display instructions     					private ["_layerTitlecard"];     					_layerTitlecard = "BIS_layerTitlecard" call BIS_fnc_rscLayer;     					_layerTitlecard cutRsc ["RscDynamicText", "PLAIN"];
     					private ["_dispText", "_ctrlText"];     					_dispText = uiNamespace getVariable "BIS_dynamicText";     					_ctrlText = _dispText displayCtrl 9999;
     					_ctrlText ctrlSetPosition [     						0 * safeZoneW + safeZoneX,     						0.8 * safeZoneH + safeZoneY,     						safeZoneW,     						safeZoneH     					];
     					// Determine appropriate key highlight     					private ["_keyColor"];     					_keyColor = format [     						"<t color = '%1'>",     						(["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML     					];
     					private ["_skipText"];     					/*_skipText = format [     						localize "STR_A3_BIS_fnc_titlecard_pressSpace",     						"<t size = '0.75'>",     						_keyColor,     						"</t>",     						"</t>"     					];*/     					_skipText = "";
     					_ctrlText ctrlSetStructuredText parseText _skipText;     					_ctrlText ctrlSetFade 1;     					_ctrlText ctrlCommit 0;
     					_ctrlText ctrlSetFade 0;     					_ctrlText ctrlCommit 1;
     					// Wait for video to finish     					waitUntil {{!(isNil _x)} count ["BIS_fnc_establishingShot_skip", "BIS_fnc_establishingShot_UAVDone"] > 0};
     					// Remove instructions     					_ctrlText ctrlSetFade 1;     					_ctrlText ctrlCommit 0;     				};     			};     			     			private ["_time"];     			_time = time + 2;     			waitUntil {time >= _time || !(isNil "BIS_fnc_establishingShot_skip")};
     			if (isNil "BIS_fnc_establishingShot_skip") then {     				/*((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlSetPosition [     					(((safeZoneW / safeZoneH) min 1.2) / 40) + safeZoneX,     					((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + safeZoneY,     					safeZoneW,     					safeZoneH     				];
     				((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlCommit 0;
     				// Split text to individual characters     				private ["_SITREPArray"];     				_SITREPArray = toArray _SITREP;     				{_SITREPArray set [_forEachIndex, toString [_x]]} forEach _SITREPArray;
     				private ["_scrollIn"];     				_scrollIn = _SITREPArray spawn {     					disableSerialization;
     					private ["_SITREPArray"];     					_SITREPArray = _this;
     					private ["_SITREPCompile", "_SITREPString", "_SITREPParsed"];     					_SITREPCompile = "";
     					// Make text scroll in     					for "_i" from 0 to (count _SITREPArray - 1) do {     						private ["_character", "_delay"];     						_character = _SITREPArray select _i;     						_delay = if (_character == "|") then {_character = "<br/>"; 1} else {0.01};
     						_SITREPCompile = _SITREPCompile + _character;
     						private [];     						_SITREPString = "<t align = 'left' shadow = '1' font = 'EtelkaMonospacePro'>" + _SITREPCompile + "_</t>";     						_SITREPParsed = parseText _SITREPString;
     						if (!(isNull (uiNamespace getVariable "RscEstablishingShot"))) then {     							((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlSetStructuredText _SITREPParsed;     							((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlCommit 0;     						};
     						sleep _delay;     					};
     					if (!(isNull (uiNamespace getVariable "RscEstablishingShot"))) then {     						_SITREPString = "<t align = 'left' shadow = '1' font = 'EtelkaMonospacePro'>" + _SITREPCompile + "</t>";     						_SITREPParsed = parseText _SITREPString;
     						((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlSetStructuredText _SITREPParsed;     					};
     					sleep 8;     				};*/     				     				// Display SITREP     				/* BIS_fnc_establishingShot_SITREP = [     					_SITREP,     					0.015 * safeZoneW + safeZoneX,     					0.015 * safeZoneH + safeZoneY,     					false,     					"<t align = 'left' size = '1.0' font = 'PuristaLight'>%1</t>"     				] spawn BIS_fnc_typeText2;*/
     				/* waitUntil {scriptDone BIS_fnc_establishingShot_SITREP || !(isNil "BIS_fnc_establishingShot_skip")};*/     					     				if (playerSide == east) then {     				cutRsc ["gui_opfor_pleasewait","PLAIN",0];     				} else {     				cutRsc ["gui_blufor_pleasewait","PLAIN",0];     				};
     				private ["_time"];     				_time = time + 999999;     				waitUntil {time >= _time || !(isNil "BIS_fnc_establishingShot_skip") || (BLUFOR_TELEPORT_TARGET select 0 != 0)};
     				if (isNil "BIS_fnc_establishingShot_skip") then {     					// Register the UAV finished     					BIS_fnc_establishingShot_UAVDone = true;     				};     			};     		};     	};     };
};

if (_mode == 0) then {     waitUntil {{!(isNil _x)} count ["BIS_fnc_establishingShot_skip", "BIS_fnc_establishingShot_UAVDone"] > 0};
     // Remove skipping eventhandler if it wasn't removed already     if (!(isNil {uiNamespace getVariable "BIS_fnc_establishingShot_skipEH"})) then {     	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_establishingShot_skipEH"];     	uiNamespace setVariable ["BIS_fnc_establishingShot_skipEH", nil];     };
     // Static fade-out     2 fadeSound 0;
     ("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];     waitUntil {!(isNull (uiNamespace getVariable "RscStatic_display"))};     waitUntil {isNull (uiNamespace getVariable "RscStatic_display")};          // Remove SITREP     if (!(isNil "BIS_fnc_establishingShot_SITREP")) then {     	terminate BIS_fnc_establishingShot_SITREP;     	["", 0, 0, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;     };
     // Delete sound logics and group     {if (!(isNil _x)) then {deleteVehicle (missionNamespace getVariable _x)}} forEach ["BIS_fnc_establishingShot_logic1", "BIS_fnc_establishingShot_logic2", "BIS_fnc_establishingShot_logic3"];     if (!(isNil "BIS_fnc_establishingShot_logic_group")) then {deleteGroup BIS_fnc_establishingShot_logic_group};
     // Remove HUD     optionsMenuOpened = nil;     optionsMenuClosed = nil;
     if (!(isNil "_drawEH")) then {     	removeMissionEventHandler ["Draw3D", _drawEH];     };
     if (!(isNull (uiNamespace getVariable "RscEstablishingShot"))) then {     	((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlSetFade 1;     	((uiNamespace getVariable "RscEstablishingShot") displayCtrl 2500) ctrlCommit 0;     };
     {     	private ["_layer"];     	_layer = _x call BIS_fnc_rscLayer;     	_layer cutText ["", "PLAIN"];     } forEach ["BIS_layerEstShot", "BIS_layerStatic", "BIS_layerInterlacing"];          enableEnvironment false;          if (_fade) then {     	("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","BLACK FADED",10e10];     } else {     	titleCut ["", "BLACK FADED", 10e10];     };
     sleep 1;
     enableSaving [true, true];
     BIS_fnc_establishingShot_fakeUAV cameraEffect ["TERMINATE", "BACK"];     camDestroy BIS_fnc_establishingShot_fakeUAV;
     ppEffectDestroy _ppColor;     ppEffectDestroy _ppGrain;
     // Clear existing global variables     BIS_fnc_establishingShot_icons = nil;     BIS_fnc_establishingShot_spaceEH = nil;     BIS_fnc_establishingShot_skip = nil;     BIS_fnc_establishingShot_UAVDone = nil;          if (_fade) then {     	["BIS_fnc_establishingShot"] call BIS_fnc_blackIn;     };          enableEnvironment true;
     // Start mission     BIS_missionStarted = true;     BIS_fnc_establishingShot_playing = false;
};

true