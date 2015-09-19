#include "\z\ace\addons\main\script_component.hpp"

//--- Classic camera script, enhanced by Karel Moricky, 2010/03/19
//--- pimped for his needs by nomisum, 2014/11/30


if (!isNil "BIS_DEBUG_CAM") exitwith {};

//--- Is FLIR available
if (isnil "BIS_DEBUG_CAM_ISFLIR") then {
	BIS_DEBUG_CAM_ISFLIR = isclass (configfile >> "cfgpatches" >> "A3_Data_F");
};

playableUnitsSelector = 0;
playersLeftUnits = [];
camInertia = true;
	

BIS_DEBUG_CAM_MAP = false;
BIS_DEBUG_CAM_VISION = 0;
BIS_DEBUG_CAM_FOCUS = 0;
BIS_DEBUG_CAM_COLOR = ppEffectCreate ["colorCorrections", 1600];
if (isnil "BIS_DEBUG_CAM_PPEFFECTS") then {
	BIS_DEBUG_CAM_PPEFFECTS = [
		[1, 1, -0.01, [1.0, 0.6, 0.0, 0.005], [1.0, 0.96, 0.66, 0.55], [0.95, 0.95, 0.95, 0.0]],
		[1, 1.02, -0.005, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.6, 0.65],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 1, 0.5],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.06, -0.01, [0.0, 0.0, 0.0, 0.0], [0.44, 0.26, 0.078, 0],  [0.199, 0.587, 0.114, 0.0]]
	];
};

//--- Undefined
if (typename _this != typename objnull) then {_this = cameraon};

private ["_ppos", "_pX", "_pY"];
_ppos = getPosATL _this;
_pX = _ppos select 0;
_pY = _ppos select 1;
_pZ = _ppos select 2;



_pHeight = getTerrainHeightASL [_pX, _pY];
if (_pHeight < 0) then {_pZ = _pZ + _pHeight};

private ["_local"];
_posRespawnHelperX = getPos sector_trigger select 0;
_posRespawnHelperY = getPos sector_trigger select 1;
_local = "camera" camCreate [_posRespawnHelperX + 100, _posRespawnHelperY, _pZ + 40];
BIS_DEBUG_CAM = _local;
_local camCommand "MANUAL ON";
_local camCommand "INERTIA ON";
_local cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;


//BIS_DEBUG_CAM setDir direction (vehicle player);
BIS_DEBUG_CAM camPrepareTarget getPos sector_trigger; 
BIS_DEBUG_CAM camcommitprepared 0;
//BIS_DEBUG_CAM setDir direction (respawn_helper);


//--- Marker
BIS_DEBUG_CAM_MARKER = createmarkerlocal ["BIS_DEBUG_CAM_MARKER",_ppos];
BIS_DEBUG_CAM_MARKER setmarkertypelocal "mil_start";
BIS_DEBUG_CAM_MARKER setmarkercolorlocal "ColorWhite";
BIS_DEBUG_CAM_MARKER setmarkersizelocal [.75,.75];
BIS_DEBUG_CAM_MARKER setmarkertextlocal "Your Spectator Cam";




[] spawn {
	while {true} do {
		sleep 0.5;
		{player reveal _x} forEach allUnits;
		if (isNil "BIS_DEBUG_CAM") exitwith {};

		
		
		
		
		if (cursorTarget isKindOf "Man" && cursorTarget distance BIS_DEBUG_CAM < 30) then {
			sideOfTarget = "";
			nameOfTarget = name cursorTarget;
			if (side cursorTarget == West) then {
			sideOfTarget = '<t color="#008cda">BLUFOR</t>';
			};
			if (side cursorTarget== East) then {
			sideOfTarget = '<t color="#c80000">OPFOR</t>';
			};
			if (side cursorTarget== Civilian && !(name cursorTarget in SPECTATOR_LIST)) then {
			sideOfTarget = '<t color="#ffffff">Bewusstlos</t>';
			};
			text0 = format ["%1<br />%2", nameOfTarget, sideOfTarget];
			[text0] call EFUNC(common,displayTextStructured);	
			sleep 1;
			
		};

	};
};


