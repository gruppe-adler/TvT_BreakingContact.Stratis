["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
[true] call ace_spectator_fnc_setSpectator;
sleep 2;

[] spawn  {
	while {true} do {

	_mode = missionNamespace getVariable [VAR_CAMERA_MODE, MODE_FREE];
	_camera = ["GetCamera"] call CAM;
		switch (true) do
		{
			case (_mode == MODE_FREE) : { 
				_camera camCommand "inertia on";
			};
			default {};
		};
	sleep 1;
	};
};