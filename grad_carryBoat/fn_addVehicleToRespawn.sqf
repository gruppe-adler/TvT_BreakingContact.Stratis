params ["_vehicle", "_minTime", "_count"];

private _pos = getPos _vehicle;
private _dir = getDir _vehicle;
private _initialTime = CBA_missionTime;

GRAD_vehicleRespawnVehicles append [_vehicle, _pos, _dir, _initialTime, _minTime, _count];
