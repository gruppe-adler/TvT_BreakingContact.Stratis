if (!isServer) exitWith {};

private _pumps = nearestObjects [
    [(worldSize/2), (worldSize/2), 0],
    [
        "Land_fs_feed_F",                           // Gas Station Pump (Altis)
        "Land_FuelStation_01_pump_F",               // Tanoa
        "Land_FuelStation_02_pump_F",
		"Land_FuelStation_Feed_F",	                // Stratis/Esseker
        "Land_A_FuelStation_Shed",	                // Esseker/Chernarus
	    "Land_A_FuelStation_Feed"	                // Chernarus
    ],
    worldSize,
    true
];

{
    _x setFuelCargo 0; // necessary?
    [_x, 0] call ace_refuel_fnc_setFuel;
}forEach _pumps;