params ["_obj"];

// rhs gaz66 radio truck and GM command BTR
(
	(((_obj getVariable ["tf_range",0]) == 50000) ||
	(_obj animationSourcePhase "antennaMast_1_1_source" == 1)) && 
	alive _obj
)