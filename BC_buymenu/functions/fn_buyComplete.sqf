/*
    buy complete on server
*/

params ["_unit", "_identifier", "_spawnCone", "_buyQueue"];

if (!isServer) exitWith {};

// systemChat str "buycomplete";

private _spawnPos = (getPos _spawnCone);
private _roadArray = _spawnPos nearRoads 1000;
private _closestRoads = [_roadArray, [_spawnCone], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;


private _debugMarkerGood = {
    _position = _this select 0;
    _position params ["_posX", "_posY"];
    _index = _this select 1;
    _markerstr = createMarker [format ["markernameGood%1",[_posX,_posY]], [_posX, _posY]];
    _markerstr setMarkerShape "ICON";
    _markerstr setMarkerType "hd_dot";
    _markerstr setMArkerColor "ColorGreen";
    _markerstr setMarkerText (str _index);
};

private _debugMarkerBad = {
    _position = _this select 0;
    _position params ["_posX", "_posY"];
    _index = _this select 1;
    _markerstr = createMarker [format ["markernameBad%1",[_posX,_posY]], [_posX, _posY]];
    _markerstr setMarkerShape "ICON";
    _markerstr setMarkerType "hd_dot";
    _markerstr setMArkerColor "ColorRed";
    _markerstr setMarkerText (str _index);
};

private _emptyIndex = 0;
    

    
for "_i" from _emptyIndex to ((count _closestRoads) - 1) do {
    private _road = (_closestRoads select _i);
    private _roadDir = getDir _unit;
    private _roadPos = getPos _road;
    private _roadsConnectedTo = roadsConnectedTo _road;
    if (count _roadsConnectedTo > 0) then {
        private _connectedRoad = _roadsConnectedTo select 0;
        _roadDir = [_road, _connectedRoad] call BIS_fnc_DirTo;
    };
    
    // _isEmpty = [_roadPos, 0, 5, 9, 0, 20, 0] call BIS_fnc_findSafePos;
    // [center, a, b, angle, isRectangle, c]
    private _foundStuff = (allMissionObjects "") inAreaArray [_roadPos, 8, 8, _roadDir, true, -1];
    // systemChat str _foundStuff;
    if ((count _foundStuff) < 1) then {
        
        [_roadPos, _i] call _debugMarkerGood;

        if (_emptyIndex < (count _buyQueue)) then {
            diag_log format ["%1", _emptyIndex];
            private _data = _buyQueue select _emptyIndex;
            _data params ["_classname", "_displayName", "_maxCount", "_description", "_code", "_picturePath", "_crew", "_cargo", "_speed", "_baseConfigName", "_categoryConfigName", "_itemConfigName", "_spawnCone"];
            systemChat format ["buyVehicle_%1_%2", _classname, count _buyQueue];
            [_unit, _unit, 0, _code, _baseConfigName, _categoryConfigName, _itemConfigName, _roadPos, _roadDir] call BC_buymenu_fnc_buyVehicle;
        };

        _emptyIndex = _emptyIndex + 1;
    } else {
        [_roadPos, _i] call _debugMarkerBad;
    };
};

    /*
    private _data = _x;
    private _road = _closestRoads select _emptyIndex;
    private _spawnPos = getPos _road;
    private _spawnDir = getDir _road;
    _data params ["_classname", "_displayName", "_maxCount", "_description", "_code", "_picturePath", "_crew", "_cargo", "_speed", "_baseConfigName", "_categoryConfigName", "_itemConfigName", "_spawnCone"];
    */

    // diag_log format ["_data %1", _data];
    // diag_log format ["_baseConfigName %1, _categoryConfigName %2, _itemConfigName %3", _baseConfigName, _categoryConfigName, _itemConfigName];

    // [_unit, _unit, 0, _code, _baseConfigName, _categoryConfigName, _itemConfigName, _spawnPos, _spawnDir] call BC_buymenu_fnc_buyVehicle;


missionNamespace setVariable [_identifier, [], true];