/* Disabled thermal imaging of drones
*
*/

_vehicle = _this select 0;
if (typeOf _vehicle == "B_UAV_01_F") then {
	_vehicle disableTIEquipment true;
	_vehicle setFuel 0.5;
};
