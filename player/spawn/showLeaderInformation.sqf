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
MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];

{
	drawIconSymbol = "tl";
	if (!(typeOf _x in _allofthem)) exitWith {};

	if (typeOf _x in _teamleads) then {
		drawIconSymbol = "tl";
		drawIconColor = [0.2,0.2,0.9,1];
	};
	if (typeOf _x in _squadleads) then {
		drawIconSymbol = "sql";
		drawIconColor = [0.8,0.8,0.8,1];
	};
	if (str _x in _commanders) then {
		drawIconSymbol = "com";
		drawIconColor = [0.2,0.9,0.2,1];
	};
	_uniqueString = "drawIconFor" + (format ["%1",_x]);
	_drawIconsStacked = _drawIconsStacked + _uniqueString;
	[_uniqueString, "onEachFrame", {

		drawIcon3D [
		MISSION_ROOT + "\pic\leaderclasses\"
		drawIconSymbol +
		".paa", drawIconColor, [((getPos _x) select 0), ((getPos _x) select 1), 2.3], 2, 2, 0,""
		];
	}] call BIS_fnc_addStackedEventHandler;
} forEach allPlayers;
waitUntil {time > 600};
{[_x, "onEachFrame"] call BIS_fnc_removeStackedEventHandler; } forEach _drawIconsStacked;
