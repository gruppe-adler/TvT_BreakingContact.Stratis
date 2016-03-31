#include "..\missionMacros.h"


_RADIO_BOX_DISTANCE_listener = {
	0 = [RADIO_BOX_DISTANCE] execVM "player\radioBoxDistanceHint.sqf";
};

"RADIO_BOX_DISTANCE" addPublicVariableEventHandler _RADIO_BOX_DISTANCE_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_RADIO_BOX_DISTANCE_listener spawn {
		waitUntil {RADIO_BOX_DISTANCE select 0 != 0};
		[0, RADIO_BOX_DISTANCE] call _this;
	};
};
