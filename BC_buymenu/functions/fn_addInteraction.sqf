params ["_object", "_baseConfigName", "_spawnCone", "_shopName", "_actionDescription", "_condition"];

/*  Adds ACE-interaction to open buy menu to an object
*
*/

private _actionName = format ["grad_lbm_interaction_%1_%2", str _object, _baseConfigName];
private _icon = (missionNamespace getVariable ["grad_lbm_moduleRoot", [] call grad_lbm_fnc_getModuleRoot]) + "\data\moneyIcon.paa";

private _action = [_actionName,_actionDescription,_icon,{

    _args = _this select 2;
    _args params ["_object","_spawnCone","_baseConfigName","_shopName"];
    
    [{
        params ["_baseConfigName", "_object", "_spawnCone"];
        [_baseConfigName, _object, _spawnCone] call BC_buymenu_fnc_createGUI;
        
    }, [_baseConfigName, _object, _spawnCone]
    ] call CBA_fnc_execNextFrame;

},_condition,{},[_object,_spawnCone,_baseConfigName,_shopName],[0,0,0],3] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;