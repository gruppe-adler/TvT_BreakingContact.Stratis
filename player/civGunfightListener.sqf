#include "..\missionMacros.h"

player setVariable ["GunfightTimeout",false];

_CIV_GUNFIGHT_POS_listener = {
	0 = [CIV_GUNFIGHT_POS] execVM "player\civGunfightMarker.sqf";
};

"CIV_GUNFIGHT_POS" addPublicVariableEventHandler _CIV_GUNFIGHT_POS_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_CIV_GUNFIGHT_POS_listener spawn {
		waitUntil {CIV_GUNFIGHT_POS select 0 != 0};
		[0, CIV_GUNFIGHT_POS] call _this;
	};
};
