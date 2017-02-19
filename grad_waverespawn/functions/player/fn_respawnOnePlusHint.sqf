params ["_side"];

if (playerSide == _side) then {
	playSound "waverespawn_bing";
	cutRsc ["gui_waverespawn_oneplus","PLAIN",0];
};