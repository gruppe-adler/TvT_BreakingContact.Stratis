// buy actions
_usAction1 = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "USSupplyGUI"; disableSerialization; [USSupplies, false, 0, "","",""] call refreshUSUI;},
  {side player == west}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_w_4dr", 0, ["ACE_MainActions"], _usAction1] call ace_interact_menu_fnc_addActionToClass;

_usAction2 = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "USSupplyGUI"; disableSerialization; [USSupplies, false, 0, "","",""] call refreshUSUI;},
  {side player == west}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_d_4dr", 0, ["ACE_MainActions"], _usAction2] call ace_interact_menu_fnc_addActionToClass;



_rusAction = ["RusBuyMenu", (localize "str_GRAD_buy_vehicles"), "",
 {
 0 = createDialog "RussianSupplyGUI"; disableSerialization; [russianSupplies, false, 0, "","",""] call refreshRussianUI;
 },
  {side player == east}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_rusAction] call ace_interact_menu_fnc_addActionToClass;


_destroyAction = ["usDestroyMenu", (localize "str_GRAD_destroy_vehicle"), "",
 {
 [60, [_this select 0], {((_this select 0) select 0) setdamage 1;}, {hint "Cancelled action"}, (localize "str_GRAD_destroying_radio")] call ace_common_fnc_progressBar;
 },
  {side player == west}] call ace_interact_menu_fnc_createAction;  
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_destroyAction] call ace_interact_menu_fnc_addActionToClass;



/*_assembleTankTrap = ["ACE_MainActions", "Assemble Tank Trap", "",
 {[this] call assembleTankTrap;},
  {},{},[],[1,0,0],1] call ace_interact_menu_fnc_createAction;*/

// CURRENTLY NOT IN USE (UNWANTED AIA DEPENDENCY)

/*
_assembleTankTrap = ["TankTrapSystem", "Assemble Tank Trap", "",
 {[(_this select 0)] call assembleTankTrap;},
  {true}] call ace_interact_menu_fnc_createAction;

["ACE_Box_Misc", 0, ["ACE_MainActions"],_assembleTankTrap] call ace_interact_menu_fnc_addActionToClass;
*/

/*
_disassembleTankTrap = ["ACE_MainActions", "Disassemble Tank Trap", "",
 {[this] call disassembleTankTrap;},
  {},{},[],[1,0,0],1] call ace_interact_menu_fnc_createAction;*/


// CURRENTLY NOT IN USE (UNWANTED AIA DEPENDENCY)
/*
_disassembleTankTrap = ["TankTrapSystem", "Disassemble Tank Trap", "",
 {[(_this select 0)] call disassembleTankTrap;},
  {true}] call ace_interact_menu_fnc_createAction;

["Hedgehog", 0, ["ACE_MainActions"],_disassembleTankTrap] call ace_interact_menu_fnc_addActionToClass;

*/


// transmission progress check
_transmissionProgressAction = ["TransmissionProgress", "Check Transmission Progress", "",
 {[{[] call showPointsInstant;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;},
  {side player == east}] call ace_interact_menu_fnc_createAction;

["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_transmissionProgressAction] call ace_interact_menu_fnc_addActionToClass;




// assault boat assembly

_assembleAssaultBoat = ["AssaultBoatAssembly", "Assemble Assault Boat", "",
 {[(_this select 0)] call assembleAssaultBoat;},
  {true}] call ace_interact_menu_fnc_createAction;

["ACE_Box_Misc", 0, ["ACE_MainActions"],_assembleAssaultBoat] call ace_interact_menu_fnc_addActionToClass;

/* 0 = _x addAction["<t color=""#93E352"">" + "Assemble Assault Boat",{[[[position player]  "spawn\assaultBoatAssemblingSystem.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP; }, _Args, 1, false, true, "","typeOf 'B_FieldPack_blk' == typeOf _target"];*/


// "B_Boat_Transport_01_F" / "B_FieldPack_blk"
