params ["_vehicle", "_removeMagazines"];
if !(local _vehicle) exitWith {
	_this remoteExec [_fnc_scriptName, owner _vehicle, false];
};

{
	_vehicle removeMagazine _x;
} forEach _removeMagazines;