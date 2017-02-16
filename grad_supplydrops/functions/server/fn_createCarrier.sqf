params ["_dropPosition", "_height", "_crateVeh", "_crateCode", "_side"];


private ["_chuteType", "_planeType", "_carrier", "_relDir"];

diag_log format ["creating carrier at %1", _dropPosition];

// default rhs c130j
_chuteType = missionNameSpace getVariable ["GRAD_SUPPLY_DROP_TYPE_CHUTE", "B_Parachute_02_F"];
_planeType = missionNameSpace getVariable ["GRAD_SUPPLY_DROP_TYPE_PLANE", "RHS_C130J"];

_spawnPosition = [_dropPosition] call GRAD_supplydrops_fnc_findNearestMapEdge;

_dummy = "Land_CanOpener_F" createVehicleLocal _dropPosition;
_relDir = [_dummy, _spawnPosition] call BIS_fnc_relativeDirTo;
deleteVehicle _dummy;
	
grad_supplydrops_spawnChuteHeight = _height;

carrierPos0 = [_dropPosition, 5000, _relDir] call BIS_fnc_relPos;
carrierPos1 = [_dropPosition, 1000, _relDir] call BIS_fnc_relPos;
carrierPos2 = [_dropPosition, 0, 0] call BIS_fnc_relPos;
carrierPos3 = [_dropPosition, 500, _relDir-180] call BIS_fnc_relPos;
carrierPos4 = [_dropPosition, 2000, _relDir-170] call BIS_fnc_relPos;
carrierPos5 = [_dropPosition, 4000, _relDir-160] call BIS_fnc_relPos;
carrierPos6 = [_dropPosition, 6000, _relDir-140] call BIS_fnc_relPos;
carrierPos7 = [_dropPosition, 8000, _relDir-120] call BIS_fnc_relPos;
carrierPos8 = [_dropPosition, 10000, _relDir-100] call BIS_fnc_relPos;
carrierPos9 = [_dropPosition, 12000, _relDir-80] call BIS_fnc_relPos;
carrierPos10 = [_dropPosition, 14000, _relDir-60] call BIS_fnc_relPos;
carrierPos11 = [_dropPosition, 16000, _relDir-40] call BIS_fnc_relPos;
carrierPos12 = [_dropPosition, 18000, _relDir-20] call BIS_fnc_relPos;

{
	_marker = createMarkerLocal [format["%1", toString _x],_x];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerColorLocal "ColorOpfor";
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerTextLocal format ["%1", _forEachIndex];
} forEach [carrierPos0, carrierPos1, carrierPos2, carrierPos3, carrierPos4, carrierPos5, carrierPos6, carrierPos7, carrierPos8, carrierPos9, carrierPos10, carrierPos11, carrierPos12];

_carrierArray = [
	[carrierPos0 select 0, carrierPos0 select 1, grad_supplydrops_spawnChuteHeight + 200], 
	0, 
	_planeType, 
	civilian
] call BIS_fnc_spawnVehicle;

_carrier = _carrierArray select 0;
createVehicleCrew _carrier;
_c130group = group _carrier;


_relDir = [_carrier, _dropPosition] call BIS_fnc_relativeDirTo;
_carrier setDir _relDir;
_carrier setCombatMode "BLUE";
_carrier setBehaviour "CARELESS";
_carrier disableAI "TARGET";
_carrier disableAI "AUTOTARGET";
_carrier setPilotLight true;
_carrier flyInHeight grad_supplydrops_spawnChuteHeight;
_carrier allowDamage false;


// initial speed restored
_speed = 220;
_vel = velocity _carrier;
_carrier setVelocity [(_vel select 0)+(sin _relDir*_speed),(_vel select 1)+ (cos _relDir*_speed),(_vel select 2)];


_wp0 = _c130group addWaypoint [[carrierPos1 select 0, carrierPos1 select 1, grad_supplydrops_spawnChuteHeight], 0];
_wp0 setWaypointStatements ["true", "this flyInHeight grad_supplydrops_spawnChuteHeight;"];
_wp0 setWaypointCompletionRadius 100;

_wp1 = _c130group addWaypoint [[carrierPos2 select 0, carrierPos2 select 1, grad_supplydrops_spawnChuteHeight], 0];
_wp1 setWaypointStatements ["true", "this flyInHeight grad_supplydrops_spawnChuteHeight;"];
_wp1 setWaypointCompletionRadius 50;

