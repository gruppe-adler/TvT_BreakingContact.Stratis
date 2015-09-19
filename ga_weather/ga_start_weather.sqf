//Weather_Version 2.0


private ["_insert"];


_insert = If(count _this > 0)then{_this select 0}else{3};




If(isServer)then{

ga_new_weather = {
                    private ["_weather_idx","_overcast_num","_rain_num","_fog_num","_wind_num","_wind_dir","_wave_num","_change_time","_first_start","_round_timer","_timer","_x_ko","_y_ko"];
                    _weather_idx = _this select 0;

		    _overcast_num = 0;
		    _rain_num = 0;
		    _fog_num = 0;
		    _wind_num = 0;
		    _wind_dir = 0;
                    _wave_num = 0;
                    _change_time = 0;
                    _first_start = true;
                    _round_timer = 0;
                    _timer = 0;
                                                
                    
                     while{!MISSION_COMPLETED}do
                     {
                       	switch(_weather_idx) do
			{
  			  case 0:{               
               			   _overcast_num = (random 1);
                		   If(_overcast_num > 0.3)then{_overcast_num = 0.3;};
                		   _wind_num = (round(random 2));
              			   _wind_dir = (round(random 360));                                   
                                    
				   If(_wind_num > 0)then
				   {
                                    _wave_num = (random 1);
				
                                   }else{_wave_num = 0;};
               			   
              			 };
  			  case 1:{                
               			  _overcast_num = (random 1);
               			  If(_overcast_num < 0.8)then{_overcast_num = 0.8;};
               			  _rain_num = (random 1);
               			  If(_rain_num < 0.6)then{_rain_num = 0.6;};
               			  _fog_num = (random 1);
               			  If(_fog_num > 0)then{
                                                        switch(true)do
                                                        {
                                                          case (_rain_num >= 0.5 && _fog_num > 0.2):{_fog_num = 0.1;};
                                                          case (_rain_num < 0.6 && _fog_num > 0.7):{_fog_num = 0.7;};
                                                          case (_rain_num < 0.6 && _fog_num < 0.3):{_fog_num = 0.3;};
                                                        };
                                                      };
             
              			  _wind_num = (round(random 3));
               			  _wind_dir = (round(random 360));
				  _wave_num = (random 1);

				  If(_wind_num < 2)then{_wind_num = 2;};
                                  If(_wind_num > 0)then
				  {
                                    switch(true)do
                                    {
				      case (_wave_num == 0):{_wave_num = 0.2;};
		                      case (_wave_num > 0 && _wind_num < 3):{_wave_num = 0.6;};
                                      case (_wave_num > 0 && _wind_num > 2):{_wave_num = 0.9;};
                                    }; 
                                  };

					
                      		 };
  			  case 2:{
               
               			   _overcast_num = (random 1);
               			   if(_overcast_num < 0.1)then{_overcast_num = 0.1;};
               			   if(_overcast_num > 0)then{
                                                              switch(true)do
                                                              {
                                                                 case (_overcast_num > 0.9):{_overcast_num = 0.9;};
                                                                 case (_overcast_num < 0.6):{_overcast_num = 0.6;};
                                                              };
                                                            };
               			   _wind_num = (round(random 3));
               			   _wind_dir = (round(random 360));
				   _wave_num = (random 1);

				   If(_wind_num < 1)then{_wind_num = 1;};
                                   If(_wind_num > 0)then
				   {
                                     switch(true)do
                                    {
				      case (_wave_num == 0):{_wave_num = 0.2;};
		                      case (_wave_num > 0 && _wind_num < 3):{_wave_num = 0.6;};
                                      case (_wave_num > 0 && _wind_num > 2):{_wave_num = 0.9;};
                                    }; 
                                   };
              			 };
  			  case 3:{
                 		   _overcast_num = (random 1);
                                   If(_first_start)then{_overcast_num = (random 0.8);};
                
                                   If(_overcast_num >= 0.7)then{
                                                                 _rain_num = (random 1);
                                                                 _fog_num = (random 1);
                                                                 If(_rain_num <=  0.3)then{_rain_num = 0;};					   
                                                                   
                                                    		 switch(true)do
                                                     		 {
                                                       		   case (_rain_num >= 0.6 && _fog_num > 0.1):{_fog_num = 0.1;};
                                                         	   case (_rain_num > 0 && _rain_num < 0.6 && _fog_num > 0.7):{_fog_num = 0.7;};
                                                        	   case (_rain_num > 0 && _rain_num < 0.6 && _fog_num < 0.4):{_fog_num = 0.4;};
                                                                   case (_rain_num < 0.1 && _fog_num < 0.3):{_fog_num = 0.3;};
                                                      		 };
                                                 					
	                                                         _wind_num = (round(random 3));
                                                                 If(_wind_num < 1)then{_wind_num = 1;};
								 _wave_num = (random 1);
                                   				 If(_wind_num > 0)then
				   				 {
                                     				   switch(true)do
                                    				   {
				      				     case (_wave_num == 0):{_wave_num = 0.2;};
		                      				     case (_wave_num > 0 && _wind_num < 3):{_wave_num = 0.6;};
                                      				     case (_wave_num > 0 && _wind_num > 2):{_wave_num = 0.8;};
                                    				   }; 
                                   				 };     
                                                                   
                                                                   
                                                                }else{

                                                                       _rain_num = 0;   
                                                                       _fog_num = (random 1);
                                                                       If(_fog_num > 0.1)then{_fog_num = 0.1;};
                                                                       If(_overcast_num <= 0.5)then{_fog_num = 0;};
                                                                    
                                                                      _wind_num = (round(random 2));
								      _wave_num = (random 1);
                                   				      If(_wave_num > 0)then
				   				      {
                                     				        switch(true)do
                                    				        {
		                      				         case (_wave_num > 0 && _wind_num < 3):{_wave_num = (random 0.6);};
                                      				         case (_wave_num > 0 && _wind_num > 2):{_wave_num = (random 0.9);};
                                    				        }; 
                                   				      }else{_wave_num = 0.2;};     
                                                                      
                                                                     };   
                                   If(_wind_num > 0)then{_wind_dir = (round(random 360));};      

                                 };
                       };                      

                       PV_GA_Weather_jip = [_overcast_num,_rain_num,_fog_num,_wave_num];
					   publicVariable "PV_GA_Weather_jip";
                       
                       If(_first_start && isMultiplayer)then{[_overcast_num,_rain_num,_fog_num,_wave_num] spawn ga_jip_weather;}; 
                       _change_time = (round(random 900));
                       If(_change_time < 600)then{_change_time = 600;};
                       If(timeMultiplier > 1)then{_change_time = (round(_change_time * (timeMultiplier)));};
                       If(!_first_start)then{[_change_time,_overcast_num,_rain_num,_fog_num,_wave_num] spawn ga_change_weather;};
                       _first_start = false;
                       If(_wind_num > 0)then{
                                              _x_ko = _wind_num;
                                              _y_ko = _wind_num;

                                              switch(true)do
                                              {
                                                case (_wind_dir > 337 || _wind_dir <= 23):{_x_ko = 0;};
						case (_wind_dir > 23 && _wind_dir <= 68):{};
						case (_wind_dir > 68 && _wind_dir <= 113):{_y_ko = 0;};
						case (_wind_dir > 113 && _wind_dir <= 158):{_y_ko = _y_ko * -1;};
						case (_wind_dir > 158 && _wind_dir <= 203):{_x_ko = 0;_y_ko = _y_ko * -1;};
						case (_wind_dir > 203 && _wind_dir <= 248):{_x_ko = _x_ko * -1;_y_ko = _y_ko * -1;};
						case (_wind_dir > 248 && _wind_dir <= 293):{_x_ko = _x_ko * -1;_y_ko = 0;};
						case (_wind_dir > 293 && _wind_dir <= 337):{_x_ko = _x_ko * -1;};        
   					      };
						
						setWind [_x_ko,_y_ko, true];
                                             
                                            }else{
                                                  setWind [_wind_num,_wind_num, true];  
                                                 };

                       If(isMultiplayer)then{
                                             PV_ga_weather_data = [_change_time,_overcast_num,_rain_num,_fog_num,_wave_num];
                                             publicVariable "PV_ga_weather_data";
                                            };

                       [_change_time,_fog_num] spawn {
                                                       private ["_change_time","_fog_num"];
                                                       _timer = time + (round((_this select 0) * 0.5));
                                                       _fog_num = _this select 1;
                                                       
						       waitUntil{time > _timer}; 

                                                       switch (true) do
                      				       {
  			                                 case (_fog_num > 0 && _fog_num < 0.1):{setviewdistance 2000;};
  			                                 case (_fog_num >= 0.1 && _fog_num < 0.2):{setviewdistance 1100;};
  			                                 case (_fog_num >= 0.2 && _fog_num < 0.3):{setviewdistance 900;};
  			                                 case (_fog_num >= 0.3 && _fog_num < 0.4):{setviewdistance 550;};
  			                                 case (_fog_num >= 0.4 && _fog_num < 0.5):{setviewdistance 400;};
  			                                 case (_fog_num >= 0.5 && _fog_num < 0.6):{setviewdistance 350;};
  			                                 case (_fog_num >= 0.6 && _fog_num < 0.7):{setviewdistance 250;};
  			                                 case (_fog_num >= 0.7 && _fog_num < 0.8):{setviewdistance 230;};
  			                                 case (_fog_num >= 0.8 && _fog_num <= 1):{setviewdistance 205;};
		                                       };

                                                     };


                      _round_timer = (round(random 2700));
                      If(_round_timer < 1800)then{_round_timer = 1800;};
                      _timer = time + _round_timer;                      
                   
                      waitUntil{time > _timer};
                       

                     };

                 };


};

