/*
    Breaking Contact

    Author: joko // Jonas

    Description:
    Register Streamator Search Target and Defining Icons to Draw

    Parameter(s):
    None

    Returns:
    None
*/

// Register Radio Vehicle as a Custom Search Target
["Radio Vehicle", GRAD_tracking_radioVehObj, 15, 5] call Streamator_fnc_addSearchTarget;

// Macros for UI calclulations
#define PYN 108
#define PX(X) ((X)/PYN*safeZoneH/(4/3))
#define PY(Y) ((Y)/PYN*safeZoneH)

// Add Icon Renderer over Radio vehicle
private _position = [GRAD_tracking_radioVehObj, "", [0, 0, 5]];
private _color = [0.93, 0.7, 0.01, 0.6];

private _icons = [];
private _shadow = 0;

private _id = format ["BC_setup_ID_%1", GRAD_tracking_radioVehObj];
private _fncScaleIcon = {
    if (isNull GRAD_tracking_radioVehObj) exitWith { false };
    private _distance = (positionCameraToWorld [0, 0, 0]) distance getPos (_position select 0);
    private _size = (((500 / _distance) ^ 0.8) min 1) max 0.4;

    _width = _size * _width;
    _height = _size * _height;
    _textSize = [
        [
            [_textSize, PY(2)] select (_size < 0.8),
            PY(1.8)
        ] select (_size < 0.6),
        PY(1.5)
    ] select (_size < 0.4);
    private _isTransmitting = [GRAD_tracking_radioVehObj] call GRAD_tracking_fnc_radioVehIsSending;
    if (_isTransmitting) then {
        switch (true) do {
            case (_shadow == 2): {
                _color = [0.6, 0, 0, 1];
            };
            case (_texture == "A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_0_ca.paa"): {
                _texture = format ["A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_%1_ca.paa", floor(time) % 5];
            };
            default {
                private _ticksRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;
                _text = format ["%1%4 | Done: %2/%3", floor(_ticksRatio*100), GRAD_TICKS_DONE,GRAD_TICKS_NEEDED, "%."];
            };
        };
    };
};

_icons pushBack ["ICON", "A3\ui_f\data\gui\rsc\rscdisplaymultiplayersetup\flag_opfor_empty_ca.paa", [1, 1, 1, 1], _position, 70 / 18, 35 / 18, 0, "", 0, 0.05, "RobotoCondensedBold", "center", false, _fncScaleIcon];
_icons pushBack ["ICON", "A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_0_ca.paa", [1, 1, 1, 1], _position, 1*2, 1, 0, "", 0, 0.05, "RobotoCondensedBold", "center", false, _fncScaleIcon];
_shadow = 2;
_color set [3, 1];
_icons pushBack ["ICON", "A3\ui_f\data\gui\rsc\rscdisplaymultiplayersetup\flag_opfor_ca.paa", _color, _position, 70 / 18, 35 / 18, 0, "", _shadow, PY(2), "RobotoCondensedBold", "center", false, _fncScaleIcon];
reverse _icons;

[
    _id,
    +_icons
] call Streamator_fnc_addCustom3dIcon;


// Add Icon Renderer over Terminal
private _position = [objNull, "", [0, 0, 5]];
private _color = [0.93, 0.7, 0.01, 0.6];

private _icons = [];
private _shadow = 0;

private _id = "BC_setup_ID_Terminal";
private _fncScaleIcon = {
    private _termial = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
    if (isNull _termial) exitWith { false }; // exit if Terminal Object does not exists
    _position set [0, _termial];
    private _distance = (positionCameraToWorld [0, 0, 0]) distance getPos (_position select 0);
    private _size = (((500 / _distance) ^ 0.8) min 1) max 0.4;

    _width = _size * _width;
    _height = _size * _height;
    _textSize = [
        [
            [_textSize, PY(2)] select (_size < 0.8),
            PY(1.8)
        ] select (_size < 0.6),
        PY(1.5)
    ] select (_size < 0.4);
    private _isTransmitting = call GRAD_tracking_fnc_terminalIsSending;
    if (_isTransmitting) then {
        switch (true) do {
            case (_shadow == 2): {
                _color = [0.6, 0, 0, 1];
            };
            case (_texture == "A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_0_ca.paa"): {
                _texture = format ["A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_%1_ca.paa", floor(time) % 5];
            };
            default {
                _text = format ["%1%2 strength", GRAD_TERMINAL_DISTANCE, "%"];
            };
        };
    };
    GRAD_TERMINAL;
};

_icons pushBack ["ICON", "A3\ui_f\data\gui\rsc\rscdisplaymultiplayersetup\flag_opfor_empty_ca.paa", [1, 1, 1, 1], _position, 70 / 18, 35 / 18, 0, "", 0, 0.05, "RobotoCondensedBold", "center", false, _fncScaleIcon];
_icons pushBack ["ICON", "A3\ui_f\data\igui\rsctitles\rschvtphase\JAC_A3_Signal_0_ca.paa", [1, 1, 1, 1], _position, 1*2, 1, 0, "", 0, 0.05, "RobotoCondensedBold", "center", false, _fncScaleIcon];
_shadow = 2;
_color set [3, 1];
_icons pushBack ["ICON", "A3\ui_f\data\gui\rsc\rscdisplaymultiplayersetup\flag_opfor_ca.paa", _color, _position, 70 / 18, 35 / 18, 0, "", _shadow, PY(2), "RobotoCondensedBold", "center", false, _fncScaleIcon];
reverse _icons;

[
    _id,
    +_icons
] call Streamator_fnc_addCustom3dIcon;
