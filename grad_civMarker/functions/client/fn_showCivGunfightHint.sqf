playSound "signal_lost";
cutRsc ["gui_intel_paper_civ_gunfight","PLAIN",0];

player setVariable ["GunfightTimeout",true];
sleep 7;
player setVariable ["GunfightTimeout",false];
