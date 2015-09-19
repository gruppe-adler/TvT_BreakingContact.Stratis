// win conditions, detected by server only

moveEveryoneToWhiteboard = {
    spectator_vehicle setVehicleLock "UNLOCKED";

    _pos = getPos whiteboard;
    [[[west, _pos, blufor], "mission_setup\teleportEffectEnd.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
    [[[east, _pos, blufor], "mission_setup\teleportEffectEnd.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
    [[[civilian, _pos, blufor], "mission_setup\teleportEffectEnd.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
};

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
            //call moveEveryoneToWhiteboard;
        };

        if (WINCONDITIONOPFOR || BLUFOR_SURRENDERED) exitWith {
            MISSION_COMPLETED = true; publicVariable "MISSION_COMPLETED";
            WINCONDITIONOPFOR = true; publicVariable "WINCONDITIONOPFOR";
            sleep 2;
            [[[east], "objectives\endmission.sqf"], "BIS_fnc_execVM", true, true] spawn BIS_fnc_MP;
            
            //call moveEveryoneToWhiteboard;
        };
    };
};
