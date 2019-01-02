params [
    "_increase", 
    "_ctrlCrewCount", 
    "_ctrlCargoCount", 
    "_ctrlTotalSideCount",
    "_crewCount",
    "_cargoCount",
    "_valueTotalSideCount"
];

private _valueCrewCount = missionNamespace getVariable ["BC_buymenu_valueCrewCount", 0];
private _valueCargoCount = missionNamespace getVariable ["BC_buymenu_valueCargoCount", 0];

private _formatting = "<t size='1.5' align='center' color='#66aa66'>";
private _formattingNotReached = "<t size='1.5' align='center' color='#D18D1F'>";

if (_increase) then {
    _valueCrewCount = _valueCrewCount + _crewCount;
    _valueCargoCount = _valueCargoCount + _cargoCount;
} else {
    _valueCrewCount = _valueCrewCount - _crewCount;
    _valueCargoCount = _valueCargoCount - _cargoCount;
};

if ((_valueCrewCount + _valueCargoCount) < _valueTotalSideCount) then {
    _formatting = _formattingNotReached;
};

missionNamespace setVariable ["BC_buymenu_valueCrewCount", _valueCrewCount];
missionNamespace setVariable ["BC_buymenu_valueCargoCount", _valueCargoCount];

_ctrlCrewCount ctrlSetStructuredText parseText (_formatting + str _valueCrewCount + " </t><br/><t size='0.5' align='center' color='#666666'>Crew" + "</t>");
_ctrlCargoCount ctrlSetStructuredText parseText (_formatting + str _valueCargoCount + " </t><br/><t size='0.5' align='center' color='#666666'>Cargo" + "</t>");

_ctrlCrewCount ctrlCommit 0;
_ctrlCargoCount ctrlCommit 0;