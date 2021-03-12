#include "..\..\..\missionMacros.h"

params ["_winner", "_result"];

uiSleep 3;

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
          ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_draw" + "</t><br /><t size='.5'>" + format [localize "str_GRAD_transmissionResult", _transmissionPercentage + "%",round (CBA_missionTime/60)] + "<br />" + localize "str_GRAD_thankyouforplaying2" + "</t>",0,0,5,1] spawn BIS_fnc_dynamicText;
          diag_log format ["winner draw"];
     };
     default {
          diag_log format ["error, no winner %1", _winner];
     };
};


[player, true] call TFAR_fnc_forceSpectator;

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
