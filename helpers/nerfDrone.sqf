/* Disables thermal imaging of drones
*
*/

_vehicle = _this select 0;
if (typeOf _vehicle == "B_UAV_01_F") then {
	_pos = getPos _vehicle;
	sleep 2;
	_vehicle = nearestObject [_pos, "GRAD_B_UAV_01_F"];
	if (!objNull _vehicle) then {
		_vehicle disableTIEquipment true;
		_vehicle setFuel 0.5;
	};
};