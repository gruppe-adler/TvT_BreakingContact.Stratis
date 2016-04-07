_teamleads= [
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
_squadleads= [
	"O_Soldier_SL_F"
];
_commanders = [
	"opfor_assistant",
	"opfor_teamlead"
];
_allofthem = _teamleads + _squadleads + _commanders;
_drawIconsStacked = [];

{
	diag_log format ["////////////////////////"];
	diag_log format ["debug attaching helper stuff _x : %1",_x];
	diag_log format ["////////////////////////"];
	_drawIconSymbol = "Sign_Pointer_Cyan_F";
	if (!((typeOf _x) in _allofthem)) exitWith {};

	if ((typeOf _x) in _teamleads) then {
		_drawIconSymbol = "Sign_Pointer_Green_F";	
	};
	if ((typeOf _x) in _squadleads) then {
		_drawIconSymbol = "Sign_Pointer_Pink_F";	
	};
	if (str _x in _commanders) then {
		_drawIconSymbol = "Sign_Pointer_Yellow_F";
	};
	_drawIconTemp = _drawIconSymbol createVehicle position _x;
	_drawIconTemp attachTo [_x,[0,0,2.4]];

	_drawIconsStacked = _drawIconsStacked + _drawIconTemp;
		
} forEach allUnits;

waitUntil {time > 600};
{deleteVehicle _x} forEach _drawIconsStacked;