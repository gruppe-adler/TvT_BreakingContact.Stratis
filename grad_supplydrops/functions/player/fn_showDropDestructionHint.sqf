params ["_side"];

if (playerSide != _side) exitWith {};

playSound "signal_lost";
cutRsc ["gui_intel_paper_supplydrop_destroyed","PLAIN",0];