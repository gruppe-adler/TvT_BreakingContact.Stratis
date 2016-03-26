fnc_deleteTestObj = {
	_this addMPEventHandler ["MPKilled", {
		_this = _this select 0;
		{
			deleteVehicle _x;
		} forEach (_this getVariable ["effects", []]);
		if (isServer) then {
			deleteVehicle _this;
		};
	}];
	_this setDamage 1; 
};

_smoke = "#particlesource" createVehicle position (_this select 0);
_smoke setParticleClass "SmallDestructionSmoke";

(_this select 0) setVariable ["isFunctional", false];

sleep 20;
deleteVehicle _smoke;
_ex = createVehicle [
                "R_TBG32V_F",
                (_this select 0) modeltoworld [0,0,0],
                [],
                0,
                "CAN_COLLIDE"
            ];
            _ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
            _ex setVelocity [0,0,-1000];
            deleteVehicle (_this select 0);
            deleteVehicle terminal2;