// put away weapon
[player] call ace_weaponselect_fnc_putWeaponAway;
sleep 1.1;
radioSuitcaseCarry = "Land_Suitcase_F" createvehicle getpos player;
radioSuitcaseCarry attachTo [player, [-0.03,-.1,-0.26], "RightHandMiddle1"];
radioSuitcaseCarry setVectorDirAndUp [[1,0,0],[0,0,1]];
radioSuitcaseCarry setVariable ["ace_cargo_size", 1];
radioSuitcaseCarry setVariable ["ace_cargo_canLoad", 1];
player setVariable ["radioAttached",true];
publicVariable "radioSuitcaseCarry";

// checks
while {true} do {
	if (vehicle player != player) exitWith {
		[radioSuitcaseCarry, vehicle player] call ace_cargo_fnc_loadItem;
		player setVariable ["radioAttached",false];
	};
	if (!alive player) exitWith {}; // if player is dead
	if (currentWeapon player != "") exitWith {}; // if player switches to weapon
	if (!(player getVariable ["radioAttached",false])) exitWith {}; // if player lost the radio in another way (put it back)
	sleep 0.5;
};

if (player getVariable ["radioAttached",false]) then {
	radioSuitcaseDropped = createVehicle ['Land_SatellitePhone_F', [getPos player select 0, (getPos player select 1) - 0.5,0], [], 0, 'CAN_COLLIDE'];
	radioSuitcaseDropped setVariable ["ace_cargo_size", 1];
	radioSuitcaseDropped setVariable ["ace_cargo_canLoad", 1];
	publicVariable "radioSuitcaseDropped";
};

player setVariable ["radioAttached",false];
deleteVehicle radioSuitcaseCarry;