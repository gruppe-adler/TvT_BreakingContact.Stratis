sleep 3;

_winningSide = (_this select 0);

if (_winningSide == opfor) then {
	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
};

if (_winningSide == blufor) then {
	["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
};

sleep 3;

["end1", playerSide == _winningSide] call BIS_fnc_endMission; // TODO have nice endings