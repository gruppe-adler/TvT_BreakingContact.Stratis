_ai = _this select 0;

waitUntil {!isNil "BLUFOR_TELEPORT_TARGET"};
waitUntil {(BLUFOR_TELEPORT_TARGET select 0 != 0)};
_location = [0,0];
if (side _ai == west) then {
  _location = BLUFOR_TELEPORT_TARGET;
} else {
  _location = OPFOR_TELEPORT_TARGET;
};

sleep (random 7);

_spawn = _location findEmptyPosition [2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", _ai, _location];
_nul = _ai setPos _spawn;
