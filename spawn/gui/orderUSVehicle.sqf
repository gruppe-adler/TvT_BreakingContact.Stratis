_idc = ctrlIDC  (_this select 0);

_tempUS_1 = (USSupplies select 1);
_tempUS_2 = (USSupplies select 2);
_tempUS_3 = (USSupplies select 3);
_tempUS_4 = (USSupplies select 4);
_tempUS_5 = (USSupplies select 5);
_tempUS_6 = (USSupplies select 6);
_tempUS_7 = (USSupplies select 7);
_tempUS_8 = (USSupplies select 8);

_oldMoney = (USSupplies select 0);
_price = [_idc] call US_IDC_to_price;

_newMoney = _oldMoney - _price;

// if (DEBUG) then { diag_log format ["_newMoney: %1, _price: %2",_newMoney,_price]; };


// dont fucking buy without money dude -> exit with hint
if (_newMoney < 0) exitWith { 
    [USSupplies,true,0,"","",""] call refreshUSUI;
};

_selector = [_idc] call US_IDC_to_selector;

//if (DEBUG) then { diag_log format ["_idc: %1",_idc]; };

switch (_selector) do {
    
    case 1: { _tempUS_1 = [_idc,_tempUS_1] call calculateUSVehicleCall; };
    case 2: { _tempUS_2 = [_idc,_tempUS_2] call calculateUSVehicleCall; };
    case 3: { _tempUS_3 = [_idc,_tempUS_3] call calculateUSVehicleCall; };
    case 4: { _tempUS_4 = [_idc,_tempUS_4] call calculateUSVehicleCall; };
    case 5: { _tempUS_5 = [_idc,_tempUS_5] call calculateUSVehicleCall; };
    case 6: { _tempUS_6 = [_idc,_tempUS_6] call calculateUSVehicleCall; };
    case 7: { _tempUS_7 = [_idc,_tempUS_7] call calculateUSVehicleCall; };

    default {};
};

// dont fucking buy without stock dude -> exit with hint
if (count _tempUS_1 == 1 || count _tempUS_2 == 1 || count _tempUS_3 == 1 || count _tempUS_4 == 1 || count _tempUS_5 == 1 || count _tempUS_6 == 1 || count _tempUS_7 == 1) exitWith { 
    [USSupplies,false,_idc,"","",""] call refreshUSUI;
    player say3D "rhs_usa_land_rc_1";
};


// SUCCESS - VEHICLE WILL BE ORDERED!

_vehicleOrdered = [_idc] call US_IDC_to_classname;
_vehicleExtras = [_idc] call US_IDC_to_extras;
_vehicleCalls = [_idc] call US_IDC_to_calls;
_vehicleEta = [_idc] call US_IDC_to_eta;

//if (DEBUG) then { diag_log format ["_vehicleOrdered: %1, _vehicleExtras: %2",_vehicleOrdered, _vehicleExtras]; };

_randomSound = [
    "rhs_usa_land_rc_2",
    "rhs_usa_land_rc_3",
    "rhs_usa_land_rc_4",
    "rhs_usa_land_rc_5",
    "rhs_usa_land_rc_6",
    "rhs_usa_land_rc_7",
    "rhs_usa_land_rc_8",
    "rhs_usa_land_rc_9",
    "rhs_usa_land_rc_10",
    "rhs_usa_land_rc_11",
    "rhs_usa_land_rc_12",
    "rhs_usa_land_rc_13",
    "rhs_usa_land_rc_14",
    "rhs_usa_land_rc_15",
    "rhs_usa_land_rc_16",
    "rhs_usa_land_rc_17",
    "rhs_usa_land_rc_18",
    "rhs_usa_land_rc_19",
    "rhs_usa_land_rc_20",
    "rhs_usa_land_rc_21",
    "rhs_usa_land_rc_22",
    "rhs_usa_land_rc_23",
    "rhs_usa_land_rc_24",
    "rhs_usa_land_rc_25"
] call BIS_fnc_selectRandom;

player say3D _randomSound;

_tempSupplies = 
    [
        _newMoney,
        _tempUS_1,
        _tempUS_2,
        _tempUS_3,
        _tempUS_4,
        _tempUS_5,
        _tempUS_6,
        _tempUS_7,
        _tempUS_8
    ];

[_tempSupplies,false,0,_vehicleOrdered,_vehicleExtras,_vehicleCalls,_vehicleEta] call refreshUSUI;

//if (DEBUG) then { diag_log format ["USSupplies refreshed: %1",USSupplies]; };
