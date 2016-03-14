_CIV_KILL_POS_listener = {
    _pos = _this select 0;
		[{[_pos] execVM "player\civKilledMarker.sqf";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
   };


"CIV_KILL_POS" addPublicVariableEventhandler _CIV_KILL_POS_listener;