_smoke = "#particlesource" createVehicle position (_this select 0);
_smoke setParticleClass "SmallDestructionSmoke";

(_this select 0) setVariable ["isFunctional", false];

sleep 20;

deleteVehicle _smoke;

_ex = createVehicle [
                "rhs_ammo_rgn_exp",
                (_this select 0) modeltoworld [0,0,0],
                [],
                0,
                "CAN_COLLIDE"
            ];
_ex setVectorDirAndUp [[0,0,1],[0,-1,0]];
_ex setVelocity [0,0,-1000];
(_this select 0) setDamage 1;
deleteVehicle (_this select 0);

detach portableRadioBox;
deleteVehicle portableRadioBox;

sleep 3;

RADIO_BOX_DESTROYED = true;
publicVariableServer "RADIO_BOX_DESTROYED";