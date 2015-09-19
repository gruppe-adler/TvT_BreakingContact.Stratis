if (isDedicated) exitWith {};

sleep 5;
[] spawn {
	
	while {!BLUFOR_TELEPORTED} do {
		_bool = false;

		if (side player == west) then {
			for [{_i=0}, {_i<999}, {_i=_i+1}] do
			{ 
				_newstring = "tf_anprc152_" + str _i;
				_bool_tmp = _newstring in (items player + assignedItems player);
				if (_bool_tmp) then {_bool = true;};
			};

			if (!_bool) then {
				hintSilent "Bitte Frequenz überprüfen!";
				player linkItem "tf_anprc152";
				
			};
		};
		

		if (side player == east) then {
			for [{_i=0}, {_i<999}, {_i=_i+1}] do
			{ 
				_newstring = "tf_fadak_" + str _i;
				_bool_tmp = _newstring in (items player + assignedItems player);
				if (_bool_tmp) then {_bool = true;};
			};
			
			if (!_bool) then {
				hintSilent "Bitte Frequenz überprüfen!";
				player linkItem "tf_fadak";
				
			};
		};


		sleep 3;
	};

	if (true) exitWith {};

};