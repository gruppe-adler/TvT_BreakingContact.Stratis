_CIV_KILLED_POS_listener = {
    _position_killed = _this select 0;

    [[[_position_killed],"player\civKilledMarker.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
	diag_log format ["civ kill listener logs %1",_position_killed];
   };


"CIV_KILLED_POS" addPublicVariableEventhandler _CIV_KILLED_POS_listener;