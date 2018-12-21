private _screenWidth = safeZoneW;
private _screenHeight = safeZoneH;

private _columnWidth = _screenWidth/21;
private _rowHeight = _screenHeight/40;

disableSerialization;

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";

private _background = _display ctrlCreate ["RscText", -1];
_background ctrlSetPosition [safezoneX, safeZoneY, _screenWidth, _screenHeight];
_background ctrlSetBackgroundColor [0,0,0,1];
_background ctrlCommit 0;

{
    private _multiplicator = _x;
    private _column = _display ctrlCreate ["RscText", -1];
    _column ctrlSetPosition [
        _columnWidth * _multiplicator + safezoneX + _columnWidth,
        _rowHeight + safezoneY,
        _columnWidth * 4,
        _screenHeight + safezoneY
    ];
    _column ctrlSetBackgroundColor [1,1,1,0];
    _column ctrlCommit 0;

    private _headline = _display ctrlCreate ["RscStructuredText", -1];
    _headline ctrlsetFont "RobotoCondensedBold";
    _headline ctrlSetBackgroundColor [0,0,0,1];
    _headline ctrlSetTextColor [1,1,1,1];
    _headline ctrlSetStructuredText parseText "<t size='2' align='center' color='#666666'>LOGISTICS</t>";
    _headline ctrlSetPosition [
        _columnWidth * _multiplicator + safezoneX + _columnWidth, 
        _rowHeight * 4 + safezoneY, 
        _columnWidth * 4,
        _rowHeight * 2.5 
    ];
    _headline ctrlCommit 0;

    private _chosenCount = _display ctrlCreate ["RscStructuredText", -1];
    _chosenCount ctrlsetFont "RobotoCondensedBold";
    _chosenCount ctrlSetBackgroundColor [0,0,0,1];
    _chosenCount ctrlSetTextColor [1,1,1,1];
    _chosenCount ctrlSetStructuredText parseText "<t size='1' align='center' color='#333'>0/3</t>";
    _chosenCount ctrlSetPosition [
        _columnWidth * _multiplicator + safezoneX + _columnWidth, 
        _rowHeight * 6 + safezoneY, 
        _columnWidth * 4,
        _rowHeight * 2.5 
    ];
    _chosenCount ctrlCommit 0;



    for "_i" from 1 to 3 do {

        private _count = _display ctrlCreate ["RscStructuredText", -1];
        _count ctrlsetFont "RobotoCondensedBold";
        _count ctrlSetBackgroundColor [0,0,0,1];
        _count ctrlSetStructuredText parseText "<t size='2' align='center' shadow='0' color='#999999'>0</t>";
        _count ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth,
             (_i * (_rowHeight * 8) + safezoneY) + _rowHeight * 2,
            _columnWidth/2,
            _rowHeight * 6
        ];
        _count ctrlCommit 0;


        private _picture = _display ctrlCreate ["RscPicture", -1];
        _picture ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth + _columnWidth/2, 
            (_i * (_rowHeight * 8) + safezoneY), 
            _columnWidth * 3, 
            _rowHeight * 6
        ];
        _picture ctrlSetBackgroundColor [0,1,0,0.4];
        _picture ctrlSetText "rhsafrf\addons\rhs_editorPreviews\data\rhs_tigr_vmf.paa";
        _picture ctrlCommit 0;


        private _btnPlus = _display ctrlCreate ["RscStructuredText", -1];
        _btnPlus ctrlsetFont "RobotoCondensedBold";
        _btnPlus ctrlSetBackgroundColor [0,0,0,1];
        _btnPlus ctrlSetStructuredText parseText "<t size='2' align='center' shadow='0' color='#999999'>+</t>";
        _btnPlus ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth * 4 + _columnWidth/2,
             (_i * (_rowHeight * 8) + safezoneY) + _rowHeight,
            _columnWidth/2,
            _rowHeight * 6
        ];
        _btnPlus ctrlCommit 0;

        private _btnMinus = _display ctrlCreate ["RscStructuredText", -1];
        _btnMinus ctrlsetFont "RobotoCondensedBold";
        _btnMinus ctrlSetBackgroundColor [0,0,0,1];
        _btnMinus ctrlSetStructuredText parseText "<t size='2' align='center' shadow='0' color='#999999'>-</t>";
        _btnMinus ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth * 4 + _columnWidth/2,
             (_i * (_rowHeight * 8) + safezoneY) + _rowHeight * 3,
            _columnWidth/2,
            _rowHeight * 6
        ];
        _btnMinus ctrlCommit 0;



        private _subline = _display ctrlCreate ["RscStructuredText", -1];
        _subline ctrlsetFont "RobotoCondensedBold";
        _subline ctrlSetBackgroundColor [0,0,0,1];
        _subline ctrlSetStructuredText parseText "<t size='0.7' align='center' shadow='0' color='#999999'>TIGR-M</t>";
        _subline ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth, 
            (_i * (_rowHeight * 8) + safezoneY) + _rowHeight * 6, 
            _columnWidth * 4,
            _rowHeight * 0.85
        ];
        _subline ctrlCommit 0;
    };


    private _button = _display ctrlCreate ["RscStructuredText", -1];
    _button ctrlsetFont "RobotoCondensedBold";
    _button ctrlSetBackgroundColor [108/255,170/255,204/255,1]; // 108, 170, 204
    _button ctrlSetStructuredText parseText "<t size='2.5' align='center' shadow='0' color='#20333D'>S P A W N</t>";
    _button ctrlSetPosition [
        safezoneX + _columnWidth,
        _rowHeight * 35 + safezoneY, 
        _screenWidth - _columnWidth * 2,
        _rowHeight * 3 
    ];
    _button ctrlCommit 0;

} forEach [0,5,10,15];