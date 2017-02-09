params ["_allPlayerPositions", "_minSpawnDistance", "_maxSpawnDistance", "_activeGroups"];

// If any vehicle is too far away, delete it
_tempVehiclesAndGroup = [];
_deletedVehiclesCount = 0;

if (count _activeGroups == 0) exitWith {};
    
{
    private ["_closestUnitDistance", "_distance", "_unit"];
 
    if (count units _x == 0) exitWith {
        _tempVehiclesAndGroup = _tempVehiclesAndGroup - [_group];
        deleteGroup _x;
    };

    _group = _x;
    _unit = (units _x) select 0; // its 1 unit groups always
    
    _closestUnitDistance = 1000000;
    
    {
        _distance = (_x distance _unit);
        if (_distance < _closestUnitDistance) then {
            _closestUnitDistance = _distance;
        };
        
        sleep 0.01;
    } foreach _allPlayerPositions;
    
    if (_closestUnitDistance < _maxSpawnDistance) then {
        _tempVehiclesAndGroup pushBack _x;
    }
    else {
        deleteVehicle _unit;
        deleteGroup _group;
        _tempVehiclesAndGroup = _tempVehiclesAndGroup - [_group];
    };
    
    sleep 0.01;
} foreach _activeGroups;

GRAD_CIV_ONFOOT_GROUPS = _tempVehiclesAndGroup;

diag_log format ["GRAD_civs_findRemovableCiv deleted %1 civs", _deletedVehiclesCount];
