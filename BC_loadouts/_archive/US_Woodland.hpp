
class US_Woodland: US_Desert {
     class AllUnits: AllUnits {
          uniform = "rhs_uniform_FROG01_wd";
          vest = "rhsusf_spc";
          backpack = "rhsusf_assault_eagleaiii_coy";
          headgear = "rhsusf_mich_helmet_marpatwd";
     };

     class Type: Type {
          class Soldier_F: Soldier_F {
               vest = "rhsusf_spc";
          };
          class Soldier_AR_F: Soldier_AR_F {
               vest = "rhsusf_spc_mg";
          };
          class Soldier_AT_F: Soldier_AT_F {
               vest = "rhsusf_spc_patchless";
          };
          class Soldier_A_F: Soldier_A_F {
               vest = "rhsusf_spc_light";
          };
          class Medic_F: Medic_F {
               vest = "rhsusf_spc_corpsman";
          };
          class Soldier_TL_F: Soldier_TL_F {
               vest = "rhsusf_spc_marksman";
               #ifndef GRAD_FACTIONS_USE_ACRE
                backpack = "tfar_rt1523g_big_bwmod";
               #endif
          };
          class Soldier_SL_F: Soldier_TL_F {
               vest = "rhsusf_spc_squadleader";
               headgear = "rhs_8point_marpatwd";
               #ifndef GRAD_FACTIONS_USE_ACRE
               backpack = "tfar_rt1523g_big_bwmod";
               #endif
          };
          class officer_F: Soldier_SL_F {};
          class Crew_F: Crew_F {
               vest = "rhsusf_spc_crewman";
               headgear = "rhsusf_cvc_green_helmet";
          };
          class Helipilot_F: Crew_F {};
     };
};
