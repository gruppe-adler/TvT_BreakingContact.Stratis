_smoke = "#particlesource" createVehicle position (_this select 0);
_smoke setParticleClass "SmallDestructionSmoke";

(_this select 0) setVariable ["isFunctional", false];

sleep 20;
deleteVehicle _smoke;
_ex = createVehicle [
                "rhs_mine_tm62m_ammo",
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