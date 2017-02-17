params ["_obj"];

_obj addMPEventHandler ["MPKilled", {
		_this = _this select 0;
		
	if (isServer) then {
		if (GRAD_INTERVALS_NEEDED > 0) then {
			GRAD_INTERVALS_NEEDED = GRAD_INTERVALS_NEEDED - 1;
			publicVariable "GRAD_INTERVALS_NEEDED";
		};
	};
}];