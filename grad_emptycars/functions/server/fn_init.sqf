private _carTypes = call GRAD_emptycars_fnc_definitions;

// center, radius, count, types
[[worldSize/2, worldSize/2], worldSize/2, 15, _carTypes] spawn GRAD_emptycars_fnc_findEmptySpot;
