// Create Diary Record - HINWEISE -
_c1 = "<font color='#c0c0c0'>";
_c2 = "</font>";
_br ="<br/>";

_stringDaytime = _c1 + "Time of day: " + _c2 + (str TIME_OF_DAY) + ":00";
_stringWeather = _c1 + "Weather: " + _c2 + str (WEATHER_SETTING * 100) + " % Rain";
_stringSpawnDistance = _c1 + "Spawn Distance: " + _c2 + (str BLUFOR_SPAWN_DISTANCE) + " m";
_stringOpforMoney = _c1 + "Money Opfor: " + _c2 + (str OPFOR_MONEY);
_stringBluforMoney = _c1 + "Money Blufor: " + _c2 + (str BLUFOR_MONEY);
_stringSendingTime = _c1 + "Sending Time Radio Truck: " + _c2 + (str (POINTS_NEEDED_FOR_VICTORY/60)) + " min";
_stringTimeAcc = _c1 + "Time Acceleration: " + _c2 + (str TIME_ACCELERATION) + " x";

player createDiaryRecord ["Diary", ["Parameter",
_stringDaytime +
_br + _br + 
_stringWeather + 
_br + _br + 
_stringSpawnDistance + 
_br + _br + 
_stringOpforMoney + 
_br + _br + 
_stringBluforMoney +
_br + _br + 
_stringSendingTime + 
_br + _br + 
_stringTimeAcc
]];

player createDiaryRecord ["Diary", ["Mission","<font size='20' color='#c0c0c0'>Mission</font><br/><br/>" + localize "str_GRAD_briefing_1" + "<br/><br/><br/><font size='20' color='#c0c0c0'>Vehicles</font><br/><br/>" + localize "str_GRAD_briefing_2"]];

player createDiaryRecord ["Diary", ["Story",localize "str_GRAD_story"]];