_wp2 = _c130group addWaypoint [[carrierPos3 select 0, carrierPos3 select 1, grad_supplydrops_spawnChuteHeight], 0];
_wp2 setWaypointStatements ["true", "this flyInHeight grad_supplydrops_spawnChuteHeight;"];

_wp3 = _c130group addWaypoint [[carrierPos4 select 0, carrierPos4 select 1, 300], 0];
_wp3 setWaypointStatements ["true", "this flyInHeight 300;"];

_wp4 = _c130group addWaypoint [[carrierPos5 select 0, carrierPos5 select 1, 500], 0];
_wp4 setWaypointStatements ["true", "this flyInHeight 400;"];

_wp5 = _c130group addWaypoint [[carrierPos6 select 0, carrierPos6 select 1, 600], 0];
_wp5 setWaypointStatements ["true", "this flyInHeight 500;"];

_wp6 = _c130group addWaypoint [[carrierPos7 select 0, carrierPos7 select 1, 700], 0];
_wp6 setWaypointStatements ["true", "this flyInHeight 600;"];

_wp7 = _c130group addWaypoint [[carrierPos8 select 0, carrierPos8 select 1, 800], 0];
_wp7 setWaypointStatements ["true", "this flyInHeight 700;"];

_wp8 = _c130group addWaypoint [[carrierPos9 select 0, carrierPos9 select 1, 1000], 0];
_wp8 setWaypointStatements ["true", "this flyInHeight 800;"];

_wp9 = _c130group addWaypoint [[carrierPos10 select 0, carrierPos10 select 1, 1100], 0];
_wp9 setWaypointStatements ["true", "this flyInHeight 900;"];

_wp10 = _c130group addWaypoint [[carrierPos11 select 0, carrierPos11 select 1, 1200], 0];
_wp10 setWaypointStatements ["true", "this flyInHeight 1000;"];

_wp11 = _c130group addWaypoint [[carrierPos12 select 0, carrierPos12 select 1, 1300], 0];
_wp11 setWaypointStatements ["true", "{ deleteVehicle _x }foreach thislist + [vehicle this]"];

[_c130group, 0] setWaypointSpeed "FULL";
[_c130group, 1] setWaypointSpeed "FULL";
[_c130group, 2] setWaypointSpeed "FULL";
[_c130group, 3] setWaypointSpeed "FULL";
[_c130group, 4] setWaypointSpeed "FULL";
[_c130group, 5] setWaypointSpeed "FULL";

leader _c130group animate ["ramp",1];
leader _c130group animate ["door_2_1",1];
leader _c130group animate ["door_2_2",1];
// not sure this works actually

waitUntil {currentWaypoint _c130group > 2};

[_carrier, _c130group] spawn {
	params ["_carrier", "_c130group"];
	_delay = 0.2;
	for "_i" from 0 to 6 do
	{
		_carrier action ['useWeapon', _carrier, leader _c130group, 0];	
		sleep _delay;
		_delay = _delay + 0.1;
	};
};


_crateObj = createVehicle [_crateVeh, [getPos _carrier select 0, getPos _carrier select 1, (getPos _carrier select 2) - 15], [], 0, "NONE"];

_crateObj disableCollisionWith _carrier;
_crateObj allowDamage false;

sleep 0.1;

sleep 1;

// waitUntil { getPosATL _crateObj select 2 < 100 };
_chute = createVehicle [
	_chuteType, 
	[getPos _crateObj select 0, getPos _crateObj select 1, grad_supplydrops_spawnChuteHeight - 5], 
	[], 0, "FLY"
];

_crateObj attachTo [_chute, [0, 0, -0.5]];
waitUntil {
	_crateObj setVelocity [0,0,velocity _crateObj select 2];
	position _crateObj select 2 < 1 || isNull _chute
};
detach _crateObj;
_chute setDamage 1;
// _crateObj setPos [position _crateObj select 0, position _crateObj select 1, 0];
sleep 1;
_crateObj setDamage 0;
_crateObj allowDamage true;

[_crateObj, _crateCode] call grad_supplydrops_fnc_fillInventory;

[getPos _crateObj, _side] remoteExec ["grad_supplydrops_fnc_createDropMarker", 0, true];
[_side] remoteExec ["grad_supplydrops_fnc_showDropHint", 0, true];