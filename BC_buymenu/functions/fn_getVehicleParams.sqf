params ["_faction", "_classname"];

private _vehicle = ("configName _x == 'StartVehicle'" configClasses _faction) select 0;

private _canMoveDuringTransmission = [(_vehicle >> "canMoveDuringTransmission"), "text", "false"] call CBA_fnc_getConfigEntry isEqualTo "true";
private _terminal_position_offset = call compile ([(_selectedConfig >> "terminalPositionOffset"), "text", ""] call CBA_fnc_getConfigEntry);
private _terminal_position_vectorDirAndUp = call compile ([(_selectedConfig >> "terminalVectorDirAndUp"), "text", ""] call CBA_fnc_getConfigEntry);
private _antennaOffset = call compile ([(_selectedConfig >> "antennaOffset"), "text", ""] call CBA_fnc_getConfigEntry);