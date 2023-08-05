params ["_pilotName", "_gunnerName", "_planeTyp", "_removeWeapons", "_removeMagazines", "_addWeapon"];

//calculate the x and y differentce
BLUFOR_TELEPORT_TARGET params ["_initX", "_initY"];
OPFOR_TELEPORT_TARGET params ["_spawnOpforPosX", "_spawnOpforPosY"];

private _dX = _spawnOpforPosX - _initX;
private _dY = _spawnOpforPosY - _initY;

//get angle between markers and add 180
private _ang = _dX atan2 _dY;
_ang = _ang + 180;

//fix angle if <0 or >360
_ang = _ang mod 360;

//find new coords
private _newX = _initX + sin(_ang)*2000;
private _newY = _initY + cos(_ang)*2000;

private _rand = random [200,500,1000];
if (_newX > _newY) then {
	_newX = 0;
	_newY = _newY + _rand;
}else{
	_newX = _newX + _rand;
	_newY = 0;
};

private _newcoords = [ _newX, _newY, 500];

// Get pilot & gunner from name
private _pilot = [_pilotName] call BC_ww2_fnc_getPlayerByName;
private _gunner = [_gunnerName] call BC_ww2_fnc_getPlayerByName;

// Create & setup plane, teleport pilot & gunner to plane
if (!isNil "_pilot") then {
	private _plane = createVehicle [_planeTyp, [0, 0, 1000], [], 0, "FLY"];
	_plane setPos _newcoords;
	private _dir = (_plane getDir OPFOR_TELEPORT_TARGET);
    private _velocity = velocity _plane;
    _plane setDir _dir;
    _plane setVelocity [
        ((_velocity select 1) * sin _dir - (_velocity select 0) * cos _dir),
        ((_velocity select 0) * sin _dir + (_velocity select 1) * cos _dir),
        (_velocity select 2)];
	_plane engineOn true;
	_pilot allowDamage false;

	[_plane, _removeMagazines] call BC_ww2_fnc_removeMagazines;

	[_pilot, _plane] remoteExecCall ["BC_ww2_fnc_moveInPilot", _pilot];

	{
		_plane removeWeapon _x;
	} forEach _removeWeapons;

	[_plane, _addWeapon] call BC_ww2_fnc_addWeapon;

	if (!isNil "_gunner" && {!isNull _gunner} && {_gunner isNotEqualTo _pilot}) then {
		[_gunner, _plane] remoteExecCall ["BC_ww2_fnc_moveInGunner", _gunner];
	};
};