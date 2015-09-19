private ['_islands', '_targetPositions', '_positionsForCurrentWorld', '_targetPosition'];

// Please insert new islands alphabetically by file name extension!

// Readable List: 
// Altis,
// Bornholm,
// Chernarus
// Chernarus Summer,
// Clafghan,
// Desert,
// Esseker,
// Fatah,
// Gorgona
// Podagorsk,
// Capraia,
// Kunduz
// N'Ziwasogo  
// Sarahni, 
// Sarugao, 
// Shapur, 
// Stratis, 
// Takistan, 
// Thirsk, 
// Panthera, 
// Bystrica, 
// vt5
// X-Cam Prototype
// Zargabad


islands = [
	'Altis',
	'Bornholm',
	'Chernarus',
	'Chernarus_Summer',
	'clafghan',
	'Desert_E',
	'Esseker',
	'fata',
	'Gorgona',
	'FDF_Isle1_a',
	'IsolaDiCapraia',
	'Kunduz',
	'pja305',
	'Sara',
	'Sara_dbe1',
	'saru',
	'Shapur_BAF',
	'Stratis',
	'takistan',
	'Thirsk',
	'Panthera3',
	'vt5',
	'Woodland_ACR',
	'xcam_prototype',
	'Zargabad'
];
// pos blufor, pos opfor, water around map?, name
targetPositions = [
	[ [14300,16200], [14600, 16700], true, 'Altis'],
	[ [3000, 5400], [3900, 4900], true, 'Bornholm' ], 
	[ [4100,11000], [4860, 9740], true, 'Chernarus'],
	[ [4100,11000], [4860, 9740], true, 'Chernarus_Summer'],
	[ [15550,920], [15850, 370], false, 'clafghan'],
	[ [1500, 50], [1900, 50], false, 'Desert_E'],
	[ [1500, 50], [1900, 50], false, 'Esseker'],
	[ [7700, 1600], [8400, 2000], false, 'fata'],
	[ [1300, 3100], [950, 1170], true, 'Gorgona'],
	[ [7777, 4280], [9200, 4280], true, 'FDF_Isle1_a'],
	[ [1240, 9450], [1240, 8450], true, 'IsolaDiCapraia'],
	[ [-500, -500], [-500, -900], false, 'Kunduz'],
	[ [12870, 780], [13830, 780], true, 'pja305'],
	[ [18080, 18535], [18200, 18060], true, 'Sara'],
	[ [18080, 18535], [18200, 18060], true, 'Sara_dbe1'],
	[ [9800, 4700], [9800, 3800], true, 'saru'],
	[ [160, 640], [800, 135], true, 'Shapur_BAF'],
	[ [1540, 5015], [1800, 6000], true, 'Stratis'],
	[ [7700, 1600], [8250, 2130], false, 'takistan'],
	[ [1100, 3200], [1700, 3000], true, 'Thirsk'],
	[ [4080, 7580], [4860, 7600], true, 'Panthera3'],
	[ [-850, 700], [-630, 300], false, 'vt5'],
	[ [7500, 7600], [7500, 7300], false, 'Woodland_ACR'],
	[ [4000, 4150], [4450, 3830], true, 'xcam_prototype'],
	[ [3400, 4320], [3400, 3600], false, 'Zargabad']
];

// spawn outside of map on flat terrain if possible
alternativeSpawnsOutsideMap = [[-500,-500],[-500,-900]];


if !(isDedicated) then {
	waitUntil {player == player}; 
	playerPositionsForCurrentWorld = targetPositions select (islands find worldName);
	if !(playerPositionsForCurrentWorld select 2) then {
	playerPositionsForCurrentWorld = alternativeSpawnsOutsideMap;
	};

	if (side player == blufor) then {
		playerPosition = playerPositionsForCurrentWorld select 0;
	} else {
		playerPosition = playerPositionsForCurrentWorld select 1;
	};
	//hintSilent format["%1",playerPosition];
	[player,playerPosition] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
};

if ((isDedicated) || (isServer)) then {
	vehiclePositionsForCurrentWorld = targetPositions select (islands find worldName);
	if !(vehiclePositionsForCurrentWorld select 2) then { 
	vehiclePosition_blufor = alternativeSpawnsOutsideMap select 0;
	vehiclePosition_opfor = alternativeSpawnsOutsideMap select 1;
	weaponCachePosition_opfor = alternativeSpawnsOutsideMap select 1;
	} else {
	vehiclePosition_blufor = vehiclePositionsForCurrentWorld select 0;
	vehiclePosition_opfor = vehiclePositionsForCurrentWorld select 1;
	weaponCachePosition_opfor = vehiclePositionsForCurrentWorld select 1;
	};
	sleep 0.1;
	//hintSilent format["%1",vehiclePosition];
	[whiteboard,vehiclePosition_opfor] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
	sleep 0.1;
	[spectator_vehicle,vehiclePosition_opfor] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
	sleep 0.1;
	[arsenal_blufor,vehiclePosition_blufor] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
	sleep 0.1;
	[arsenal_opfor,weaponCachePosition_opfor] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
	
};
