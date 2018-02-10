private _boat = player getVariable ["GRAD_carryBoat_boatObj", objNull];
if (isNull _boat) exitWith {};

private _offset = _boat getVariable ["GRAD_carryBoat_attachPosition", [0, 4.5, 1.5]];

_offset params ["_carryAttachX", "_carryAttachY", "_carryAttachH"];

// min and max height player can carry boat on
private _min = 1;
private _max = 2;

if ((_this select 1) > 1 && (_carryAttachH < _max)) then {
  _carryAttachH = _carryAttachH + 0.1;
  addCamShake [4, 1, 2];
};
if ((_this select 1) < -1 && (_carryAttachH > _min)) then {
  _carryAttachH = _carryAttachH - 0.1;
  addCamShake [4, 1, 2];
};

_boat attachTo [player,[_carryAttachX, _carryAttachY, _carryAttachH]];
_boat setVariable ["GRAD_carryBoat_attachPosition", [_carryAttachX, _carryAttachY, _carryAttachH]];