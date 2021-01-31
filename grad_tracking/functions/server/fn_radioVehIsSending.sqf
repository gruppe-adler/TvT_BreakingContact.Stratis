params ["_obj"];

// rhs gaz66 radio truck and GM command BTR
(
	((_obj getVariable ["tf_range",0]) == 50000) && 
	alive _obj &&
    !GRAD_ANTENNA
)