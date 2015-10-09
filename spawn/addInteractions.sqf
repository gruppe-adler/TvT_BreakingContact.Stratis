_rusAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "USSupplyGUI"; [USSupplies, false, 0, "","",""] call refreshUSUI;},
  {side player == west},{},[],[1,0,0],5] call ace_interact_menu_fnc_createAction;

["US_WarfareBUAVterminal_Base_EP1", 0, [], _rusAction] call ace_interact_menu_fnc_addActionToClass;


_usAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "RussianSupplyGUI"; [RussianSupplies, false, 0, "","",""] call refreshRussianUI;},
  {side player == east},{},[],[1,0,0],5] call ace_interact_menu_fnc_createAction;

["TK_WarfareBUAVterminal_Base_EP1", 0, [], _usAction] call ace_interact_menu_fnc_addActionToClass;




/*_assembleTankTrap = ["ACE_MainActions", "Assemble Tank Trap", "",
 {[this] call assembleTankTrap;},
  {},{},[],[1,0,0],1] call ace_interact_menu_fnc_createAction;*/

_assembleTankTrap = ["TankTrapSystem", "Assemble Tank Trap", "",
 {[(_this select 0)] call assembleTankTrap;},
  {true}] call ace_interact_menu_fnc_createAction;

["ACE_Box_Misc", 0, ["ACE_MainActions"],_assembleTankTrap] call ace_interact_menu_fnc_addActionToClass;


/*_disassembleTankTrap = ["ACE_MainActions", "Disassemble Tank Trap", "",
 {[this] call disassembleTankTrap;},
  {},{},[],[1,0,0],1] call ace_interact_menu_fnc_createAction;*/

_disassembleTankTrap = ["TankTrapSystem", "Disassemble Tank Trap", "",
 {[(_this select 0)] call disassembleTankTrap;},
  {true}] call ace_interact_menu_fnc_createAction;

["Hedgehog", 0, ["ACE_MainActions"],_disassembleTankTrap] call ace_interact_menu_fnc_addActionToClass;