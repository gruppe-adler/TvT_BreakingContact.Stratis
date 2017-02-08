// russian helmets, US helmets
[
    {
        _value = param [0];
        if (_value == "rhs_6b27m_digi") then {
            _value = selectRandom [
                "rhs_6b27m_digi",
                "rhs_6b27m_digi_bala"
            ];
        } else { if (_value == "rhsusf_mich_helmet_marpatwd") then {
            _value = selectRandom [
                "rhsusf_mich_helmet_marpatwd",
                "rhsusf_mich_helmet_marpatwd_alt",
                "rhsusf_mich_helmet_marpatwd_norotos_arc",
                "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
                "rhsusf_mich_helmet_marpatwd_norotos_headset",
                "rhsusf_mich_helmet_marpatwd_headset"
            ];
        } else { if (_value == "rhsusf_mich_helmet_marpatd_headset") then {
            _value = selectRandom [
                "rhsusf_mich_helmet_marpatd_headset",
                "rhsusf_mich_helmet_marpatd_norotos_arc",
                "rhsusf_mich_helmet_marpatd_norotos_arc_headset",
                "rhsusf_mich_helmet_marpatd_norotos_headset",
                "rhsusf_mich_helmet_marpatd_alt_headset"
            ];
        };};};
        _value
    },
    "headgear"
] call GRAD_Loadout_fnc_addReviver;

// US M4a1 and M249 variants
[
    {
        _value = param [0];
        if (_value == "rhs_weap_m4a1_carryhandle") then {
            _value =  selectRandom [
            	"rhs_weap_m4a1_carryhandle",
            	"rhs_weap_m4a1_carryhandle_grip2",
            	"rhs_weap_m4a1_carryhandle_pmag",
            	"rhs_weap_m4a1_carryhandle_grip"
            ];
        } else { if (_value == "rhs_weap_m249_pip_L") then {
            _value = selectRandom [
                "rhs_weap_m249_pip_L",
                "rhs_weap_m249_pip_L_para",
                "rhs_weap_m249_pip_L_vfg",
                "rhs_weap_m249_pip_S",
                "rhs_weap_m249_pip_S_para",
                "rhs_weap_m249_pip_S_vfg"
            ];
        };};
        _value
    },
    "primaryWeapon"
] call GRAD_Loadout_fnc_addReviver;


// mudschaheddin headgear, uniforms, beards
[
    {
        _value = param [0];
        if (_value == "LOP_H_Turban") then {
            _value = selectRandom [
                "LOP_H_Turban",
                "LOP_H_Turban",
                "LOP_H_Pakol",
                "LOP_H_Pakol",
                "LOP_H_Pakol",
                "LOP_H_Pakol"
            ];
        };
        _value
    },
    "headgear"
] call GRAD_Loadout_fnc_addReviver;

[
    {
        _value = param [0];
        if (_value == "LOP_U_AM_Fatigue_01") then {
            _value =  selectRandom [
                "LOP_U_AM_Fatigue_01",
                "LOP_U_AM_Fatigue_01_2",
                "LOP_U_AM_Fatigue_01_3",
                "LOP_U_AM_Fatigue_01_4",
                "LOP_U_AM_Fatigue_01_5",
                "LOP_U_AM_Fatigue_01_6",
                "LOP_U_AM_Fatigue_02",
                "LOP_U_AM_Fatigue_02_2",
                "LOP_U_AM_Fatigue_02_3",
                "LOP_U_AM_Fatigue_02_4",
                "LOP_U_AM_Fatigue_02_5",
                "LOP_U_AM_Fatigue_02_6",
                "LOP_U_AM_Fatigue_03",
                "LOP_U_AM_Fatigue_03_2",
                "LOP_U_AM_Fatigue_03_3",
                "LOP_U_AM_Fatigue_03_4",
                "LOP_U_AM_Fatigue_03_5",
                "LOP_U_AM_Fatigue_03_6",
                "LOP_U_AM_Fatigue_04",
                "LOP_U_AM_Fatigue_04_2",
                "LOP_U_AM_Fatigue_04_3",
                "LOP_U_AM_Fatigue_04_4",
                "LOP_U_AM_Fatigue_04_5",
                "LOP_U_AM_Fatigue_04_6"
            ];
        };
        _value
    },
    "uniform"
] call GRAD_Loadout_fnc_addReviver;

// randomize beards if possible
if (!(isClass (configfile >> "CfgGlasses" >> "TRYK_Beard"))) exitWith {};

[
    {
        _value = param [0];
        if (_value == "TRYK_Beard_BK") then {
            _value = selectRandom [
                "TRYK_Beard_BK",
                "TRYK_Beard_BK2",
                "TRYK_Beard_BK3",
                "TRYK_Beard_BK4",
                "TRYK_Beard_BW",
                "TRYK_Beard_BK",
                "TRYK_Beard_BK",
                "TRYK_Beard_BK"
            ];
        };
        _value
    },
    "facewear"
] call GRAD_Loadout_fnc_addReviver;