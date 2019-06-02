params ["_vehicle"];

_vehicle addEventHandler ["Local", {
	params ["_entity", "_isLocal"];

    diag_log format ["locality changed of %1 - %2 now", _entity, _isLocal];

	if (_isLocal) then {
		[_entity] call BC_buyables_fnc_disableCollision;
	};
}];