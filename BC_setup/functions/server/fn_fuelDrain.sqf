[{
    {
        private _fuel = fuel _x;
        if (_fuel > 0 && (((getPosATL _x) select 2) > 1) && isEngineOn _x) then {
            _x setFuel (_fuel -0.001);
        };
    }forEach BC_helos;
},1,[]] call CBA_fnc_addPerFrameHandler;
