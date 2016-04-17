// win conditions, detected by server only
if (!isServer) exitWith {};

checkForReal = {
	_varName = _this select 0;
	_bool = call compile (_this select 0);

	for [{_i=0}, {_i<20}, {_i=_i+1}] do
	{
		if (!_bool) exitWith {};
		sleep 0.5;
	};
	if (_bool && _varName == "OPFOR_PRE_ELIMINATED") then {OPFOR_ELIMINATED = true;};
	if (_bool && _varName == "BLUFOR_PRE_ELIMINATED") then {BLUFOR_ELIMINATED = true;};
};

[] spawn {
    while {true} do {
        OPFOR_PRE_ELIMINATED = (({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0);
        BLUFOR_PRE_ELIMINATED = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0);

		if (RADIO_BOX_DESTROYED) exitWith { [] call bluforCaptured; };

        if (OPFOR_PRE_ELIMINATED) then {["OPFOR_PRE_ELIMINATED"] spawn checkForReal;};
        if (BLUFOR_PRE_ELIMINATED) then {["BLUFOR_PRE_ELIMINATED"] spawn checkForReal;};

        if (OPFOR_ELIMINATED || BLUFOR_ELIMINATED) exitWith {
            publicVariable "OPFOR_ELIMINATED";
            publicVariable "BLUFOR_ELIMINATED";
        };
        sleep 11;
    };
};
