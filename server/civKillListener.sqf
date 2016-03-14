_CIV_KILLED_POS_listener = {
    _pos = _this;
		[{[_pos] execVM "player\civKilledMarker.sqf";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
   };


"CIV_KILLED_POS" addPublicVariableEventhandler _CIV_KILLED_POS_listener;