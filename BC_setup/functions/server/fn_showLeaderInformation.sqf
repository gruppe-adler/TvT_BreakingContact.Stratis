private _teamleads= [
"B_Soldier_TL_F",
"B_G_Soldier_TL_F",
"B_recon_TL_F",
"O_G_Soldier_TL_F",
"O_soldierU_F",
"O_Soldier_TL_F",
"O_recon_TL_F",
"O_soldierU_TL_F",
"O_G_officer_F",
"O_Soldier_TL_F",
"O_recon_TL_F",
"O_soldierU_TL_F"
];

private _squadleads= [
"B_Soldier_SL_F",
"B_G_Soldier_SL_F",
"O_Soldier_SL_F"
];

private _commanders = [
"opfor_assistant",
"opfor_teamlead",
"blufor_assistant",
"blufor_teamlead"
];

private _allofthem = _teamleads + _squadleads + _commanders;
private _drawIconsStacked = [];

{     _drawIconSymbol = "Sign_Pointer_Cyan_F";     if (!((typeOf _x) in _allofthem)) then {} else {
     	if ((typeOf _x) in _teamleads) then {     		_drawIconSymbol = "Sign_Arrow_Green_F";     	};     	if ((typeOf _x) in _squadleads) then {     		_drawIconSymbol = "Sign_Arrow_Pink_F";     	};     	if (str _x in _commanders) then {     		_drawIconSymbol = "Sign_Arrow_Yellow_F";     	};     	_drawIconTemp = _drawIconSymbol createVehicle position _x;     	_drawIconTemp attachTo [_x,[0,0,2.5]];
     	_drawIconsStacked = _drawIconsStacked + [_drawIconTemp];     };

} forEach allUnits;

waitUntil {time > 180};
{deleteVehicle _x} forEach _drawIconsStacked;
