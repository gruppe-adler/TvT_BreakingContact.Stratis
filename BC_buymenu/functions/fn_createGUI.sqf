/*

    ["AmericanStuff", US_SPAWN_PAD] call BC_buymenu_fnc_createGUI;

*/

params ["_baseConfigName", "_spawnCone"];
// prepare data
//private _baseConfigName = "RussianStuff";
private _baseConfig = missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName;
private _allCategories = "true" configClasses _baseConfig;
private _categoriesExtracted = [];

{
    _config = _x;
    _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;

    if (call compile _condition) then {
        private _configName = configName _config;

        private _categoryName = [(_config >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
        if (_categoryName == "") then {_categoryName = _configName};

        private _valueMaxInThisCat = [(_config >> "maxBuyCount"), "number", 0] call CBA_fnc_getConfigEntry;


        ///////
        private _allItems = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _configName);
        _listIndex = 0;
        private _allItemsExtracted = [];
        {
            _config = _x;
            _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;

            if (call compile _condition) then {
                private _itemConfigName = configName _config;
                private _displayName = [(_config >> "displayName"), "text", [_itemConfigName] call grad_lbm_fnc_getDisplayName] call CBA_fnc_getConfigEntry;
                private _price = [(_config >> "price"), "number", 999999] call CBA_fnc_getConfigEntry;
                private _stock = [(_config >> "stock"), "number", 999999] call CBA_fnc_getConfigEntry;
                
                private _description = [(_config >> "description"), "text", [_itemConfigName] call grad_lbm_fnc_getDescription] call CBA_fnc_getConfigEntry;
                private _code = compile ([(_config >> "code"), "text", ""] call CBA_fnc_getConfigEntry);
                private _picturePath = [(_config >> "picture"), "text", ""] call CBA_fnc_getConfigEntry;

                private _crew = [_itemConfigName,false] call BIS_fnc_crewCount;
                private _fullCrew = [_itemConfigName,true] call BIS_fnc_crewCount;
                private _cargo = _fullCrew - _crew;
                private _speed = 0;
                // diag_log format ["%1",_crew];
                if (!isNull (configFile >> "CfgVehicles" >> _itemConfigName >> "maxSpeed")) then {
                     _speed = getNumber( configFile >> "CfgVehicles" >> _itemConfigName >> "maxSpeed" );
                };

                if (_picturePath isEqualTo "") then {
                    _picturePath = getText (configfile >> "CfgVehicles" >> _itemConfigName >> "editorPreview");
                };

                _allItemsExtracted pushBack [_itemConfigName, _displayName, _stock, _description, _code, _picturePath, _crew, _cargo, _speed, _baseConfigName, _categoryName, _itemConfigName, _spawnCone];
                // diag_log str (_allItemsExtracted);
                // copyToClipboard str (_allItemsExtracted);
                
            };
        } forEach _allItems;
        ///////


        _categoriesExtracted pushBack [
            _categoryName, _valueMaxInThisCat, _allItemsExtracted
        ];
    };
} forEach _allCategories;



///////////////////


private _screenWidth = safeZoneW;
private _screenHeight = safeZoneH;

private _columnWidth = _screenWidth/26;
private _rowHeight = _screenHeight/40;

disableSerialization;

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";

private _background = _display ctrlCreate ["RscText", -1];
_background ctrlSetPosition [safezoneX, safeZoneY, _screenWidth, _screenHeight];
_background ctrlSetBackgroundColor [0,0,0,0.9];
_background ctrlCommit 0;

private _backgroundHeader = _display ctrlCreate ["RscText", -1];
_backgroundHeader ctrlSetPosition [safezoneX, safeZoneY, _screenWidth, _rowHeight*4];
_backgroundHeader ctrlSetBackgroundColor [0,0,0,1];
_backgroundHeader ctrlCommit 0;

private _bgHeadline = _display ctrlCreate ["RscStructuredText", -1];
_bgHeadline ctrlsetFont "RobotoCondensedBold";
_bgHeadline ctrlSetBackgroundColor [0,0,0,0];
_bgHeadline ctrlSetStructuredText parseText ("<t size='3' align='center' color='#333333'>Vehicle Supply</t>");
_bgHeadline ctrlSetPosition [safezoneX, safeZoneY, _screenWidth, _rowHeight*3];
_bgHeadline ctrlCommit 0;


private _crewCountDisplay = 0;
private _cargoCountDisplay = 0;
private _valueTotalSideCount = playerside countSide allUnits;

private _ctrlCrewCount = _display ctrlCreate ["RscStructuredText", -1];
_ctrlCrewCount ctrlsetFont "RobotoCondensed";
_ctrlCrewCount ctrlSetBackgroundColor [1,0,0,0];
_ctrlCrewCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' color='#999999'>" + str _crewCountDisplay + " </t><br/><t size='0.5' align='center' color='#666666'>Crew" + "</t>");
_ctrlCrewCount ctrlSetPosition [_columnWidth*22 + safeZoneX, safeZoneY + _rowHeight, _columnWidth, _rowHeight*3];
_ctrlCrewCount ctrlCommit 0;

private _ctrlCargoCount = _display ctrlCreate ["RscStructuredText", -1];
_ctrlCargoCount ctrlsetFont "RobotoCondensed";
_ctrlCargoCount ctrlSetBackgroundColor [1,0,0,0];
_ctrlCargoCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' color='#999999'>" + str _cargoCountDisplay + " </t><br/><t size='0.5' align='center' color='#666666'>Cargo" + "</t>");
_ctrlCargoCount ctrlSetPosition [_columnWidth*23 + safeZoneX, safeZoneY + _rowHeight, _columnWidth, _rowHeight*3];
_ctrlCargoCount ctrlCommit 0;

private _ctrlTotalSideCount = _display ctrlCreate ["RscStructuredText", -1];
_ctrlTotalSideCount ctrlsetFont "RobotoCondensed";
_ctrlTotalSideCount ctrlSetBackgroundColor [1,0,0,0];
_ctrlTotalSideCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' color='#999999'>" + str _valueTotalSideCount + " </t><br/><t size='0.5' align='center' color='#666666'>Your Side" + "</t>");
_ctrlTotalSideCount ctrlSetPosition [_columnWidth*24 + safeZoneX, safeZoneY + _rowHeight, _columnWidth, _rowHeight*3];
_ctrlTotalSideCount ctrlCommit 0;

{   
    private _multiplicator = _x;
    private _category = _categoriesExtracted select _forEachIndex select 0;
    private _valueMaxInThisCat = _categoriesExtracted select _forEachIndex select 1;
    private _data = _categoriesExtracted select _forEachIndex select 2;
    if (count _data < 1) exitWith {};

    

    // copyToClipBoard str (_data);
   

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
    _headline ctrlSetBackgroundColor [0,0,0,0];
    _headline ctrlSetTextColor [1,1,1,1];
    _headline ctrlSetStructuredText parseText ("<t size='2' align='center' color='#666666'>" + _category + "</t>");
    _headline ctrlSetPosition [
        _columnWidth * _multiplicator + safezoneX + _columnWidth, 
        _rowHeight * 4 + safezoneY, 
        _columnWidth * 4,
        _rowHeight * 2.5 
    ];
    _headline ctrlCommit 0;

    private _ctrlChosenInThisCat = _display ctrlCreate ["RscStructuredText", -1];
    _ctrlChosenInThisCat ctrlsetFont "RobotoCondensedBold";
    _ctrlChosenInThisCat ctrlSetBackgroundColor [0,0,0,0];
    _ctrlChosenInThisCat ctrlSetTextColor [1,1,1,1];
    private _valueChosenInThisCat = _ctrlChosenInThisCat getVariable ["value", 0];
    _ctrlChosenInThisCat setVariable ["value", _valueChosenInThisCat];
    _ctrlChosenInThisCat ctrlSetStructuredText parseText ("<t size='1' align='center' color='#333333'>" + str _valueChosenInThisCat + "/" + str _valueMaxInThisCat + "</t>");
    _ctrlChosenInThisCat setVariable ["maxValue", _valueMaxInThisCat];
    _ctrlChosenInThisCat ctrlSetPosition [
        _columnWidth * _multiplicator + safezoneX + _columnWidth, 
        _rowHeight * 6 + safezoneY, 
        _columnWidth * 4,
        _rowHeight * 1.5 
    ];
    _ctrlChosenInThisCat ctrlCommit 0;



    for "_i" from 1 to (count _data) do {

        (_data select (_i-1)) params [
            "_classname",
            "_displayName",
            "_maxCount",
            "_description",
            "_code",
            "_picturePath",
            "_crew",
            "_cargo",
            "_speed",
            "_baseConfigName",
            "_categoryName",
            "_itemConfigName",
            "_spawnCone"
        ];

        
        // ctrlItemCount is our all knowing item
        private _ctrlItemCount = _display ctrlCreate ["RscStructuredText", -1];
        private _valueItemCount = _ctrlItemCount getVariable ["value", 0];
        _ctrlItemCount setVariable ["value", _valueItemCount];
        _ctrlItemCount setVariable ["maxValue", _maxCount];
        _ctrlItemCount setVariable ["ctrlTotalSideCount", _ctrlTotalSideCount];
        _ctrlItemCount setVariable ["valueTotalSideCount", _valueTotalSideCount];
        _ctrlItemCount setVariable ["ctrlChosenInThisCat", _ctrlChosenInThisCat];
        _ctrlItemCount setVariable ["valueMaxInThisCat", _valueMaxInThisCat];
        _ctrlItemCount setVariable ["crew", _crew];
        _ctrlItemCount setVariable ["cargo", _cargo];
        _ctrlItemCount setVariable ["ctrlCrew", _ctrlCrewCount];
        _ctrlItemCount setVariable ["ctrlCargo", _ctrlCargoCount];
        _ctrlItemCount setVariable ["data", (_data select (_i-1))];
        _ctrlItemCount ctrlsetFont "RobotoCondensedBold";
        _ctrlItemCount ctrlSetBackgroundColor [0,0,0,0];
        _ctrlItemCount ctrlSetStructuredText parseText ("<t size='1.5' align='center' shadow='0' color='#999999'>" + str _valueItemCount + "</t>");
        _ctrlItemCount ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth,
             (_i * (_rowHeight * 8) + safezoneY) + _rowHeight,
            _columnWidth/2,
            _rowHeight * 6
        ];
        _ctrlItemCount ctrlCommit 0;


        private _picture = _display ctrlCreate ["RscPictureKeepAspect", -1];
        _picture ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth + _columnWidth/2, 
            (_i * (_rowHeight * 8) + safezoneY) - _rowHeight,
            _columnWidth * 3, 
            _rowHeight * 6
        ];
        _picture ctrlSetBackgroundColor [0,1,0,0.4];
        _picture ctrlSetText _picturePath;
        // _picture ctrlSetText "rhsafrf\addons\rhs_editorPreviews\data\rhs_tigr_vmf.paa";
        _picture ctrlCommit 0;


        private _btnPlus = _display ctrlCreate ["grad_buymenu_RscButton", -1];
        _btnPlus ctrlsetFont "RobotoCondensedBold";
        _btnPlus ctrlSetBackgroundColor [0,0,0,1];
        _btnPlus ctrlsetText "+";
        _btnPlus ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth * 4 + _columnWidth/2,
             (_i * (_rowHeight * 8) + safezoneY) - _rowHeight/4,
            _columnWidth/2,
            _rowHeight * 2
        ];
        _btnPlus ctrlSetTooltip "Increase Count";
        _btnPlus setVariable ["parentControl", _ctrlItemCount];
        if (_valueItemCount > _maxCount) then {
            _btnPlus ctrlEnable false;
        };
        _btnPlus ctrlAddEventHandler [
            "MouseButtonDown",
            "[_this, true] call BC_buymenu_fnc_changeValue;"
        ];
        _btnPlus ctrlCommit 0;


        private _btnMinus = _display ctrlCreate ["grad_buymenu_RscButton", -1];
        _btnMinus ctrlsetFont "RobotoCondensedBold";
        _btnMinus ctrlSetBackgroundColor [0,0,0,1];
        _btnMinus ctrlsetText "-";
        // _btnMinus ctrlSetStructuredText parseText "<t size='1' align='center' shadow='0' color='#999999'>-</t>";
        _btnMinus ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth * 4 + _columnWidth/2,
             (_i * (_rowHeight * 8) + safezoneY) + _rowHeight * 2,
            _columnWidth/2,
            _rowHeight * 2
        ];
        _btnMinus ctrlSetTooltip "Reduce Count";
        _btnMinus setVariable ["parentControl", _ctrlItemCount];
        if (_valueItemCount == 0) then {
            _btnMinus ctrlEnable false;
        };
        _btnMinus ctrlAddEventHandler [
            "MouseButtonDown",
            "[_this, false] call BC_buymenu_fnc_changeValue;"
        ];
        _btnMinus ctrlCommit 0;

        // add plus and minus to parent ctrl
        _ctrlItemCount setVariable ["connectedButtons", [_btnPlus, _btnMinus]];

        // parent cat control stores plus and minus buttons to disable/enable
        private _plusMinusButtons = _ctrlChosenInThisCat getVariable ["catPlusMinusButtons", []];
        _plusMinusButtons pushBack [_btnPlus, _btnMinus];
        _ctrlChosenInThisCat setVariable ["catPlusMinusButtons", _plusMinusButtons];
        _ctrlChosenInThisCat ctrlCommit 0;

        private _subline = _display ctrlCreate ["RscStructuredText", -1];
        _subline ctrlsetFont "RobotoCondensedBold";
        _subline ctrlSetBackgroundColor [0,0,0,0];
        _subline ctrlSetStructuredText parseText ("<t size='0.7' align='center' shadow='0' color='#999999'>" + _displayName + "</t>");
        _subline ctrlSetPosition [
            _columnWidth * _multiplicator + safezoneX  + _columnWidth, 
            (_i * (_rowHeight * 8) + safezoneY) + _rowHeight * 4.5, 
            _columnWidth * 4,
            _rowHeight * 0.85
        ];
        _subline ctrlCommit 0;
    };


    private _button = _display ctrlCreate ["grad_buymenu_RscButton", -1];
    _button ctrlsetFont "RobotoCondensedBold";
    _button ctrlSetBackgroundColor [108/255,170/255,204/255,1]; // 108, 170, 204
    _button ctrlSetStructuredText parseText "<t size='2.5' align='center' shadow='0' color='#20333D'>S P A W N</t>";
    _button ctrlSetPosition [
        safezoneX + _columnWidth,
        _rowHeight * 35 + safezoneY, 
        _screenWidth - _columnWidth * 2,
        _rowHeight * 3 
    ];
    _button ctrlAddEventHandler [
            "MouseButtonClick",
            "[] call BC_buymenu_fnc_buyStuff;"
        ];
    _button ctrlCommit 0;

} forEach [
    0,5,10,15,20
];

uiNamespace setVariable ["BC_buymenu_display", _display];