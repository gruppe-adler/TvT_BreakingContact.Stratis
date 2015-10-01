_rusAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "USSupplyGUI"; [USSupplies, false, 0, "","",""] call refreshUSUI;},
  {side player == west},{},[],[1,0,0],5] call ace_interact_menu_fnc_createAction;

["US_WarfareBUAVterminal_Base_EP1", 0, [], _rusAction] call ace_interact_menu_fnc_addActionToClass;


_usAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = createDialog "RussianSupplyGUI"; [RussianSupplies, false, 0, "","",""] call refreshRussianUI;},
  {side player == east},{},[],[1,0,0],5] call ace_interact_menu_fnc_createAction;

["TK_WarfareBUAVterminal_Base_EP1", 0, [], _usAction] call ace_interact_menu_fnc_addActionToClass;