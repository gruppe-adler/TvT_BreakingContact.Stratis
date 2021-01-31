 params ["_unit"];

if (_unit != player && side _unit == east) then {
    private _antennaTakeAction = ["antennaTake", "Take Antenna", "",
    {
      private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull];
      [player, _target] spawn GRAD_tracking_fnc_attachUnitAntenna;
    },
    {_target getVariable ["BC_hasAntenna", false]}] call ace_interact_menu_fnc_createAction;

    [_unit, 0, ["ACE_MainActions"],_antennaTakeAction] call ace_interact_menu_fnc_addActionToObject;
};