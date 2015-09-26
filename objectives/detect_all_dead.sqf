// win conditions, detected by server only


[] spawn {
    while {true} do {
        OPFOR_ELIMINATED = (({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0);
        BLUFOR_ELIMINATED = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0);

        sleep 1;

        if (OPFOR_ELIMINATED || BLUFOR_ELIMINATED) exitWith {
            publicVariable "OPFOR_ELIMINATED";
            publicVariable "BLUFOR_ELIMINATED";
        };
    };
};
