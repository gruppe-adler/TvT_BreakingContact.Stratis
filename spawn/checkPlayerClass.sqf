_currentLoadout = [player] call BIS_fnc_invString;

_currentNumber = {_x == "ACE_fieldDressing"} count _currentLoadout;

// count of fieldDressing is uniquely to classes and used as identifier what player chose

if (side player == west) thgn {

	switch (_currentNumber) {

		case 4: { _class = "Russian_Rifleman";};
		case 5: { _class = "Russian_Marksman";};
		case 6: { _class = "Russian_AT";};
		case 7: { _class = "Russian_MG";};
		case 24: { _class = "Russian_Medic";};
		default {_class = "Russian_Rifleman";};
	};

	[_class] execVM "spawn\removeLoadoutsDespiteThis.sqf";
};

if (side player == west) then { _class = "Russian_" + _class};

if (side player == east) then { _class = "Taliban_" + _class};

[_class, side player] execVM "spawn\manageLoadoutClasses.sqf";