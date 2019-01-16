/*
    buy complete on server
*/

params ["_unit", "_identifier", "_startVehicle", "_buyQueue"];

if (!isServer) exitWith {};

// systemChat str "buycomplete";

private _spawnPos = (getPos _startVehicle);
private _roadArray = _spawnPos nearRoads 500;
private _closestRoads = [_roadArray, [_spawnPos], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;


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
        
        if (DEBUG_MODE) then {
            [_roadPos, _i] call _debugMarkerGood;
        };

        if (_emptyIndex < (count _buyQueue)) then {
            diag_log format ["%1", _emptyIndex];
            private _data = _buyQueue select _emptyIndex;
            private _itemConfigName = _data param [2, ""];
            private _isSpecial = _data param [14]; // get special

            if (!_isSpecial) then {
                [side _unit, _startVehicle, _roadPos, _roadDir, _data] call BC_buymenu_fnc_buyVehicle;
            } else {
                [_itemConfigName, _startVehicle, _data] call BC_buymenu_fnc_buySpecials;
            };
        };

        _emptyIndex = _emptyIndex + 1;
    } else {
        if (DEBUG_MODE) then {
            [_roadPos, _i] call _debugMarkerBad;
        };
    };
};

missionNamespace setVariable [_identifier, [], true];