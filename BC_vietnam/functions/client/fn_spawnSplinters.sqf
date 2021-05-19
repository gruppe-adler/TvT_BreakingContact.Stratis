params ["_object"];

private _source = "#particlesource" createVehicleLocal [position _object];
_source setParticleClass "ImpactDustWood";
_source attachTo [_object, [0,0,0]];

[{
    params ["_source"];

    deleteVehicle _source;
}, [_source], 1] call CBA_fnc_waitAndExecute;