params ["_vehicle"];

_vehicle addEventHandler ["Local", {
	params ["_entity", "_isLocal"];

	if (_isLocal) then {
		private _terminal = missionNameSpace getVariable ["GRAD_tracking_terminalObj", objNull];
		[_entity, _terminal] remoteExecCall ["disableCollisionWith", 0, _entity];
		[_entity, _terminal] remoteExecCall ["disableCollisionWith", 0, _terminal];
	};
}];