ga_jip_weather = {
                    private ["_overcast_num","_rain_num","_fog_num","_wave_num"];

                    _overcast_num = _this select 0;
                    _rain_num = _this select 1;
                    _fog_num = _this select 2;
                    _wave_num = _this select 3;
                    

                    skipTime -24; 
                    86400 setOvercast _overcast_num;skipTime 24;
                    sleep 0.1; 
                    simulWeatherSync;
                 
                    0 setRain _rain_num;
                    0 setFog [_fog_num,0.01,0];                   
                    0 setWaves _wave_num;
       
                    

                 };

ga_change_weather = { 
		      private ["_change_time","_overcast_num","_rain_num","_fog_num","_wave_num"];

                      _change_time = _this select 0;
                      _overcast_num = _this select 1;
                      _rain_num = _this select 2;
                      _fog_num = _this select 3;
                      _wave_num = _this select 4;
                      

                      switch(true)do
                      {
                        case (overcast < 0.6 && _rain_num > 0 && _overcast_num >= 0.6):{
                                                                                         [_change_time,_rain_num] spawn {
                                                                                                                          waitUntil{overcast >= 0.6};
															  (_this select 0) setRain (_this select 1);
                                                                                                                        };
                                                                                       };
                        case (overcast >= 0.6 && _rain_num < rain && _overcast_num < 0.6):{(_change_time - 60) setRain _rain_num;}; 
                        case (overcast >= 0.6 && _overcast_num >= 0.6):{_change_time setRain _rain_num;};                       
                      };                      
                      
                      _change_time setWaves _wave_num; 
                      _change_time setOvercast _overcast_num;
                      _change_time setFog [_fog_num,0.01,0];
                      
                    };




If(isServer)then
{
  waitUntil{!isNil "MISSION_COMPLETED"};
  [_insert] spawn ga_new_weather; 

};
        
If(local player && isNil "ga_weather_activated")then{

        If(isNil "PV_GA_Weather_jip")then{waitUntil{!isNil "PV_GA_Weather_jip"};};
        If(count (PV_GA_Weather_jip) > 0)then
        {
           PV_GA_Weather_jip spawn ga_jip_weather;                
        };
      
	        sleep 5;	
		"PV_ga_weather_data" addPublicVariableEventHandler {(_this select 1) spawn ga_change_weather;};

ga_weather_activated = true;
};
