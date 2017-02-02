params ["_vehicle", "_raise"];



GRAD_attachThatFlag = {
	params ["_vehicle", "_pos", "_vectorup"];

	_flag = "rhs_Flag_chdkz" createVehicle [0,0,0];
	_flag setFlagTexture "\rhsafrf\addons\rhs_main\data\Flag_dnr_CO.paa";
	_flag attachto [_vehicle,_pos];
	_flag setVectorUp _vectorup;

	_vehicle setVariable ["GRAD_showFlag", true, true];
	_vehicle setVariable ["GRAD_flagObject",_flag, true];
};

GRAD_detachThatFlag = {
	params ["_vehicle"];
	_flag = _vehicle getVariable ["GRAD_flagObject",objNull];
	if (isNull _flag) exitWith {};

	detach _flag;
	deleteVehicle _flag;

	_vehicle setVariable ["GRAD_showFlag", false, true];
	_vehicle setVariable ["GRAD_flagObject",objNull, true];
};

_vehicleFlagDefinitions = [
	["rhs_tigr_m_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhs_tigr_m_3camo_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhs_kamaz5350_flatbed_msv",[1.1,2.9,1.3],[0,0,0]],
	["rhsgref_cdf_b_reg_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhsgref_nat_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhs_gaz66_repair_vdv",[1.1,-1.9,2.2], [0,0,0]],
	["rhs_gaz66_r142_vv",[1.1,-2.1,2.9], [0,0,0]],
	["rhs_bmp1_msv", [0,-2.5,0.6], [0,0,0]],
	["rhs_btr70_msv",[0,-2.7,0.6], [0,0,0]]
];

{
	diag_log format ["comparing %1 to %2", typeof _vehicle, _x select 0];
  if ((typeOf _vehicle) isEqualTo (_x select 0)) exitWith {
  		if (_raise) then {
  			[_vehicle, _x select 1, _x select 2] call GRAD_attachThatFlag;
  			_vehicle addEventHandler ["killed", "[_this select 0] call GRAD_detachThatFlag;"];
  		} else {
  			[_vehicle] call GRAD_detachThatFlag;
  		};
  };

} forEach _vehicleFlagDefinitions;