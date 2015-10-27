_unit = _this select 0;

call compile preprocessFile "loadouts\loadout_fillfunctions.sqf";
call compile preprocessFile "loadouts\loadouts_opfor.sqf";
call compile preprocessFile "loadouts\loadouts_blufor.sqf";

waitUntil { !isNull _unit };

      if (local _unit) then {
        
       
            //["loadouts processed for _unit %1",typeOf _unit] call BIS_fnc_logFormat;
           

          
            
            switch (typeOf _unit) do {

            case "B_G_officer_F": {[_unit] call blufor_sql;};
            case "B_officer_F": {[_unit] call blufor_sql;};

            case "B_Soldier_TL_F": {[_unit] call blufor_ftl;};
            case "B_G_Soldier_TL_F": {[_unit] call blufor_ftl;};
            case "B_recon_TL_F": {[_unit] call blufor_ftl;};
            case "B_Soldier_SL_F": {[_unit] call blufor_sql;};
            case "B_G_Soldier_SL_F": {[_unit] call blufor_sql;};
            

            case "B_G_Soldier_GL_F": {[_unit] call blufor_default;};
            case "B_Soldier_GL_F": {[_unit] call blufor_default;};

            case "B_Soldier_A_F": {[_unit] call blufor_ammobearer;};

            case "B_medic_F": {[_unit] call blufor_medic;};
            case "B_recon_medic_F": {[_unit] call blufor_medic;};
            case "B_G_medic_F": {[_unit] call blufor_medic;};

            case "B_soldier_AAR_F": {[_unit] call blufor_MG;};
            case "B_G_Soldier_AR_F": {[_unit] call blufor_MG;};
            case "B_soldier_AR_F": {[_unit] call blufor_MG;};

            case "B_G_Soldier_exp_F": {[_unit] call blufor_marksman;};
            case "B_soldier_exp_F": {[_unit] call blufor_marksman;};
            case "B_soldier_M_F": {[_unit] call blufor_marksman;};
            case "B_recon_M_F": {[_unit] call blufor_marksman;};
            case "B_G_Soldier_M_F": {[_unit] call blufor_marksman;};
            
            case "B_Helipilot_F": {[_unit] call blufor_crew;};
            

            case "B_Soldier_04_F": {[_unit] call blufor_default;};
            case "B_Soldier_03_F": {[_unit] call blufor_default;};
            case "B_Soldier_F": {[_unit] call blufor_default;};
            case "B_Soldier_lite_F": {[_unit] call blufor_default;};
            case "B_G_Soldier_F": {[_unit] call blufor_default;};
            case "B_G_Soldier_lite_F": {[_unit] call blufor_default;};

            case "B_soldier_AT_F": {[_unit] call blufor_AT;};

            case "B_engineer_F": {[_unit] call blufor_engineer;};
            case "B_soldier_repair_F": {[_unit] call blufor_engineer;};

            case "B_crew_F": {[_unit] call blufor_crew;};

            case "O_Soldier_LAT_F": {[_unit] call opfor_default;};
            case "O_recon_LAT_F": {[_unit] call opfor_default;};
            case "O_soldierU_LAT_F": {[_unit] call opfor_default;};
            case "O_G_Soldier_LAT_F": {[_unit] call opfor_default;};


            case "O_medic_F": {[_unit] call opfor_medic;};
            case "O_recon_medic_F": {[_unit] call opfor_medic;};
            case "O_soldierU_medic_F": {[_unit] call opfor_medic;};
            case "O_G_medic_F": {[_unit] call opfor_medic;};

            case "O_G_Soldier_exp_F": {[_unit] call opfor_marksman;};
            case "O_soldier_exp_F": {[_unit] call opfor_marksman;};
            case "O_recon_exp_F": {[_unit] call opfor_marksman;};
            case "O_soldierU_exp_F": {[_unit] call opfor_marksman;};

            case "O_G_Soldier_AR_F": {[_unit] call opfor_MG;};
            case "O_Soldier_AR_F": {[_unit] call opfor_MG;};
            case "O_soldierU_AR_F": {[_unit] call opfor_MG;};
            case "O_Soldier_AAR_F": {[_unit] call opfor_MG;};
            case "O_soldierU_AAR_F": {[_unit] call opfor_MG;};

            case "O_officer_F": {[_unit] call opfor_sql;};

            case "O_G_Soldier_TL_F": {[_unit] call opfor_ftl;};
            case "O_soldierU_F": {[_unit] call opfor_ftl;};
            case "O_Soldier_TL_F": {[_unit] call opfor_ftl;};
            case "O_recon_TL_F": {[_unit] call opfor_ftl;};
            case "O_soldierU_TL_F": {[_unit] call opfor_ftl;};
            case "O_G_officer_F": {[_unit] call opfor_ftl;};
            case "O_Soldier_TL_F": {[_unit] call opfor_ftl;};
            case "O_recon_TL_F": {[_unit] call opfor_ftl;};
            case "O_soldierU_TL_F": {[_unit] call opfor_ftl;};

            case "O_Soldier_SL_F": {[_unit] call opfor_sql;};

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
            case "O_Soldier_A_F": {[_unit] call opfor_ammobearer;};

            case "O_Soldier_AT_F": {[_unit] call opfor_AT;};

            case "O_engineer_F": {[_unit] call opfor_engineer;};
            case "O_soldier_repair_F": {[_unit] call opfor_engineer;};

            case "O_crew_F": {[_unit] call opfor_crew;};

            default {  ["class %1 not found in matching list",typeOf _unit] call BIS_fnc_logFormat;};
    
     };

     } else { ["player %1 is not local to itself -.-", _unit] call BIS_fnc_logFormat;};
    
