private _position = _this;

private _duration = 0.01 + random 0.1;
private _amount = 0.001 + random 0.01;
private _spark = "#particlesource" createVehicleLocal _position;
private _lifetime = 1+(random 0.5);


_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [1, [0.15, 0.15, 0.3], [0.4, 0.4, -0.3], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_spark setParticleParams [
	["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject",
	1, _lifetime, [0, 0, 0], [0, 0, 2], 0, 20, 7.9, 0, 
	[0.3,0.3,0.05], [[1, 1, 1, 1], [1, 0.5, 0.5, 1], [0.5, 0, 0, 0]], [0.08], 1, 0, "", "", _spark,0,true,0.2,[[1,0.25,0.25,1]]
];
_spark setDropInterval _amount; 

[{
	deleteVehicle _this;
}, _spark, _duration] call CBA_fnc_waitAndExecute;
