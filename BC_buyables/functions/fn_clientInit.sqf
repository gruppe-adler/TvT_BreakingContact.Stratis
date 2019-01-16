if (!hasInterface) exitWith {};

["startVehicle", { 

        params ["_startVehicle", "_side"];

        BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
        BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

        private _factionsBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
        private _buyablesBlufor = configName (_factionsBlufor select BUYABLES_BLUFOR_INDEX);

        private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
        private _buyablesOpfor = configName (_factionsOpfor select BUYABLES_OPFOR_INDEX);
        
        diag_log format ["_factionsOpfor %1", _factionsOpfor];
        diag_log format ["_buyablesOpfor %1", _buyablesOpfor];

        if (_side == west) then {
            [_startVehicle,
            _buyablesBlufor,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        } else {
            [_startVehicle,
            _buyablesOpfor,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == EAST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        };

}] call CBA_fnc_addEventHandler;



private _transferBuyOption = ["transferBuyOption", "Transfer Buyability", "",
{
  params ["_target", "_player"];
  _player setVariable ["BC_potentToBuy", false, true];
  _target setVariable ["BC_potentToBuy", true, true];
  hint "Transferred authorization to buy to " + (name _target);
  ["The Commander authorized you to buy."] remoteExec ["hint", _target];
},
{ player getVariable ["BC_potentToBuy", false] }] call ace_interact_menu_fnc_createAction;

["Man", 0, ["ACE_MainActions"], _transferBuyOption] call ace_interact_menu_fnc_addActionToClass;