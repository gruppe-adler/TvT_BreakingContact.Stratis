// win conditions, detected by server only

checkForReal = {
	_bool = _this select 0;
	  
	for [{_i=0}, {_i<20}, {_i=_i+1}] do
	{
		if (!_bool) exitWith {};
		sleep 1;
	};
	if (_bool && str _bool == "OPFOR_PRE_ELIMINATED") then {OPFOR_ELIMINATED = true;};	    	
	if (_bool && str _bool == "BLUFOR_PRE_ELIMINATED") then {BLUFOR_ELIMINATED = true;};	    	
};

[] spawn {
    while {true} do {
        OPFOR_PRE_ELIMINATED = (({side _x == east} count playableUnits) + ({side _x == east} count switchableUnits) == 0);
        BLUFOR_PRE_ELIMINATED = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0);

        if (OPFOR_PRE_ELIMINATED) then {[OPFOR_PRE_ELIMINATED] spawn checkForReal;};
        if (BLUFOR_PRE_ELIMINATED) then {[BLUFOR_PRE_ELIMINATED] spawn checkForReal;};

        if (OPFOR_ELIMINATED || BLUFOR_ELIMINATED) exitWith {
            publicVariable "OPFOR_ELIMINATED";
            publicVariable "BLUFOR_ELIMINATED";
        };
        sleep 2;
    };
};
