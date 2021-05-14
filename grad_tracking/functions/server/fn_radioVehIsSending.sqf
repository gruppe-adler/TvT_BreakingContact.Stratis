params ["_obj"];

// rhs gaz66 radio truck and GM command BTR
(
	(((_obj getVariable ["tf_range",0]) == 50000) || isVehicleRadarOn _obj) && 
	alive _obj
)