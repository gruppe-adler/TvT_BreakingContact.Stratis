// win conditions, detected by server only


[] spawn {
    while {true} do {
        WINCONDITIONBLUFOR = (({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0);
        WINCONDITIONOPFOR = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0);

        sleep 1;

        if (WINCONDITIONBLUFOR || BLUFOR_CAPTURED) exitWith {
            WINCONDITIONBLUFOR = true; publicVariable "WINCONDITIONBLUFOR";
            sleep 2;
            MISSION_COMPLETED = true; publicVariable "MISSION_COMPLETED";
        };

        if (WINCONDITIONOPFOR || BLUFOR_SURRENDERED) exitWith {
            WINCONDITIONOPFOR = true; publicVariable "WINCONDITIONOPFOR";
            sleep 2;
            MISSION_COMPLETED = true; publicVariable "MISSION_COMPLETED";
        };
    };
};
