// original script by austin_medic, pimped by nomisum for Gruppe Adler
////// SETUP
recording_speed = 1;
// replace with false if you want the replay to never stop, otherwise enter a boolean of your choice
replay_end_condition = MISSION_COMPLETED;

////// DONT CHANGE ANYTHING BELOW
local_recording = [];
single_current_values = [];
all_current_values = [];
current_unit = [];
current_daytime = 0;

if (!isMultiplayer) then {
	players = switchableUnits;
	} else {
	players = playableUnits;
};

//hint "movement initialized";
while{!replay_end_condition} do
{


	{	_unit = _x;
		_veh = vehicle _unit;
		_pos = getpos _unit;
		_side = side (group _unit);
		_side_prefix = "";
		if (current_daytime == 0) then {
		current_daytime = daytime;
		};
		if (_side == west) then { _side_prefix = "b_";};
		if (_side == east) then { _side_prefix = "o_";};
		if (_side == independent) then { _side_prefix = "n_";};
		if (_side == civilian) then { _side_prefix = "c_";};
		_kindof = _side_prefix + "motor_inf";
		_dir = (getDir _unit);


		
		if(vehicle _unit == _unit) then 
		{
			_kindof =  "mil_triangle";
		};
		if(vehicle _unit isKindOf "Car") then 
		{
			_kindof =  _side_prefix + "motor_inf";
		};
		if(vehicle _unit isKindOf "Plane") then 
		{
			_kindof =  _side_prefix + "plane";
		};
		if(vehicle _unit isKindOf "Helicopter") then 
		{
			_kindof =  _side_prefix + "air";
		};
		if((vehicle _unit isKindOf "Tank") && (_side != civilian)) then 
		{
			_kindof =  _side_prefix + "armor";
		};
		if(vehicle _unit isKindOf "Ship") then 
		{	
			if (side _unit == civilian) then {
			 _kindof =  _side_prefix + "ship";
			} else {
			_kindof =  _side_prefix + "naval";
			};
		};
		if(vehicle _unit isKindOf "StaticMortar") then 
		{
			_kindof =  _side_prefix + "mortar";
		};

		if (_unit getVariable ["AGM_isUnconscious", false]) then {
			_kindof = "loc_Hospital";
		};
		if(!alive _unit) then {
			_kindof = "KIA";
		};


		// current values: position, side, kindof
		single_current_values = [_unit,_side,_pos,_dir,_kindof,_veh];
		//diag_log format ["%1",single_current_values];
		// prevent markers to render double on the same position (e.g. full team in vehicle)
		if (!(_pos in all_current_values) && !(_veh in all_current_values)) then {
			
		all_current_values = all_current_values + [single_current_values];
		};
		
	} forEach players;
	local_recording = local_recording + [[current_daytime,all_current_values]];
	all_current_values = [];

	
	sleep recording_speed;

	//reset all current values
	current_daytime = 0;
};