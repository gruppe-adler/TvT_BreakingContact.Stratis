params ["_vehicle", "_raise"];

_vehicleFlagDefinitions = [
	["rhs_tigr_m_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhs_tigr_m_3camo_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhsgref_cdf_b_reg_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhsgref_nat_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhs_gaz66_repair_vdv",[1.1,-1.9,2.2], [0,0,0]],
	["rhs_gaz66_r142_vv",[1.1,-2.1,2.9], [0,0,0]],
	["rhs_bmp1_msv", [0,-2.5,0.6], [0,0,0]],
	["rhs_btr70_msv",[0,-2.7,0.6], [0,0,0]],
	["rhs_brm1k_msv", [0,-2.5,0.6], [0,0,0]],
	["rhsgref_BRDM2_HQ_msv", [0.8,-1.15,1.3], [0,0,0]]
];

{
	diag_log format ["comparing %1 to %2", typeof _vehicle, _x select 0];
  if ((typeOf _vehicle) isEqualTo (_x select 0)) exitWith {
  		if (_raise) then {
  			[_vehicle, _x select 1, _x select 2] call BC_flagsOnVehicles_fnc_attachFlag;
  			_vehicle addEventHandler ["killed", "[_this select 0] call BC_flagsOnVehicles_fnc_detachThatFlag;"];
  		} else {
  			[_vehicle] call BC_flagsOnVehicles_fnc_detachFlag;
  		};
  };

} forEach _vehicleFlagDefinitions;
