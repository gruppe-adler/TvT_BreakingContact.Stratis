// win conditions, detected by server only


[] spawn {
    while {true} do {
        WINCONDITIONBLUFOR = (({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0); 
        WINCONDITIONOPFOR = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0);

        sleep 1;

        if (WINCONDITIONBLUFOR || BLUFOR_CAPTURED) exitWith {
            MISSION_COMPLETED = true; publicVariable "MISSION_COMPLETED";
            WINCONDITIONBLUFOR = true; publicVariable "WINCONDITIONBLUFOR";
            sleep 2;
            [[[west], "objectives\endmission.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;            
        };

        if (WINCONDITIONOPFOR || BLUFOR_SURRENDERED) exitWith {
            MISSION_COMPLETED = true; publicVariable "MISSION_COMPLETED";
            WINCONDITIONOPFOR = true; publicVariable "WINCONDITIONOPFOR";
            sleep 2;
            [[[east], "objectives\endmission.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
        };
    };
};
