["LandVehicle", "init", {
    params ["_vehicle"];

    private _repairVehicle = ["repairWreckAction", "Repair Wreck", "", 
    {
        [_target] call BC_vietnam_fnc_repairVehicle;
    },
    {
      private _repairTruck = (nearestObject [position _target, "vn_o_wheeled_z157_repair"]);
      (!isNull _repairTruck && {_repairTruck distance _target < 5})
    }] call ace_interact_menu_fnc_createAction;

    [_object, 0, ["ACE_MainActions"],_repairVehicle] call ace_interact_menu_fnc_addActionToObject;

}] call CBA_fnc_addClassEventhandler;