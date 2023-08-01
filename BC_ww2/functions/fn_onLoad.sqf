params ["_display"];

private _side = side player;
{
     if (side _x isEqualTo _side) then {
          (_display displayCtrl 42) lbAdd (name _x);
          (_display displayCtrl 7) lbAdd (name _x);
     };
} forEach ([allUnits,allPlayers] select isMultiplayer);

(_display displayCtrl 42) lbSetCurSel 0;
(_display displayCtrl 7) lbSetCurSel 0;