assembleAssaultBoat = {
_crate = _this select 0;
_pos = getPos _crate;
deleteVehicle _crate;

_boat = createVehicle ["B_Boat_Transport_01_F", _pos, [], 0, "NONE"];
[[_boat, true, [0,1.4,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
};
