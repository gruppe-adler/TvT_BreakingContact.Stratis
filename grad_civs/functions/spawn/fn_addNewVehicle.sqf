params ["_pos", "_vehicleType", "_side"];
_pos = _this select 0;
_vehicleType = _this select 1;
_side = _this select 2;

_crewCount = floor (random 1);




_veh = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
/* waitUntil {!isNull _veh};*/

_group = createGroup _side;


[_group,_veh] call GRAD_civs_fnc_createVehicleDriver;

if (_vehicleType == "RDS_Ikarus_Civ_01" || _vehicleType == "RDS_Ikarus_Civ_02") exitWith {

     _crewCount = floor (random 5);

     for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
          [_group,_veh] call GRAD_civs_fnc_createVehicleCargo;
     };
     [_veh,_group]
};


if (_crewCount > 0) then {
     for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
          [_group,_veh] call GRAD_civs_fnc_createVehicleCargo;
     };
};

_veh addEventhandler ["HandleDamage",{if ((_this select 4) == "") then {0};}]; // ignore crash damage


[_veh,_group]