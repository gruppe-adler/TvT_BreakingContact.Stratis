_percent = _this select 0;


showRadioBoxDistanceChangedHint = {	
	hintSilent parseText format["<t size='1.25' color='#ff0000'>Signal strength to relay is now %1  %.</t>", (_this select 0)];
};

[_percent] call showRadioBoxDistanceChangedHint;