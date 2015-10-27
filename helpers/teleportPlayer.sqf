
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

_spawn = _location findEmptyPosition[1, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _location];
playSound "beam";
cutText ["", "BLACK OUT", 0.1];
sleep 1.2;
_tempBike = "C_Quadbike_01_black_F" createVehicleLocal [_spawn select 0, _spawn select 1, 500];
player moveInCargo _tempBike;
sleep 0.1;
moveOut player;
_nul = player setPos _spawn;
deleteVehicle _tempBike;

openMap [false, false];
hintSilent "";
cutText ["", "BLACK IN", 1];

// make player vulnerable again
player allowDamage true;
[] execVM "helpers\enforceNoSwim.sqf";
3 call fn_sthud_usermenu_changeMode;