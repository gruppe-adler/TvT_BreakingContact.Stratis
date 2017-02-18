params ["_obj"];

if (_obj getVariable ["grad_explosionReceived",0] == 0) exitWith {
	_obj setVariable ["grad_explosionReceived",1, true];
};

_smoke = "#particlesource" createVehicle position _obj;
_smoke setParticleClass "SmallDestructionSmoke";

_obj setVariable ["isFunctional", false];
_obj removeAllEventHandlers "Explosion";

sleep 20;

deleteVehicle _smoke;
_ex = createVehicle [
                "R_TBG32V_F",
                _obj modeltoworld [0,0,0],
                [],
                0,
                "CAN_COLLIDE"
            ];
_ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
_ex setVelocity [0,0,-1000];
deleteVehicle _obj;

