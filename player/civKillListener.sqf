#include "..\missionMacros.h"



_CIV_KILLED_listener = {
     0 = [CIV_KILLED] execVM "player\civKilledMarker.sqf";
};

"CIV_KILLED" addPublicVariableEventHandler _CIV_KILLED_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
     _CIV_KILLED_listener spawn {
          waitUntil {CIV_KILLED select 0 select 0 != 0};
          [0, CIV_KILLED] call _this;
     };
};
