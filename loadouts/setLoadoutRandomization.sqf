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
