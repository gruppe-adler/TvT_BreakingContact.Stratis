assembleAssaultBoat = {
_crate = _this select 0;	
_pos = getPos _crate;
deleteVehicle _crate;

_boat = createVehicle ["B_Boat_Transport_01_F", _pos, [], 0, "NONE"];
// [_boat, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;
};