//--- Key Down
_keyDown = (finddisplay 46) displayaddeventhandler ["keydown","
	_key = _this select 1;
	_ctrl = _this select 3;

	if (_key in (actionkeys 'nightvision')) then {
		BIS_DEBUG_CAM_VISION = BIS_DEBUG_CAM_VISION + 1;
		if (BIS_DEBUG_CAM_ISFLIR) then {
					_vision = BIS_DEBUG_CAM_VISION % 4;
			switch (_vision) do {
				case 0: {
					camusenvg false;
					call compile 'false SetCamUseTi 0';
				};
				case 1: {
					camusenvg true;
					call compile 'false SetCamUseTi 0';
				};
				case 2: {
					camusenvg false;
					call compile 'true SetCamUseTi 0';
				};
				case 3: {
					camusenvg false;
					call compile 'true SetCamUseTi 1';
				};
			};
		} else {
			_vision = BIS_DEBUG_CAM_VISION % 2;
			switch (_vision) do {
				case 0: {
					camusenvg false;
				};
				case 1: {
					camusenvg true;
				};
			};
		};
	};

	if (_key in (actionkeys 'showmap')) then {
		if (BIS_DEBUG_CAM_MAP) then {
			openmap [false,false];
			BIS_DEBUG_CAM_MAP = false;
		} else {
			openmap [true,true];
			BIS_DEBUG_CAM_MAP = true;
			BIS_DEBUG_CAM_MARKER setmarkerposlocal position BIS_DEBUG_CAM;
			BIS_DEBUG_CAM_MARKER setmarkerdirlocal direction BIS_DEBUG_CAM;
			mapanimadd [0,0.1,position BIS_DEBUG_CAM];
			mapanimcommit;
		};
	};

	if (_key == 57) then {
		if (!camInertia) then {
			BIS_DEBUG_CAM camCommand 'INERTIA ON';
			camInertia = true;
		} else {
			BIS_DEBUG_CAM camCommand 'INERTIA OFF';
			camInertia = false;
		};
	};

	if (_key == 41) then {
		BIS_DEBUG_CAM_COLOR ppeffectenable false;
	};
	if (_key >= 2 && _key <= 11) then {
		_id = _key - 2;
		if (_id < count BIS_DEBUG_CAM_PPEFFECTS) then {
			BIS_DEBUG_CAM_COLOR ppEffectAdjust (BIS_DEBUG_CAM_PPEFFECTS select _id);
			BIS_DEBUG_CAM_COLOR ppEffectCommit 0;
			BIS_DEBUG_CAM_COLOR ppeffectenable true;
		};
	};
"];


_mousezchanged = (finddisplay 46) displayaddeventhandler ["mousezchanged","_this call onScrollWheelChange"];

onScrollWheelChange = {
	

	if (EDITOR_MODE) then {
	playersLeftUnits = switchableUnits;
	} else {
	playersLeftUnits = playableUnits;};
	
	//playersLeftCount = ({side _x != civilian} count playersLeftUnits);
	playersLeftCount = ({!(name _x in SPECTATOR_LIST)} count playersLeftUnits);

	// wenn am ende der fahnenstange angekommen, bleib da
	if (playableUnitsSelector > playersLeftCount) then {playableUnitsSelector = playersLeftCount};
	
	//{ if (side _x == civilian) then {playersLeftUnits = playersLeftUnits - [_x]};} forEach playersLeftUnits;
	{ if (name _x in SPECTATOR_LIST) then {playersLeftUnits = playersLeftUnits - [_x]};} forEach playersLeftUnits;
	
    // scroll wheel down
    if ((_this select 1) < 0) then {

		if (playableUnitsSelector > 0) then {playableUnitsSelector = playableUnitsSelector -1;
		} else {
		playableUnitsSelector = 0;
		};

		currentSpecUnit = playersLeftUnits select playableUnitsSelector;
	   
		sideOfTarget = "";
		nameOfTarget = name currentSpecUnit;
		if (side currentSpecUnit == WEST) then {sideOfTarget = '<t color="#008cda">BLUFOR</t>';};
		if (side currentSpecUnit == EAST) then {sideOfTarget = '<t color="#c80000">OPFOR</t>';};
		if (side currentSpecUnit == CIVILIAN) then {sideOfTarget = '<t color="#ffffff">bewusstlos</t>';};
		text1 = format ["%1<br />%2", nameOfTarget, sideOfTarget];
		[text1] call EFUNC(common,displayTextStructured);
		BIS_DEBUG_CAM camcommand 'manual off';
		BIS_DEBUG_CAM camSetTarget currentSpecUnit;
		BIS_DEBUG_CAM camSetRelPos [0,-5,5];
		BIS_DEBUG_CAM camCommit 0;
		BIS_DEBUG_CAM camcommand 'manual on';
  
	};


	// scroll wheel up      
    if ((_this select 1) > 0) then {

	    if (playableUnitsSelector < (playersLeftCount - 1)) then {playableUnitsSelector = playableUnitsSelector +1;
		} else {
		playableUnitsSelector = playersLeftCount - 1;
		};
		
		currentSpecUnit = playersLeftUnits select playableUnitsSelector;
	   
		sideOfTarget = "";
		nameOfTarget = name currentSpecUnit;
		if (side currentSpecUnit == WEST) then {sideOfTarget = '<t color="#008cda">BLUFOR</t>';};
		if (side currentSpecUnit == EAST) then {sideOfTarget = '<t color="#c80000">OPFOR</t>';};
		if (side currentSpecUnit == CIVILIAN) then {sideOfTarget = '<t color="#ffffff">bewusstlos</t>';};
		text2 = format ["%1<br />%2", nameOfTarget, sideOfTarget];
		[text2] call EFUNC(common,displayTextStructured);
		BIS_DEBUG_CAM camcommand 'manual off';
		BIS_DEBUG_CAM camSetTarget currentSpecUnit;
		BIS_DEBUG_CAM camSetRelPos [0,-5,5];
		BIS_DEBUG_CAM camCommit 0;
		BIS_DEBUG_CAM camcommand 'manual on';
	
    };
	
};  

//--- Mouse wheel moving
/*_mousezchanged = (finddisplay 46) displayaddeventhandler ["mousezchanged","
	_n = _this select 1;
	BIS_DEBUG_CAM_FOCUS = BIS_DEBUG_CAM_FOCUS + _n/10;
	if (_n > 0 && BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = 0};
	if (BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = -1};
	BIS_DEBUG_CAM camcommand 'manual off';
	BIS_DEBUG_CAM campreparefocus [BIS_DEBUG_CAM_FOCUS,1];
	BIS_DEBUG_CAM camcommitprepared 0;
	BIS_DEBUG_CAM camcommand 'manual on';
"];*/

_map_mousebuttonclick = ((finddisplay 12) displayctrl 51) ctrladdeventhandler ["mousebuttonclick","
	_button = _this select 1;
	_ctrl = _this select 5;
	if (_button == 0) then {
		_x = _this select 2;
		_y = _this select 3;
		_worldpos = (_this select 0) posscreentoworld [_x,_y];
		if (_ctrl) then {
			_veh = vehicle player;
			_veh setpos [_worldpos select 0,_worldpos select 1,position _veh select 2];
		} else {
			BIS_DEBUG_CAM setpos [_worldpos select 0,_worldpos select 1,position BIS_DEBUG_CAM select 2];
			BIS_DEBUG_CAM_MARKER setmarkerposlocal _worldpos;
		};
	};
"];




//Wait until destroy is forced or camera auto-destroyed.
[_local,_keyDown,_mousezchanged,_map_mousebuttonclick] spawn {
	private ["_local","_keyDown","_mousezchanged","_map_mousebuttonclick","_lastpos"];

	_local = _this select 0;
	_keyDown = _this select 1;
	_mousezchanged = _this select 2;
	_map_mousebuttonclick = _this select 3;

	waituntil {
		if (!isnull BIS_DEBUG_CAM) then {_lastpos = position BIS_DEBUG_CAM};
		isNull BIS_DEBUG_CAM || WINCONDITIONOPFOR || WINCONDITIONBLUFOR || BLUFOR_CAPTURED || BLUFOR_SURRENDERED
	};

	player cameraEffect ["TERMINATE", "BACK"];
	player switchCamera "internal";
	deletemarkerlocal BIS_DEBUG_CAM_MARKER;
	BIS_DEBUG_CAM = nil;
	BIS_DEBUG_CAM_MAP = nil;
	BIS_DEBUG_CAM_MARKER = nil;
	BIS_DEBUG_CAM_VISION = nil;
	camDestroy _local;
	BIS_DEBUG_CAM_LASTPOS = _lastpos;

	ppeffectdestroy BIS_DEBUG_CAM_COLOR;
	(finddisplay 46) displayremoveeventhandler ["keydown",_keyDown];
	(finddisplay 46) displayremoveeventhandler ["mousezchanged",_mousezchanged];
	((finddisplay 12) displayctrl 51) ctrlremoveeventhandler ["mousebuttonclick",_map_mousebuttonclick];

};
