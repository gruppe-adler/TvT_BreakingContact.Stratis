_spawn = _this select 0;
_tempBike = "C_Quadbike_01_black_F" createVehicleLocal [_spawn select 0, _spawn select 1, 500];
player moveInCargo _tempBike;
sleep 0.1;
moveOut player;
deleteVehicle _tempBike;
player setPos _spawn;