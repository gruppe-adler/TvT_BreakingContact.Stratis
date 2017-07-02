params ["_truck"];

_elements = _truck getVariable ["BC_objectives_truckArmorElements", []];

{
	detach _x;
	deleteVehicle _x;
} forEach _elements;