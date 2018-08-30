playSound "signal_lost";
if (playerSide == west) then {
	cutRsc ["gui_intel_paper_us_lost","PLAIN",0];
} else {
	cutRsc ["gui_intel_paper_rus_lost","PLAIN",0];
};