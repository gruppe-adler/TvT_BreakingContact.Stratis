#include "..\..\..\missionMacros.h"

params ["_winner", "_result"];

missionNamespace setVariable ["BC_missionWinner", _winner];
missionNamespace setVariable ["BC_missionResult", _result];

uiSleep 3;


private _radioVeh = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
private _killer = _radioVeh getVariable ["ace_medical_lastDamageSource", objNull];

private _killerSide = civilian;

if (!(isNull _killer)) then {
     _killerSide = side _killer;
};

if (_killerSide isEqualTo civilian) then {
     private _BCkiller = _radioVeh getVariable ["BC_lastDamageSource_causedBy", objNull];
     if (!(isNull _BCkiller)) then {
          _killerSide = side _BCkiller;
     };
};

diag_log format ["killerside of truck is %1", _killerSide];

private _transmissionPercentage = missionNamespace getVariable ["BC_transmissionPercentage", "0"];

switch (_winner) do {
     case "west" : {
          ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
          diag_log format ["winner west"];
     };
     case "east" : {
          ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
          diag_log format ["winner east"];
     };
     case "draw" : {
          if (playerSide isEqualTo _killerSide && playerSide isEqualTo west) then {
               ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
               diag_log format ["draw, winner east, playerside killed the truck"];
          } else {
               if (playerSide isEqualTo _killerSide && playerSide isEqualTo east) then {
                    ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
                    diag_log format ["draw, winner west, playerside killed the truck"];
               } else {
                    // killerside is always not playerside here, so we are not the bad guys
                    if (playerSide isEqualTo west) then {
                         ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
                         diag_log format ["draw, winner west"];
                    } else {
                         ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
                         diag_log format ["draw, winner east"];
                    };
               };
          };
     };
     default {
          diag_log format ["error, no winner %1", _winner];
     };
};

#ifndef GRAD_FACTIONS_USE_ACRE
[player, true] call TFAR_fnc_forceSpectator;
#endif

["GRAD_replay_preparingPlayback",
{
    MISSION_COMPLETED = true;
    publicVariable "MISSION_COMPLETED";
}] call CBA_fnc_addEventHandler;

["GRAD_replay_finished",
{
	private _result = missionNamespace getVariable ["BC_missionResult", "elimination"];
	private _winner = missionNamespace getVariable ["BC_missionWinner", "draw"];

	// TODO this is most ugly but necessary for debug currently
	switch (_result) do {
		case "elimination": {
			if (_winner == "east") then {
				"OpforWinsByElimination" call BIS_fnc_endMission;
			};
			if (_winner == "west") then {
				"BluforWinsByElimination" call BIS_fnc_endMission;
			};
			if (_winner != "east" && _winner != "west") then {
				"DrawError" call BIS_fnc_endMission;
			};
		};

		case "transmission": {
			"OpforWinsByTransmission" call BIS_fnc_endMission;
		};

		case "destroyed": {
			if (_winner == "east") then {
				"OpforWinsByBluforDestroyingTheTruck" call BIS_fnc_endMission;
			};
			if (_winner == "west") then {
				"BluforWinsByOpforDestroyingTheTruck" call BIS_fnc_endMission;
			};
			if (_winner != "east" && _winner != "west") then {
				"DrawRadioTruckDestroyed" call BIS_fnc_endMission;
			};
		};

		case "captured": {
			if (CONQUER_MODE) then {
				"BluforWinsByConquering" call BIS_fnc_endMission;
			} else {
				"BluforWinsByDestruction" call BIS_fnc_endMission;
			};
		};

		default { "DrawError" call BIS_fnc_endMission; };

		diag_log format ["side player is %1, _winner is %2", side player, _winner];
	};

}] call CBA_fnc_addEventHandler;
