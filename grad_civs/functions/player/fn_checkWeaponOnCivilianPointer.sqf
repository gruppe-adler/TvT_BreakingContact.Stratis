_civ = driver cursorTarget;
_pointingCache = player getVariable ["GRAD_civs_mePointingAt", objNull];

if (!weaponLowered player && isNull objectParent player) then {
      
      if ( 
          (side _civ) == civilian && 
          {alive _civ} && 
          {(count (crew _civ)) > 0} && // is not empty vehicle
          {player distance _civ < (20 + random 40)} && // detection distance
          ([objNull, "VIEW"] checkVisibility [eyePos _civ, eyePos player] == 1) &&
          !isPlayer _civ
          ) then {
       
          /*  && // some randomization for detection range
          {(if (getDir player > getDir cursorTarget > )}*/

          _guysPointingAtCiv = _civ getVariable ["GRAD_civs_isPointedAtBy",[]];

          // we are already targeting someone
          if (!isNull _pointingCache) then {

              _guysPointingAtPointingCache = _pointingCache getVariable ["GRAD_civs_isPointedAtBy",[]];

              if (_pointingCache isEqualTo _civ) then {
                  // do nothing, because we are still pointing at the same guy
              } else {
                  if (player in _guysPointingAtPointingCache) then {
                      // remove myself from pointer list of former pointer target
                      _pointingCache setVariable ["GRAD_civs_isPointedAtBy", _guysPointingAtPointingCache - [player], true];
                      player setVariable ["GRAD_civs_mePointingAt", objNull];
                  };
                  // add myself to pointer list
                  _civ setVariable ["GRAD_civs_isPointedAtBy", _guysPointingAtCiv + [player], true];
                  player setVariable ["GRAD_civs_mePointingAt", _civ];
              };
          } else {
            _civ setVariable ["GRAD_civs_isPointedAtBy", _guysPointingAtCiv + [player], true];
            player setVariable ["GRAD_civs_mePointingAt", _civ];
            [_civ] remoteExec ["GRAD_civs_fnc_stopCiv", _civ, false]; // execute where civ is local
          };
    };  
} else {
   
    _guysPointingAtPointingCache = _pointingCache getVariable ["GRAD_civs_isPointedAtBy",[]];

    if (!(isNull _pointingCache)) then {
        _pointingCache setVariable ["GRAD_civs_isPointedAtBy", _guysPointingAtPointingCache - [player], true];
        player setVariable ["GRAD_civs_mePointingAt", objNull];
    };

};
