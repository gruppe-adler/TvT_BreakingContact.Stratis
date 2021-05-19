params ["_positionHelper", "_player", "_tree"];

private _position = _positionHelper getPos [1, (_positionHelper getDir _player)];

private _bbr = boundingBoxReal _tree;
_bbr params ["_p1", "_p2"];
private _heightOfTree = abs ((_p2#2) - (_p1#2));

private _model = if (_heightOfTree < 10) then {
    "Land_vn_o_platform_01"
} else {
      if (_heightOfTree < 15) then {
            "Land_vn_o_platform_02"
      } else {
            "Land_vn_o_platform_03"
      };
};

private _dir = getDir _player;
// private _position = getPos _tree;
_position set [2, 0]; //

private _sniperNest = _model createVehicle [0,0,0];

_sniperNest setDir (_dir - 180);
_sniperNest setPos _position;

_tree setVariable ["BC_vietnam_hasSniperNest", true, true];
