/*     air drop script by nomisum     dependency: RHS
*/

params ["_pos", "_spawnObjectType", "_postinit", "_calls", "_spawnMethod", "_selector", "_side"];
 // if (!isServer) exitWith {}; // runs only on server
 // parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively

// _pos : position or marker
// _spawnObjectType : classname of object to be spawned
// _postinit : vehicle init
// _calls : extra calls made after spawn
// _spawnMethod : // 0 spawn at ground,	// 1 spawn with chute,	// 2 spawn with heli carrier,	// 3 spawn with civilian driving it	// 4 spawn at water marker
// _selector : index of array
// _side : side of spawned vehicle


// convert vehicle array to vehicle (if more than one is possible)
_spawnObjectType = _spawnObjectType select 0;
diag_log format ["spawnVehicleManager received order for %1",_spawnObjectType];

switch (_spawnMethod) do {
     case 0: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call GRAD_buymenu_fnc_spawnSimple; };     case 4: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call GRAD_buymenu_fnc_spawnWater; };     default { diag_log format ["FATAL ERROR , no spawn method"];};

};