params ["_increase", "_ctrlCrewCount", "_ctrlCargoCount", "_crewCount", "_cargoCount"];

private _valueCrewCount = missionNamespace getVariable ["BC_buymenu_valueCrewCount", 0];
private _valueCargoCount = missionNamespace getVariable ["BC_buymenu_valueCargoCount", 0];


if (_increase) then {
    _valueCrewCount = _valueCrewCount + _crewCount;
    _valueCargoCount = _valueCargoCount + _cargoCount;
} else {
    _valueCrewCount = _valueCrewCount - _crewCount;
    _valueCargoCount = _valueCargoCount - _cargoCount;
};

missionNamespace setVariable ["BC_buymenu_valueCrewCount", _valueCrewCount];
missionNamespace setVariable ["BC_buymenu_valueCargoCount", _valueCargoCount];

_ctrlCrewCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' color='#999999'>" + str _valueCrewCount + " </t><br/><t size='0.5' align='center' color='#666666'>Cargo" + "</t>");
_ctrlCargoCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' color='#999999'>" + str _valueCargoCount + " </t><br/><t size='0.5' align='center' color='#666666'>Cargo" + "</t>");

_ctrlCrewCount ctrlCommit 0;
_ctrlCargoCount ctrlCommit 0;