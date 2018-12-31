private _display = uiNamespace getVariable ["BC_buymenu_display", _display];

_display closeDisplay 1;

[player] remoteExec ["BC_buymenu_fnc_dropMoney", [0,-2] select isDedicated];


private _buyQueue = missionNamespace getVariable ["BC_buymenu_vehicleSpawnQueue", []];



{
  
    private _data = _x;

    _data params ["_classname", 
    "_displayName", 
    "_maxCount", 
    "_description", 
    "_code", 
    "_picturePath", 
    "_crew", 
    "_cargo", 
    "_speed", 
    "_baseConfigName", 
    "_categoryConfigName", 
    "_itemConfigName",
    "_spawnCone"];

    diag_log format ["_data %1", _data];

    // params ["_buyer","_account","_price","_code","_baseConfigName","_categoryConfigName","_itemConfigName","_vehiclespawn"];
    [player,
     player,
     0,
     _code,
     _baseConfigName,
     _categoryConfigName,
     _itemConfigName,
     _spawnCone] call GRAD_lbm_fnc_buyVehicle;

} forEach _buyQueue;