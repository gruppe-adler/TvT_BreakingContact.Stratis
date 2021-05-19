if (!hasInterface) exitWith {};

if (side player == west) exitWith {};

["ace_interactMenuOpened", {
    _this call BC_vietnam_fnc_interactEH
}] call CBA_fnc_addEventHandler;
