_idc = ctrlIDC  (_this select 0);

_tempRussian_1 = (russianSupplies select 1);
_tempRussian_2 = (russianSupplies select 2);
_tempRussian_3 = (russianSupplies select 3);
_tempRussian_4 = (russianSupplies select 4);
_tempRussian_5 = (russianSupplies select 5);

_oldMoney = (russianSupplies select 0);
_price = [_idc] call russian_IDC_to_price;

_newMoney = _oldMoney - _price;

// if (DEBUG) then { diag_log format ["_newMoney: %1, _price: %2",_newMoney,_price]; };


// dont fucking buy without money dude -> exit with hint
if (_newMoney < 0) exitWith { 
    [russianSupplies,true,0,"","",""] call refreshRussianUI;
};

_selector = [_idc] call russian_IDC_to_selector;

//if (DEBUG) then { diag_log format ["_idc: %1",_idc]; };

switch (_selector) do {
    
    case 1: { _tempRussian_1 = [_idc,_tempRussian_1] call calculateRussianVehicleCall; };
    case 2: { _tempRussian_2 = [_idc,_tempRussian_2] call calculateRussianVehicleCall; };
    case 3: { _tempRussian_3 = [_idc,_tempRussian_3] call calculateRussianVehicleCall; };
    case 4: { _tempRussian_4 = [_idc,_tempRussian_4] call calculateRussianVehicleCall; };
    case 4: { _tempRussian_5 = [_idc,_tempRussian_5] call calculateRussianVehicleCall; };

    default {};
};

// dont fucking buy without stock dude -> exit with hint
if (count _tempRussian_1 == 1 || count _tempRussian_2 == 1 || count _tempRussian_3 == 1 || count _tempRussian_4 == 1 || count _tempRussian_5 == 1) exitWith { 
    [russianSupplies,false,_idc,"","",""] call refreshRussianUI;
    player say3D "rhs_rus_land_rc_01";
};


// SUCCESS - VEHICLE WILL BE ORDERED!

_vehicleOrdered = [_idc] call russian_IDC_to_classname;
_vehicleExtras = [_idc] call russian_IDC_to_extras;
_vehicleCalls = [_idc] call russian_IDC_to_calls;
_vehicleEta = [_idc] call russian_IDC_to_eta;

if (DEBUG) then { diag_log format ["_vehicleOrdered: %1, _vehicleExtras: %2, _vehicleCalls: %3",_vehicleOrdered, _vehicleExtras,_vehicleCalls]; };

_randomSound = [
    "rhs_rus_land_rc_02",
    "rhs_rus_land_rc_03",
    "rhs_rus_land_rc_04",
    "rhs_rus_land_rc_05",
    "rhs_rus_land_rc_06",
    "rhs_rus_land_rc_07",
    "rhs_rus_land_rc_08",
    "rhs_rus_land_rc_09",
    "rhs_rus_land_rc_10",
    "rhs_rus_land_rc_11",
    "rhs_rus_land_rc_12",
    "rhs_rus_land_rc_13",
    "rhs_rus_land_rc_14",
    "rhs_rus_land_rc_15",
    "rhs_rus_land_rc_16",
    "rhs_rus_land_rc_17",
    "rhs_rus_land_rc_18",
    "rhs_rus_land_rc_19",
    "rhs_rus_land_rc_20",
    "rhs_rus_land_rc_21",
    "rhs_rus_land_rc_22",
    "rhs_rus_land_rc_23",
    "rhs_rus_land_rc_24",
    "rhs_rus_land_rc_25"
] call BIS_fnc_selectRandom;

player say3D _randomSound;

_tempSupplies = 
    [
        _newMoney,
        _tempRussian_1,
        _tempRussian_2,
        _tempRussian_3,
        _tempRussian_4,
        _tempRussian_5
    ];

[_tempSupplies,false,0,_vehicleOrdered,_vehicleExtras,_vehicleCalls,_vehicleEta] call refreshRussianUI;

//if (DEBUG) then { diag_log format ["russianSupplies refreshed: %1",russianSupplies]; };
