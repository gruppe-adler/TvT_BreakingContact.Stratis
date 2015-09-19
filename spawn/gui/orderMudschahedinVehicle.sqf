_idc = ctrlIDC  (_this select 0);

_tempMudschahedin_1 = (mudschahedinSupplies select 1);
_tempMudschahedin_2 = (mudschahedinSupplies select 2);
_tempMudschahedin_3 = (mudschahedinSupplies select 3);
_tempMudschahedin_4 = (mudschahedinSupplies select 4);
_tempMudschahedin_5 = (mudschahedinSupplies select 5);

_oldMoney = (mudschahedinSupplies select 0);
_price = [_idc] call mudschahedin_IDC_to_price;

_newMoney = _oldMoney - _price;

// if (DEBUG) then { diag_log format ["_newMoney: %1, _price: %2",_newMoney,_price]; };


// dont fucking buy without money dude -> exit with hint
if (_newMoney < 0) exitWith { 
    [mudschahedinSupplies,true,0,"","",""] call refreshMudschahedinUI;
};

_selector = [_idc] call mudschahedin_IDC_to_selector;

//if (DEBUG) then { diag_log format ["_idc: %1",_idc]; };

switch (_selector) do {
    
    case 1: { _tempMudschahedin_1 = [_idc,_tempMudschahedin_1] call calculateMudschahedinVehicleCall; };
    case 2: { _tempMudschahedin_2 = [_idc,_tempMudschahedin_2] call calculateMudschahedinVehicleCall; };
    case 3: { _tempMudschahedin_3 = [_idc,_tempMudschahedin_3] call calculateMudschahedinVehicleCall; };
    case 4: { _tempMudschahedin_4 = [_idc,_tempMudschahedin_4] call calculateMudschahedinVehicleCall; };
    case 4: { _tempMudschahedin_5 = [_idc,_tempMudschahedin_5] call calculateMudschahedinVehicleCall; };

    default {};
};

// dont fucking buy without stock dude -> exit with hint
if (count _tempMudschahedin_1 == 1 || count _tempMudschahedin_2 == 1 || count _tempMudschahedin_3 == 1 || count _tempMudschahedin_4 == 1 || count _tempMudschahedin_5 == 1) exitWith { 
    [mudschahedinSupplies,false,_idc,"","",""] call refreshMudschahedinUI;
    player say3D "rhs_usa_land_rc_1";
};


// SUCCESS - VEHICLE WILL BE ORDERED!

_vehicleOrdered = [_idc] call mudschahedin_IDC_to_classname;
_vehicleExtras = [_idc] call mudschahedin_IDC_to_extras;
_vehicleCalls = [_idc] call mudschahedin_IDC_to_calls;
_vehicleEta = [_idc] call mudschahedin_IDC_to_eta;

if (DEBUG) then { diag_log format ["_vehicleOrdered: %1, _vehicleExtras: %2",_vehicleOrdered, _vehicleExtras]; };

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
        _tempMudschahedin_1,
        _tempMudschahedin_2,
        _tempMudschahedin_3,
        _tempMudschahedin_4,
        _tempMudschahedin_5
    ];

[_tempSupplies,false,0,_vehicleOrdered,_vehicleExtras,_vehicleCalls,_vehicleEta] call refreshMudschahedinUI;

//if (DEBUG) then { diag_log format ["mudschahedinSupplies refreshed: %1",mudschahedinSupplies]; };
