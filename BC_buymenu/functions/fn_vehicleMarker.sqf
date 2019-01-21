/*  Displays 3D marker on bought vehicle.
*
*/

params ["_vehicle", "_baseConfigName", "_categoryConfigName", "_itemConfigName"];

if (!hasInterface) exitWith {};

private _displayName = getText (configFile >>  "CfgVehicles" >> _itemConfigName >> "displayName");

_function = {
    params ["_args", "_handle"];
    _args params ["_vehicle", "_displayName"];

    if (isNull _vehicle) exitWith {};
    drawIcon3D [getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "icon"), [1,1,1,1], (getPosATL _vehicle) vectorAdd [0,0,1], 1, 1, 0, format ["%1 (%2m)", _displayName, round (player distance _vehicle)], 1, 0.04, "PuristaMedium", "center", true];
};
_handle = [_function, 0, [_vehicle, _displayName]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_handle"];
    [_handle] call CBA_fnc_removePerFrameHandler;
}, _handle, 120] call CBA_fnc_waitAndExecute;