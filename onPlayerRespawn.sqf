_unit = _this select 0;

if (!firstspawn) exitWith {firstspawn = true;};

if (!local _unit) exitWith {};

if (WINCONDITIONOPFOR || WINCONDITIONBLUFOR || BLUFOR_CAPTURED || BLUFOR_SURRENDERED) exitWith {
	cutText ["","BLACK OUT"];
	[player, true] call TFAR_fnc_forceSpectator;

	removeAllWeapons player;
	[_unit] joinSilent (createGroup civilian);
	cutText ["","BLACK IN"];

	if (WINCONDITIONOPFOR || BLUFOR_SURRENDERED) then {
	 	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
	      sleep 3;
	};

	if (WINCONDITIONBLUFOR || BLUFOR_CAPTURED) then {
	 	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
	      sleep 3;
	};
	
	};
};

[player, true] call TFAR_fnc_forceSpectator;

SPECTATOR_LIST = SPECTATOR_LIST + [name player];
publicVariable "SPECTATOR_LIST";

// join civilian side, because end trigger relies on side
[_unit] joinSilent (createGroup civilian);