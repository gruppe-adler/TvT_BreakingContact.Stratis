if (!weaponLowered player) then {
   _possibleCiv = cursorTarget;
   _currentCiv = player getVariable ["GRAD_isPointingAtCiv", _civ];

   if (!(_possibleCiv isEqualTo _currentCiv)) then {     
     _pointCounter = _currentCiv getVariable ["GRAD_isPointedAtBy",0];
     _currentCiv setVariable ["GRAD_isPointedAtBy", _pointCounter - 1, true];
     _currentCiv = objNull;
   };

   if ( (side _possibleCiv) == civilian && {alive _possibleCiv} && {player distance _possibleCiv < 50}) then {
     _civ = _possibleCiv;

     if (_civ getVariable ["GRAD_isPointedAtBy",0] == 0) then {
      [_civ] remoteExec ["GRAD_civs_fnc_stopCiv", [2,0] select (isMultiplayer && isDedicated), false];
     };

     _pointCounter = _civ getVariable ["GRAD_isPointedAtBy",0];
     _civ setVariable ["GRAD_isPointedAtBy", _pointCounter + 1, true];

     player setVariable ["GRAD_isPointingAtCiv", _civ];
     
   };
};