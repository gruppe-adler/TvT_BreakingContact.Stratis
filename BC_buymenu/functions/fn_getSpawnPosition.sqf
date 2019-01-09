params ["_center", "_distance"];

private _searchRadius = 1;
private _result = [];

for "_i" from 0 to 1000 do {

    diag_log format ["searching spawn iteration %1", _i];

    private _foundPositions = [_center, _searchRadius] call BC_buymenu_fnc_getRoadPositions;
    _searchRadius = _searchRadius + 10;

    if (count _foundPositions > 0) exitWith {
        private _closestPosition = [_foundPositions, [_center], { _input0 distance _x }, "ASCEND"] call BIS_fnc_sortBy;
        _result = _closestPosition select 0;
    };
};

_result