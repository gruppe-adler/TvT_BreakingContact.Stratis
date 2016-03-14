_CIV_KILLED_POS_listener = {
    _pos = _this select 0;

    [[[_pos],"player\civKilledMarker.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
		
   };


"CIV_KILLED_POS" addPublicVariableEventhandler _CIV_KILLED_POS_listener;