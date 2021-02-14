params ["_unit", ["_previousUnit", objNull]];

if (!isnull _previousUnit) then {
    _previousUnit setVariable ["BC_hasAntenna", false, true];
};

_unit setVariable ["BC_hasAntenna", true, true];

private _antenna = missionNameSpace getVariable ['GRAD_tracking_antennaObj', objNull]; // "Item_muzzle_antenna_02_f" createVehicle [0,0,0];
_antenna attachTo [_unit, [0,.3,0], "head"];

[{
    params ["_antenna"];
    _antenna setVectorDirAndUp [[1,0,0], [0,1,0]];
}, [_antenna], 1] call CBA_fnc_waitAndExecute;


_antenna setVariable ["antennaStatus",1, true];

_antenna hideObjectGlobal false;