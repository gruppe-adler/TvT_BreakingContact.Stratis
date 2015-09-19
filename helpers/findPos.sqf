
// aufruf _vec_pos_dir = [position,radius] call get_vec_spawn_point;
// _vec_pos_dir = [(position player),50] call get_vec_spawn_point;


//Init:  If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "funcs.sqf"};



water_check = {
                    private ["_x_k", "_y_k", "_z_k","_is_water"];
					_pos = _this select 0;
					_x_k = _pos select 0;
					_y_k = _pos select 1;
					_z_k = _pos select 2;
					_is_water = 0;
					
					If(!(surfaceiswater [_x_k,_y_k]))then {_is_water = false;}else{_is_water = true;};
					_is_water
			   };



// from warfare
// Returns an average slope value of terrain within passed radius.
// a little bit modified. no need to create a "global" logic, local is enough, etc
// parameters: position, radius
// example: _slope = [the_position, the_radius] call get_slope;
get_slope = {
	private ["_position", "_radius", "_slopeObject", "_centerHeight", "_height", "_direction", "_count"];
	_position = _this select 0;_radius = _this select 1;
	_slopeObject = "Logic" createVehicleLocal _position;
	_slopeObject setPos _position;
	_centerHeight = getPosASL _slopeObject select 2;
	_height = 0;_direction = 0;
	for "_count" from 0 to 7 do {
		_slopeObject setPos [(_position select 0)+((sin _direction)*_radius),(_position select 1)+((cos _direction)*_radius),0];
		_direction = _direction + 45;
		_height = _height + abs (_centerHeight - (getPosASL _slopeObject select 2));
	};
	deleteVehicle _slopeObject;
	_height / 8
};


//from Xeno\modified by Fry					
// get a random point inside a circle for bigger objects
// parameters: "SMALL" = 10m radius, "Normal" = 20m radius, "BIG" = 30m radius, "RBIG" = 50m radius 
// center position, radius of the circle
// example: _random_point = [position trigger1, 200, "NORMAL"] call point_in_circle_big;
point_in_circle_big = {
	private ["_center","_radius","_size","_ret_val","_dist","_co","_angle","_point","_water","_nobs","_slope",
	         "_new_dist","_allow_new_dist","_border"];
	_center = _this select 0;
	_radius = _this select 1;
	_size = If((_this select 2) == "")then{"SPECIAL"}else{_this select 2};
	_new_dist = if(count _this > 3)then{_this select 3}else{5};
	_allow_new_dist = if(count _this > 3)then{true}else{false};
	_ret_val = [];
	_border = false;
	_point = [];
	_dist = 0;
	_co = 0;
        switch (_size) do { case "SMALL":{_dist = 10;};
                            case "NORMAL":{_dist = 20;};
                            case "BIG":{_dist = 30;};
                            case "RBIG":{_dist = 50;};
                            case "MBIG" :{_dist = 100;};
							case "SPECIAL":{_border = true;};
                          };
         if(_allow_new_dist)then{_dist = _new_dist;};						  

         while {count _ret_val == 0 && _co < 50} do 
		 {
		   _angle = floor (random 360);
		   If(_border)then
		   {
		     _point = [_center, _radius,_angle] call BIS_fnc_relPos;
		   }else{_point = [_center,(random _radius),_angle] call BIS_fnc_relPos;};
		   _water = [_point] call water_check;
		   if (!_water)then 
		   { 
             _nobs = nearestObjects [_point,["Static","House","Tank","Car","StaticWeapon","Truck_F"],_dist];
			 _streets = _point nearRoads _dist;
			 _nobs = _nobs + _streets;
             if(count _nobs == 0)then
			 {
			   _slope = [_point, 5] call get_slope;
			   if(_slope < 0.5)then 
			   {
				_ret_val = _point;
			   };
			 };
				
		   };
		   
		   if(count _ret_val == 0)then
		   {
			 _co = _co + 1;
			 sleep .01;
		   };
	    };
	_ret_val
};


// get a random point inside a circle
// parameters:
// center position, radius of the circle
// example: _random_point = [position trigger1, 200] call point_in_circle;
point_in_circle = {
	private ["_center","_radius","_ret_val","_co","_angle","_point","_water","_hard_objs","_slope"];
	_center = _this select 0;
	_radius = _this select 1;	
	_ret_val = [];
	_co = 0;
	while {count _ret_val == 0 && _co < 50} do 
	{
		_angle = floor (random 360);
        _point = [_center,(random _radius),_angle] call BIS_fnc_relPos;
		_water = [_point] call water_check;
		_hard_objs = [_point,5] call hard_check;
		if (!_water && _hard_objs == 0) then 
		{
			_slope = [_point, 5] call get_slope;
			if(_slope < 0.5)then
			{
				_ret_val = _point;
			};
		};
		if (count _ret_val == 0) then {
			_co = _co + 1;
			sleep .01;
		};
	};
	_ret_val
};	


hard_check = {
                private ["_point","_dist","_hard_obj","_output"];
                _point = _this select 0;
				_dist = _this select 1;
				
				_hard_obj = nearestObjects [_point,["Static","house","Tank","Car","StaticWeapon"],_dist];
				_output = (count _hard_obj);
				_output

             };


get_vec_spawn_point = {
                        private ["_pos","_radius","_choice_idx","_output_arr","_dir","_searched_pos","_counter","_dir_pos"];
                        _pos = _this select 0;
						_radius = _this select 1;
						_choice_idx = if(count _this > 2)then{1}else{0};
						_dir_pos = If(count _this > 2)then{_this select 2}else{[]};
						_output_arr = [];
						_searched_pos = [];
						_dir = 0;
						_counter = 0;
						
						_searched_pos = [_pos,_radius,"SMALL"] call point_in_circle_big;
                        while{count _searched_pos == 0 && _counter < 100}do
						{
						  _searched_pos = [_pos,_radius,"SMALL"] call point_in_circle_big;
						  _counter = _counter + 1;
						  sleep 0.04;						
						};
						If(count _searched_pos > 0)then
						{
						   switch(_choice_idx)do
						   {
						     case 0:{_output_arr = [_searched_pos,(random 360)];};
						     case 1:{
							          _dir = [_searched_pos,_dir_pos] call BIS_fnc_dirTo; 
						              _output_arr = [_searched_pos,_dir];
									};
						   };
						   											
						};
						_output_arr
                      };




spawn_help_fnc_compiled = true;
If(spawn_help_fnc_compiled)then{diag_log str "spawnfuncs ready";};