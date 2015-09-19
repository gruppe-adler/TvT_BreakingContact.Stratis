_unit = _this select 0;

if (!firstspawn) exitWith {firstspawn = true;};

if (!local _unit) exitWith {};

if (WINCONDITIONOPFOR || WINCONDITIONBLUFOR || BLUFOR_CAPTURED || BLUFOR_SURRENDERED) exitWith {
	cutText ["","BLACK OUT"];
	if (!isNil "BIS_DEBUG_CAM") exitwith {BIS_DEBUG_CAM = nil;};

	
	_pos = getPos whiteboard;
	[player,_pos] execVM "mission_setup\teleportUnitToEmptySpot.sqf";

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
	
	if (!did_replay) then {
	hintsilent "Replay loading.";
	sleep 0.2;
	hintsilent "Replay loading..";
	sleep 0.2;
	hintsilent "Replay loading...";
	sleep 0.2;
	hintsilent "Replay loading....";
	sleep 0.2;
	hintsilent "Replay loading.....";
	sleep 0.2;
	hintsilent "Replay loaded.";
	
	//["after_action_reporter_pimped\reveal.sqf","BIS_fnc_execVM",true,true ] call BIS_fnc_MP;
	//[] execVM "after_action_reporter_pimped\reveal_player.sqf";
	};
};

[player, true] call TFAR_fnc_forceSpectator;

SPECTATOR_LIST = SPECTATOR_LIST + [name player];
publicVariable "SPECTATOR_LIST";

removeAllWeapons player:
removeAllActions player;
// join civilian side, because end trigger relies on side
[_unit] joinSilent (createGroup civilian);
// set position above objective


_unit addAction["<t color='#d18d1f'>" + localize "str_GRAD_action_beginspectator1" + "</t>" + localize "str_GRAD_action_beginspectator2",{['forced'] spawn CSSA3_fnc_createSpectateDialog;}, _Args, 1, false, false, "","_this == _target || _this in _target"];

sleep 0.1;
_unit moveInCargo spectator_vehicle;
// start spec cam
["forced"] spawn CSSA3_fnc_createSpectateDialog;
