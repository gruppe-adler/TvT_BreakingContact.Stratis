params ["_terminal"];

if (_terminal getVariable ["grad_explosionReceived",0] == 0) exitWith {
	_terminal setVariable ["grad_explosionReceived",1, true];
};

_smoke = "#particlesource" createVehicle position _terminal;
_smoke setParticleClass "SmallDestructionSmoke";

_terminal setVariable ["isFunctional", false];
_terminal removeAllEventHandlers "Explosion";

sleep 20;
deleteVehicle _smoke;
_ex = createVehicle [
                "R_TBG32V_F",
                _terminal modeltoworld [0,0,0],
                [],
                0,
                "CAN_COLLIDE"
            ];
_ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
_ex setVelocity [0,0,-1000];
deleteVehicle _terminal;
