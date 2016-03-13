private ["_object","_sPos","_tPos","_bullet","_bPos","_heading","_velocity"];

_object = _this select 0; // In this case a named object but can be determined via nearestBuilding or other similar methods.
_side = _this select 1;

_sPosR = _object selectionPosition "Light_R"; // The selection position of the center of the main light in model space.
_sPosL = _object selectionPosition "Light_L";
if (_side == "left") then {
_tPos = _object modelToWorld _sPosR;  // The center of the main light in world space.
} else {
_tPos = _object modelToWorld _sPosR;  
};

//Run a loop that creates a .50cal bullets and directs it to hit the light

_bullet = "B_127x99_Ball" createVehicle _tPos;
_bPos = getPosASL _bullet; 
_heading = [_bPos,_tPos] call BIS_fnc_vectorFromXToY; 
_velocity = [_heading, 1000] call BIS_fnc_vectorMultiply; 
_bullet setVectorDir _heading; 
_bullet setVelocity _velocity;