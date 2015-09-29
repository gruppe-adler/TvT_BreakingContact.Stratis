/* cutText ["", "BLACK FADED"]; */

_BLUFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	if (_pos select 1 != 0) then {
		titleText ["", "PLAIN"];
		titleFadeOut 1;
		sleep 2;
		cutText ["", "BLACK IN"];

		["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Breaking Contact</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
	};
};

"BLUFOR_TELEPORT_TARGET" addPublicVariableEventHandler _BLUFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_BLUFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {BLUFOR_TELEPORT_TARGET select 0 != 0};
		[0, BLUFOR_TELEPORT_TARGET] call _this;
	};
};
