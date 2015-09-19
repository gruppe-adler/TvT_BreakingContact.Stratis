_unit = _this select 0;

 [] execVM "loadouts\loadouts_blufor.sqf";
 [] execVM "loadouts\loadouts_opfor.sqf";

waitUntil { !isNull _unit };

      if (local _unit) then {
        waitUntil { time > 1 };
       
            ["loadouts processed for _unit %1",typeOf _unit] call BIS_fnc_logFormat;
           

          
            
            switch (typeOf _unit) do {

            case "B_G_officer_F": {[_unit] call blufor_officer;};
            case "B_officer_F": {[_unit] call blufor_officer;};

            case "B_Soldier_TL_F": {[_unit] call blufor_officer;};
            case "B_G_Soldier_TL_F": {[_unit] call blufor_officer;};
            case "B_recon_TL_F": {[_unit] call blufor_officer;};
            case "B_Soldier_SL_F": {[_unit] call blufor_officer;};
            case "B_G_Soldier_SL_F": {[_unit] call blufor_officer;};
            

            case "B_G_Soldier_GL_F": {[_unit] call blufor_default;};
            case "B_Soldier_GL_F": {[_unit] call blufor_default;};

            case "B_medic_F": {[_unit] call blufor_medic;};
            case "B_recon_medic_F": {[_unit] call blufor_medic;};
            case "B_G_medic_F": {[_unit] call blufor_medic;};

            case "B_soldier_AAR_F": {[_unit] call blufor_default;};
            case "B_G_Soldier_AR_F": {[_unit] call blufor_default;};
            case "B_soldier_AR_F": {[_unit] call blufor_default;};

            case "B_G_Soldier_exp_F": {[_unit] call blufor_default;};
            case "B_soldier_exp_F": {[_unit] call blufor_default;};

            case "B_Soldier_04_F": {[_unit] call blufor_default;};
            case "B_Soldier_03_F": {[_unit] call blufor_default;};
            case "B_Soldier_F": {[_unit] call blufor_default;};
            case "B_Soldier_lite_F": {[_unit] call blufor_default;};
            case "B_G_Soldier_F": {[_unit] call blufor_default;};
            case "B_G_Soldier_lite_F": {[_unit] call blufor_default;};

            case "O_Soldier_LAT_F": {[_unit] call opfor_default;};
            case "O_recon_LAT_F": {[_unit] call opfor_default;};
            case "O_soldierU_LAT_F": {[_unit] call opfor_default;};
            case "O_G_Soldier_LAT_F": {[_unit] call opfor_default;};

            case "O_medic_F": {[_unit] call opfor_medic;};
            case "O_recon_medic_F": {[_unit] call opfor_medic;};
            case "O_soldierU_medic_F": {[_unit] call opfor_medic;};
            case "O_G_medic_F": {[_unit] call opfor_medic;};

            case "O_G_Soldier_exp_F": {[_unit] call opfor_default;};
            case "O_soldier_exp_F": {[_unit] call opfor_default;};
            case "O_recon_exp_F": {[_unit] call opfor_default;};
            case "O_soldierU_exp_F": {[_unit] call opfor_default;};

            case "O_G_Soldier_AR_F": {[_unit] call opfor_default;};
            case "O_Soldier_AR_F": {[_unit] call opfor_default;};
            case "O_soldierU_AR_F": {[_unit] call opfor_default;};
            case "O_Soldier_AAR_F": {[_unit] call opfor_default;};
            case "O_soldierU_AAR_F": {[_unit] call opfor_default;};

            case "O_G_Soldier_TL_F": {[_unit] call opfor_officer;};
            case "O_soldierU_F": {[_unit] call opfor_officer;};
            case "O_Soldier_TL_F": {[_unit] call opfor_officer;};
            case "O_recon_TL_F": {[_unit] call opfor_officer;};
            case "O_soldierU_TL_F": {[_unit] call opfor_officer;};
            case "O_G_officer_F": {[_unit] call opfor_officer;};
            case "O_officer_F": {[_unit] call opfor_officer;};
            case "O_Soldier_TL_F": {[_unit] call opfor_officer;};
            case "O_recon_TL_F": {[_unit] call opfor_officer;};
            case "O_soldierU_TL_F": {[_unit] call opfor_officer;};

            case "O_G_Soldier_GL_F": {[_unit] call opfor_default;};
            case "O_Soldier_GL_F": {[_unit] call opfor_default;};
            case "O_SoldierU_GL_F": {[_unit] call opfor_default;};
            case "O_G_Soldier_F": {[_unit] call opfor_default;};
            case "O_G_Soldier_lite_F": {[_unit] call opfor_default;};
            case "O_Soldier_F": {[_unit] call opfor_default;};
            case "O_Soldier_lite_F": {[_unit] call opfor_default;};
            case "O_soldierU_F": {[_unit] call opfor_default;};
            case "O_soldierU_A_F": {[_unit] call opfor_default;};
            case "O_G_Soldier_A_F": {[_unit] call opfor_default;};
            case "O_Soldier_A_F": {[_unit] call opfor_default;};
            default {  ["class %1 not found in matching list",typeOf _unit] call BIS_fnc_logFormat;};
    
     };

     } else { ["player %1 is not local to itself -.-", _unit] call BIS_fnc_logFormat;};
    
