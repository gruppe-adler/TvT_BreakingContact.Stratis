END_MISSION_TRIGGERED = true; publicVariable "END_MISSION_TRIGGERED";

if ((_this select 0) == opfor) then {
 ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
      sleep 3;
};

if ((_this select 0) == blufor) then {
 ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
      sleep 3;
};

[[[localize "str_GRAD_winmsg" + ".","all"],"mp_helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
sleep 1;
[[[localize "str_GRAD_winmsg" + "..","all"],"mp_helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
sleep 1;
[[[localize "str_GRAD_winmsg" + "...","all"],"mp_helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;