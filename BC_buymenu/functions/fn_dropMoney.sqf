/*
    client only
*/

params ["_unit"];

private _position = _unit getPos [0.5, getDir _unit];

private _source = "#particlesource" createVehicleLocal [0, 0, 0];   
_source setPos _position;   
_source setParticleCircle [0, [0, 0, 0]];   
_source setParticleRandom [0, [0.1, 0.1, 0], [0.6, 0.6, 3], 0, 0.25, [0, 0, 0, 0.1], 0, 0];   
_source setParticleParams [ 
    ["\A3\Structures_F\Items\Valuables\Money_F.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120,  
    [0, 0, 0.5], [0, 0, 3], 0.5, 200, 0.2, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]],  
    [0.08], 1, 0, "", "", _this,0,true,0.1 
];   
_source setDropInterval 0.001;  
 
[{  
    params ["_source"];  
    deleteVehicle _source;  
}, [_source] ,0.1] call CBA_fnc_waitAndExecute;

_unit say3D ["cashRegister", 30];