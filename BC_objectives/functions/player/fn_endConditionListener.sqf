#include "\z\ace\addons\main\script_component.hpp"
#include "..\..\..\missionMacros.h"


["serverDecisionEnd",
{
     params ["_winner", "_result"];

     private _transmissionPercentage = call GRAD_tracking_fnc_getTransmissionPercentage;
     missionNamespace setVariable ["BC_transmissionPercentage", str _transmissionPercentage];

     missionNamespace setVariable ["BC_missionResult", _result];
     missionNamespace setVariable ["BC_missionWinner", _winner];

     [_winner, _result] spawn BC_objectives_fnc_endMission;

}] call CBA_fnc_addEventHandler;
