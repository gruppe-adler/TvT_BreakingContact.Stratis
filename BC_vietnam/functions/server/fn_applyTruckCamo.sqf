params ["_vehicle"];

private _armor = [
    ["Land_vn_o_wallfoliage_01",[-1.38867,-1.93555,-2.45603],[[0,1,0],[0,0,1]],1],
    ["Land_vn_o_shelter_04",[0.0478516,-0.49414,-0.286807],[[0.999188,0.0402952,0],[0,0,1]],1],
    ["Land_vn_o_wallfoliage_01",[1.11328,-1.90332,-2.34183],[[0,1,0],[0,0,1]],1],
    ["Land_vn_b_calochlaena_f",[-0.0244141,0.850586,-0.029686],[[0,1,0],[0,0,1]],1],
    ["Land_vn_o_wallfoliage_01",[-0.0654297,-4.22051,-2.34183],[[-0.999642,-0.0267521,0],[0,0,1]],0.6]
];


{
  _x params ["_type", "_offset", "_vectorDirAndUp", "_scale"];

  private _piece = _type createVehicle [0,0,0];
  _piece attachTo [_vehicle, _offset];
  _piece setVectorDirAndUp _vectorDirAndUp;
  _piece setObjectScale _scale;

} forEach _armor;