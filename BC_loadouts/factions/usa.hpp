class USA {
     class AllUnits {
          primaryWeapon = "rhs_weap_m4a1_carryhandle";
          primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_M855A1_Stanag"; 
          primaryWeaponPointer = "FHQ_acc_ANPEQ15_black";
          primaryWeaponOptics = "FHQ_optic_HWS";
          handgunWeapon = "rhsusf_weap_m9";
          handgunWeaponMagazine = "rhsusf_mag_15Rnd_9x19_JHP";
          uniform = "rhs_uniform_FROG01_wd";
          addItemsToUniform[] = {LIST_9("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP")};
          vest = "rhsusf_mbav_rifleman";
          addItemsToVest[] = {LIST_4("rhs_mag_30Rnd_556x45_M855A1_Stanag"),LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),LIST_2("rhs_mag_m67"),LIST_2("SmokeShell")};
          backpack = "rhsusf_assault_eagleaiii_coy";
          addItemsToBackpack[] = {};
          headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
          binoculars = "Binocular";
          map = "ItemMap";
          gps = "";
          radio = "TFAR_anprc152";
          compass = "ItemCompass";
          watch = "ItemWatch";
     };

     class Type {
          class Soldier_F {
              
          };
          class Engineer_F {
               backpack = "rhssaf_kitbag_smb";
               addItemsToBackpack[] = {LIST_6("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_2("ACE_morphine"),"grad_axe","ACE_Fortify","ACE_EntrenchingTool","ACE_DefusalKit"};
          };
          class HeavyGunner_F {
               primaryWeapon = "rhs_weap_m240B";
               primaryWeaponMagazine = "rhsusf_100Rnd_762x51_m62_tracer"; 
               addItemsToUniform[] = {LIST_5("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50"};
               addItemsToVest[] = {"rhs_mag_m67","SmokeShell","rhsusf_100Rnd_762x51_m62_tracer","rhsusf_50Rnd_762x51"};
               addItemsToBackpack[] = {LIST_2("rhsusf_100Rnd_762x51_m62_tracer")};
          };
          class Soldier_AR_F {
               primaryWeapon = "rhs_weap_m249_pip_S";
               primaryWeaponMagazine = "200Rnd_556x45_Box_Tracer_Red_F"; 
               addItemsToUniform[] = {LIST_5("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP")};
               addItemsToVest[] = {LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),"rhs_mag_m67",LIST_2("SmokeShell"),"200Rnd_556x45_Box_Tracer_Red_F"};
               addItemsToBackpack[] = {LIST_3("200Rnd_556x45_Box_Tracer_Red_F")};
          };
          class Soldier_AAR_F {
               addItemsToUniform[] = {LIST_5("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP")};
               addItemsToBackpack[] = {LIST_1("200Rnd_556x45_Box_Tracer_Red_F")};
          };
          class Soldier_AAT_F {
               addItemsToVest[] = {LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),LIST_2("rhs_mag_m67"),LIST_2("SmokeShell")};
               backpack = "B_Carryall_khk";
               addItemsToBackpack[] = {LIST_2("rhs_mag_maaws_HEAT")};
          };

          class Soldier_AT_F {
               secondaryWeapon = "rhs_weap_maaws";
               addItemsToUniform[] = {LIST_5("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50"};
               addItemsToVest[] = {LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"),"SmokeShell"};
               backpack = "B_Carryall_cbr";
               addItemsToBackpack[] = {"rhs_mag_maaws_HEAT"};
          };
          class Soldier_A_F {
               addItemsToBackpack[] = {LIST_4("rhsusf_100Rnd_762x51_m62_tracer")};
          };

          class Soldier_LAT_F {
               secondaryWeapon = "rhs_weap_m72a7";
               addItemsToUniform[] = {LIST_5("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_3("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),"rhs_m72a7_mag"};
          };

          class Medic_F {
               backpack = "rhsusf_assault_eagleaiii_coy";
               addItemsToBackpack[] = {LIST_10("ACE_fieldDressing"), LIST_10("ACE_morphine"), LIST_10("ACE_epinephrine"), LIST_8("ACE_bloodIV_250"), LIST_2("HandGrenade")};
          };
          class Soldier_TL_F {
               gps = "ItemGPS";
               primaryWeapon = "rhs_weap_m4a1_carryhandle_m203S";
               addItemsToUniform[] = {LIST_7("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_4("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP")};
               addItemsToVest[] = {LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),LIST_2("rhs_mag_m67"),LIST_2("SmokeShell"),LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"),LIST_5("1Rnd_SmokeGreen_Grenade_shell"),LIST_5("1Rnd_SmokeRed_Grenade_shell"),LIST_2("1Rnd_Smoke_Grenade_shell")};
               addItemsToBackpack[] = {LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag")};
          };
          class Soldier_SL_F: Soldier_TL_F {
               addItemsToUniform[] = {LIST_7("ACE_fieldDressing"),LIST_2("ACE_epinephrine"),LIST_4("ACE_morphine"),LIST_2("ACE_tourniquet"),"ACE_MapTools","ACE_Flashlight_XL50",LIST_2("rhsusf_mag_15Rnd_9x19_JHP")};
               backpack = "TFAR_rt1523g_sage";
          };
          class officer_F: Soldier_SL_F {
               // same
          };
          class Crew_F {
             
          };
          class Helipilot_F: Crew_F {};
     };
};