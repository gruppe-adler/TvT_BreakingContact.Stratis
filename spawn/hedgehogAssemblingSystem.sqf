assembleTankTrap = {
	_crate = _this select 0;	
	_pos = getPos _crate;
	deleteVehicle _crate;

	_hedgy = createVehicle ["Hedgehog", _pos, [], 0, "CAN_COLLIDE"];
	[_hedgy, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;
};

createInitialBox = {
	_vehicle = _this select 0;	

	_craty = "ACE_Box_Misc" createVehicle [0,0,0];
	clearWeaponCargoGlobal _craty; 
    clearItemCargoGlobal _craty; 
    clearBackpackCargoGlobal _craty; 
    clearMagazineCargoGlobal _craty;

    [_craty, _vehicle] call ace_cargo_fnc_loadItem;
};

disassembleTankTrap = {
	_trap = _this select 0;
	_pos = getPos _trap;
	deleteVehicle _trap;

	_craty = createVehicle ["ACE_Box_Misc", _pos, [], 0, "CAN_COLLIDE"];
	clearWeaponCargoGlobal _craty; 
    clearItemCargoGlobal _craty; 
    clearBackpackCargoGlobal _craty; 
    clearMagazineCargoGlobal _craty;
};