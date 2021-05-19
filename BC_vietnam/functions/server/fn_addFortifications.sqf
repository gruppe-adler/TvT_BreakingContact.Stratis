params ["_vehicle"];

private _VNactive = isClass ( configFile >> "CfgVehicles" >> "Land_vn_o_wallfoliage_01" );

if (_VNactive) then {
    {
        [_vehicle, _x, 5] call grad_fortifications_fnc_addFort;
    } forEach [
        "Land_vn_o_wallfoliage_01",
        "Land_vn_o_shelter_02",
        "Land_vn_o_shelter_06",
        "Land_vn_o_shelter_04",
        "Land_vn_o_platform_06",
        "Land_vn_o_shelter_01"
    ];
};