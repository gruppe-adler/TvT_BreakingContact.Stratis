params ["_center", "_radius"];

private _spawnPositions = [];

for "_i" from 0 to 10 do {
    private _nearestRoadPosition = [
        _center, 
        [_radius, _radius], 
        random 360, 
        0,
        [2,_radius/10],
        [20,"rhsusf_CH53E_USMC"]
    ] call SHK_pos;

    if (count _nearestRoadPosition > 0) then {
        _spawnPositions pushBackUnique _nearestRoadPosition;
    };
};

_spawnPositions