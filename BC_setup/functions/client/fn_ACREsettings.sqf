#ifdef GRAD_FACTIONS_USE_ACRE

private _sourcePreset = switch (playerSide) do {
    case WEST: {"default2"};
    case EAST: {"default3"};
    case INDEPENDENT: {"default4"};
    default {"default"};
};


["ACRE_PRC152", _sourcePreset, "bc"] call acre_api_fnc_copyPreset;
["ACRE_PRC152", "bc", 1, "description", "ALPHA"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 2, "description", "BRAVO"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 3, "description", "CHARLIE"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 4, "description", "DELTA"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 5, "description", "ECHO"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 6, "description", "FOXTROTT"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 7, "description", "GULF"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 8, "description", "HOTEL"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 9, "description", "INDIA"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc", 99, "description", "COMMAND"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "bc"] call acre_api_fnc_setPreset;

["ACRE_PRC117F", _sourcePreset, "bc"] call acre_api_fnc_copyPreset;
["ACRE_PRC117F", "bc", 1, "name", "COMMAND"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "bc", 2, "name", "PLATOON 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "bc", 3, "name", "PLATOON 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "bc", 4, "name", "PLATOON 3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "bc"] call acre_api_fnc_setPreset;

//  player-specific setup:
// [ (["ACRE_PRC152"] call getRadioByType), 1] call acre_api_fnc_setRadioChannel;

["blufor", "BLUFOR"] call acre_api_fnc_babelAddLanguageType;
["opfor", "OPFOR"] call acre_api_fnc_babelAddLanguageType;
["independent", "INDEPENDENT"] call acre_api_fnc_babelAddLanguageType;
private _language = switch (playerSide) do {
        case WEST: { ["blufor"] };
        case EAST: { ["opfor"] };
        case INDEPENDENT: { ["independent"] };
        default {  ["blufor","opfor","independent"] };
    };

[_languages] call acre_api_fnc_babelSetSpokenLanguages;


// babel

["unit", {
    params ["_player"];
    switch ((getNumber (configFile >> "CfgVehicles" >> (typeOf _player) >> "side"))) do {
        case 1: { ["en"] call acre_api_fnc_babelSetSpokenLanguages; };
        case 0: { ["ru"] call acre_api_fnc_babelSetSpokenLanguages; };
        case 2: { ["ab"] call acre_api_fnc_babelSetSpokenLanguages; };
        default {  ["ab","en","ru"] call acre_api_fnc_babelSetSpokenLanguages; };
    };
}, true] call CBA_fnc_addPlayerEventHandler;
