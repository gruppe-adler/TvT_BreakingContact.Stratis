#include "\z\ace\addons\main\script_component.hpp"


_BLUFOR_TELEPORT_TARGET_listener = {
	//[localize "str_GRAD_hint_bluforSpawned"] call EFUNC(common,displayTextStructured);
	
};

"BLUFOR_TELEPORT_TARGET" addPublicVariableEventHandler _BLUFOR_TELEPORT_TARGET_listener;


// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_BLUFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {BLUFOR_TELEPORT_TARGET select 0 != 0};
		[0, BLUFOR_TELEPORT_TARGET] call _this;
	};
};
