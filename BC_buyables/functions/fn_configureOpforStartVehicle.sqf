params ["_vehicle"];

_vehicle setVariable ["detachableRadio", 0, true];

_vehicle setVariable ["GRAD_replay_track", true, true];

_vehicle addMPEventHandler ["MPKilled", {
  params ["_unit", "_killer", "_instigator", "_useEffects"];

  _unit setVariable ["BC_lastDamageSource_causedBy", _killer, true];
  _unit setVariable ["ace_medical_lastDamageSource", _killer, true];

}];

[_vehicle, true] call BC_flagsOnVehicles_fnc_toggleFlag;


_terminal = createVehicle ['Land_DataTerminal_01_F', [0,0,0], [], 0, 'NONE'];
_terminal setVariable ["GRAD_replay_track", true, true];

hideObjectGlobal _terminal;

missionNameSpace setVariable ["GRAD_tracking_radioVehObj", _vehicle, true];
missionNameSpace setVariable ["GRAD_tracking_terminalObj", _terminal, true];

[[_vehicle, _terminal], "grad_tracking\init.sqf"] remoteExec ["execVM", 0, true];

_vehicle addItemCargoGlobal ["ACE_SpraypaintBlack",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintBlue",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintGreen",10];
_vehicle addItemCargoGlobal ["ACE_SpraypaintRed",10];
_vehicle addItemCargoGlobal ["ACE_EntrenchingTool",10];
_vehicle addItemCargoGlobal ["TFAR_pnr1000a",10];