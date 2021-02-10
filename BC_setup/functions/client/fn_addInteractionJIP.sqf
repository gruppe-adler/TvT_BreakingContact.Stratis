params ["_unit"];

if (side _unit == east) then {
    private _antennaTakeAction = ["antennaTake", "Take Antenna", "",
    {
      private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull];
      [player, _target] spawn GRAD_tracking_fnc_attachUnitAntenna;
    },
    {_target getVariable ["BC_hasAntenna", false]}] call ace_interact_menu_fnc_createAction;

    [_unit, 0, ["ACE_MainActions"],_antennaTakeAction] call ace_interact_menu_fnc_addActionToObject;
};

if (side _unit == west) then {
    private _destroyActionAntenna = ["usDestroyAntennaPortable", (localize "str_GRAD_disable_vehicle"), "",
    {
        [60, [_this select 0], { GRAD_ANTENNA_DISABLED = TRUE; publicVariable "GRAD_ANTENNA_DISABLED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
    },
    {_target getVariable ["BC_hasAntenna", false]}] call ace_interact_menu_fnc_createAction;

    [_unit, 0, ["ACE_MainActions"],_destroyActionAntenna] call ace_interact_menu_fnc_addActionToObject;
};