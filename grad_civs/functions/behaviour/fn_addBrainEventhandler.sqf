params ["_unit"];


diag_log format ["adding fired and firedmp eh to %1", _unit];

_unit removeAllEventHandlers "FiredNear";
_unit setVariable ["asr_ai_exclude", true, true];

_unit addEventHandler ["FiredNear",{
	
	params ["_unit", "_shooter", "_distance"];

	_unit setVariable ["GRAD_civs_currentlyThinking", "someones shooting", true];

	_canSeeShooter = [objNull, "VIEW"] checkVisibility [eyePos _unit, eyePos _shooter] == 1;
	_shooterPersons = _unit getVariable ["GRAD_civs_shooterPersons", []];
	_shooterSides = _unit getVariable ["GRAD_civs_shooterSides", []];

	_sideShooter = side _shooter;

	_panic = _unit getVariable ["GRAD_civs_brainPanic", 0];
	if (_panic < 1) then {
		_unit setVariable ["GRAD_civs_brainPanic", _panic + 0.1];
	} else {
		[_unit, _shooter] call GRAD_civs_fnc_fleeYouFool;
	};

	// add side of shooter to enemy sides/persons
	if (_canSeeShooter) then {

		_unit setVariable ["GRAD_civs_currentlyThinking", "i can see the shooter, omg", true];
			
		if (!(side _shooter in _shooterSide)) then {
			_unit setVariable ["GRAD_civs_shooterSide", _shooterSides + [_sideShooter]];
		};

		if (_distance < 25 && !(_shooter in _shooterPersons)) then {
			_unit setVariable ["GRAD_civs_shooterPersons", _shooterPersons + [_shooter]];
		};

		if (_panic < 0.5) then {
			[_unit] spawn GRAD_civs_fnc_stopCiv;
		} else {
			[_unit, _shooter] call GRAD_civs_fnc_fleeYouFool;
		};
		
	} else {

		_unit setVariable ["GRAD_civs_currentlyThinking", "i cant see the shooter but im outta here anyway", true];

		
		if (_panic < 0.5) then {
			[_unit] spawn GRAD_civs_fnc_stopCiv;
		} else {
			[_unit, _shooter] call GRAD_civs_fnc_fleeYouFool;
		};
		
	};	
}];

_unit addMPEventHandler ["MPHit",{
	
	params ["_unit", "_causedBy", "_damage", "_shooter"];

	_canSeeShooter = [objNull, "VIEW"] checkVisibility [eyePos _unit, eyePos _shooter] == 1;
	_hostilePersons = _unit getVariable ["GRAD_civs_hostilePersons", []];
	_shooterSides = _unit getVariable ["GRAD_civs_shooterSides", []];

	_sideShooter = side _shooter;

	_panic = _unit getVariable ["GRAD_civs_brainPanic", 0];
	if (_panic < 1) then {
		_unit setVariable ["GRAD_civs_brainPanic", _panic + 0.4];
	};

	// add side of shooter to enemy sides/persons
	if (_canSeeShooter) then {

		_unit setVariable ["GRAD_civs_currentlyThinking", "i can see the shooter AND HE SHOOTS ME, omg", true];

		if (!(side _shooter in _shooterSide)) then {
			_unit setVariable ["GRAD_civs_shooterSide", _shooterSides + [_sideShooter]];
		};

		if (_unit distance2D _shooter < 25 && !(_shooter in _hostilePersons)) then {
			_unit setVariable ["GRAD_civs_hostilePersons", _hostilePersons + [_shooter]];
		};

		if (_panic < 0.5) then {
			[_unit] spawn GRAD_civs_fnc_stopCiv;
		} else {
			[_unit, _shooter] call GRAD_civs_fnc_fleeYouFool;
		};
	} else {
		_unit setVariable ["GRAD_civs_currentlyThinking", "IM HIT, i cant see the shooter, im outta here, omg", true];

		if (_panic < 0.5) then {
			[_unit] spawn GRAD_civs_fnc_stopCiv;
		} else {
			[_unit, _shooter] call GRAD_civs_fnc_fleeYouFool;
		};
	};
}];