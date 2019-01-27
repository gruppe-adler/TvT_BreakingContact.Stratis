params ["_terminal"];

private _hits = _terminal getVariable ["grad_explosionReceived",0];
if (_hits < 2) exitWith {
     _terminal setVariable ["grad_explosionReceived",(_hits + 1), true];
};

private _smoke = "#particlesource" createVehicle position _terminal;
_smoke setParticleClass "SmallDestructionSmoke";

_terminal setVariable ["isFunctional", false];
_terminal removeAllEventHandlers "Explosion";

sleep 20;
deleteVehicle _smoke;
private _ex = createVehicle [
                "R_TBG32V_F",
                _terminal modeltoworld [0,0,0],
                [],
                0,
                "CAN_COLLIDE"
            ];
_ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
_ex setVelocity [0,0,-1000];
deleteVehicle _terminal;

GRAD_TERMINAL_DESTROYED = true;
publicVariable "GRAD_TERMINAL_DESTROYED";
