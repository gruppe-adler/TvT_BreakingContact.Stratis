["GRAD_civs_thoughtDebugger", "onEachFrame", {
	_color = [1,1,1,0.9];

	{	
		
		_text = driver _x getVariable ["GRAD_civs_currentlyThinking", "no special purpose"];

		_number = count (driver _x getVariable ["GRAD_civs_isPointedAtBy",[]]);
		_panic = driver _x getVariable ["GRAD_civs_brainPanic",0];
		_stop = driver _x getVariable ["GRAD_civs_brainStop",0];
					
		drawIcon3D [
			"#(argb,8,8,3)color(0,0,0,0)", 
			_color, [(getPos _x select 0), (getPos _x select 1), (getPos _x select 2) + 2],
			1, 1, 0, _text + " | guns on me: " + str _number + " | panic: " + str _panic + " | stopping for: " + str _stop, 1, 0.02, "EtelkaNarrowMediumPro", "center", true
		];

	}forEach (allUnits - playableUnits - switchableUnits);

},[]] call BIS_fnc_addStackedEventHandler;