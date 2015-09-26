#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

_BLUFOR_SURRENDERED_listener = {
	adminLog("blufor surrendered");
	_string = localize "str_GRAD_winmsg_points";
	[_string] call EFUNC(common,displayTextStructured);
	[east] execVM "objectives\endmission.sqf";
};

_BLUFOR_CAPTURED_listener = {
	adminLog("blufor captured");
	execVM "objectives\endmission.sqf";

	[west] execVM "objectives\endmission.sqf";
};

_MISSION_COMPLETED_listener = {
	adminLog("mission_complete");
	execVM "objectives\endmission.sqf";

	if (WINCONDITIONBLUFOR) then {
		[west] execVM "objectives\endmission.sqf";
	};
	if (WINCONDITIONOPFOR) then {
		[east] execVM "objectives\endmission.sqf";
	};
};

"BLUFOR_SURRENDERED" addPublicVariableEventHandler _BLUFOR_SURRENDERED_listener;
"BLUFOR_CAPTURED" addPublicVariableEventHandler _BLUFOR_CAPTURED_listener;
"MISSION_COMPLETED" addPublicVariableEventHandler _MISSION_COMPLETED_listener;

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
};

