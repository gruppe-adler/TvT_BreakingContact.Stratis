params ["_vehicle"];

[_vehicle,	nil, ["hide_middleTop",1]] call BIS_fnc_initVehicle;
[_vehicle] call BC_setup_fnc_clearInventory;
_vehicle addItemCargoGlobal ["ACE_SpraypaintBlack",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintBlue",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintGreen",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintRed",10];
_vehicle addItemCargoGlobal ["ACE_EntrenchingTool",10];
_vehicle addItemCargoGlobal ["tf_anprc148jem", 10];

_vehicle addItemCargoGlobal ["ACE_NVG_Gen2",50];


_vehicle addItemCargoGlobal ["ItemGPS",1];
_vehicle setVariable ["detachableBoat",2];
_vehicle setVariable ["GRAD_replay_track", true];
