params ["_vehicle"];

{
    private _type = _x select 0;
    private _offset = _x select 1;
    private _vectorDirAndUp = _x select 2;
    private _dummy = _type createVehicle [0,0,0];

    _dummy attachTo [_vehicle, _offset];
    _dummy setVectorDirAndUp _vectorDirAndUp;
} forEach [
    ["OmniDirectionalAntenna_01_sand_F",[-0.0223389,0.429688,2.95189],[[0,1,0],[0,0,1]]],
    ["Land_V3S_wreck_F",[-0.501587,-1.62744,-0.1276],[[0,1,0],[0,0,1]]]
];