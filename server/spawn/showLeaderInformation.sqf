fnc_SetPitchBankYaw = { 
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY",
	"_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp","_upXTemp"];
    _object = _this select 0; 
    _rotations = _this select 1; 
    _aroundX = _rotations select 0; 
    _aroundY = _rotations select 1; 
    _aroundZ = (360 - (_rotations select 2)) - 360; 
    _dirX = 0; 
    _dirY = 1; 
    _dirZ = 0; 
    _upX = 0; 
    _upY = 0; 
    _upZ = 1; 
    if (_aroundX != 0) then { 
        _dirY = cos _aroundX; 
        _dirZ = sin _aroundX; 
        _upY = -sin _aroundX; 
        _upZ = cos _aroundX; 
    }; 
    if (_aroundY != 0) then { 
        _dirX = _dirZ * sin _aroundY; 
        _dirZ = _dirZ * cos _aroundY; 
        _upX = _upZ * sin _aroundY; 
        _upZ = _upZ * cos _aroundY; 
    }; 
    if (_aroundZ != 0) then { 
        _dirXTemp = _dirX; 
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
        _upXTemp = _upX; 
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
    }; 
    _dir = [_dirX,_dirY,_dirZ]; 
    _up = [_upX,_upY,_upZ]; 
    _object setVectorDirAndUp [_dir,_up]; 
};  

_teamleads= [
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
_squadleads= [
"B_Soldier_SL_F",
"B_G_Soldier_SL_F",
"O_Soldier_SL_F"
];
_commanders = [
"opfor_assistant",
"opfor_teamlead",
"blufor_assistant",
"blufor_teamlead"
];
_allofthem = _teamleads + _squadleads + _commanders;
_drawIconsStacked = [];
MISSION_ROOT = = str missionConfigFile select [0, count str missionConfigFile - 15];
{
	diag_log format ["////////////////////////"];
	diag_log format ["debug attaching helper stuff _x : %1",_x];
	diag_log format ["////////////////////////"];
	_drawIconSymbol = "Sign_Pointer_Cyan_F";



	if ((typeOf _x) in _teamleads) exitWith {
		_drawIconSymbol = "UserTexture1m_F";
		_drawIconTemp = _drawIconSymbol createVehicle position _x;
		_drawIconTemp attachTo [_x,[0,0,2.5]];
		_drawIconTemp setObjectTextureGlobal [0,MISSION_ROOT + "\pic\leaderclasses\tl.paa"];
		_drawIconsStacked = _drawIconsStacked + [_drawIconTemp];
	};
	// must be before sqls
	if (str _x in _commanders) exitWith {
		_drawIconSymbol = "UserTexture1m_F";
		_drawIconTemp = _drawIconSymbol createVehicle position _x;
		_drawIconTemp attachTo [_x,[0,0,2.5]];
		_drawIconTemp setObjectTextureGlobal [0,MISSION_ROOT + "\pic\leaderclasses\com.paa"];
		_drawIconsStacked = _drawIconsStacked + [_drawIconTemp];
	};
	if ((typeOf _x) in _squadleads) exitWith {
		_drawIconSymbol = "UserTexture1m_F";
		_drawIconTemp = _drawIconSymbol createVehicle position _x;
		_drawIconTemp attachTo [_x,[0,0,2.5]];
		_drawIconTemp setObjectTextureGlobal [0,MISSION_ROOT + "\pic\leaderclasses\sql.paa"];
		_drawIconsStacked = _drawIconsStacked + [_drawIconTemp];
	};
	


} forEach allUnits;

while {time < 300} do {
	
	_modifier = 1;
	{
		_modifier = 1 + 1;
		[_x,[0,0,_modifier]] call fnc_SetPitchBankYaw; 
	} forEach _drawIconsStacked;
};
{deleteVehicle _x} forEach _drawIconsStacked;

/*
bla = "Sign_Pointer_Yellow_F" createVehicle position player;
bla attachTo [player,[0,0,2.4]];
*/
