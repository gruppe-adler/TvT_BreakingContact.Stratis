params ["_perc"];

_green = "<t size='2' color='#48c617'>%1 %%</t>";
_yellow = "<t size='2' color='#e9c138'>%1 %%</t>";
_red = "<t size='2' color='#c62317'>%1 %%</t>";

_result = '#ffffff';

if (_perc > 90) then { _result = _green; };
if (_perc <= 90) then { _result = _yellow; };
if (_perc <= 70) then { _result = _red; };

_string = "<t size='1.25' 'color='#ff0000'>%1</t>";

hintSilent parseText format[
	"<t size='1.25'>" + (localize "str_GRAD_radio_signalstrength") + "</t><br/>" + 
	_result + "<t size='1.25'> percent.</t>", _perc];