#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

_BLUFOR_SURRENDERED_listener = {
	if (_this select 1) then {
		adminLog("blufor surrendered");
		_string = localize "str_GRAD_winmsg_points";
		[_string] call EFUNC(common,displayTextStructured);
		[east] execVM "player\endmission.sqf";
	};
};

_BLUFOR_CAPTURED_listener = {
	if (_this select 1) then {
		adminLog("blufor captured");
		[west] execVM "player\endmission.sqf";
	};
};

_BLUFOR_ELIMINATED_listener = {
	if (_this select 1) then {
		adminLog("mission_complete: blufor loses  by elimination");
		[east] execVM "player\endmission.sqf";
	};
};

_OPFOR_ELIMINATED_listener = {
	if (_this select 1) then {
		adminLog("mission_complete: opfor loses  by elimination");
		[west] execVM "player\endmission.sqf";
	};
};

_TRUCK_DESTROYED_NOT_CONQUERED_listener = {
	if (_this select 1) then {
		adminLog("mission_complete: draw");
		[civilian] execVM "player\endmission.sqf";
	};
};

"BLUFOR_SURRENDERED" addPublicVariableEventHandler _BLUFOR_SURRENDERED_listener;
"BLUFOR_CAPTURED" addPublicVariableEventHandler _BLUFOR_CAPTURED_listener;
"BLUFOR_ELIMINATED" addPublicVariableEventHandler _BLUFOR_ELIMINATED_listener;
"OPFOR_ELIMINATED" addPublicVariableEventHandler _OPFOR_ELIMINATED_listener;

"TRUCK_DESTROYED_NOT_CONQUERED" addPublicVariableEventHandler _TRUCK_DESTROYED_NOT_CONQUERED_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_BLUFOR_SURRENDERED_listener spawn {
		waitUntil {BLUFOR_SURRENDERED};
		[0, BLUFOR_SURRENDERED] call _this;
	};
	_BLUFOR_CAPTURED_listener spawn {
		waitUntil {BLUFOR_CAPTURED};
		[0, BLUFOR_CAPTURED] call _this;
	};
	_BLUFOR_ELIMINATED_listener spawn {
		waitUntil {BLUFOR_ELIMINATED};
		[0, BLUFOR_ELIMINATED] call _this;
	};
	_OPFOR_ELIMINATED_listener spawn {
		waitUntil {OPFOR_ELIMINATED};
		[0, OPFOR_ELIMINATED] call _this;
	};

	_TRUCK_DESTROYED_NOT_CONQUERED_listener spawn {
		waitUntil {TRUCK_DESTROYED_NOT_CONQUERED};
		[0, TRUCK_DESTROYED_NOT_CONQUERED] call _this;
	};
};

