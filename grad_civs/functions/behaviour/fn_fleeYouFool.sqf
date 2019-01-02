params ["_unit", ["_shooter", objNull]];

if (_unit getVariable ["GRAD_civs_isFleeing", false]) exitWith { diag_log format ["%1 already fleeing", _unit]; };

CIV_GUNFIGHT_POS = (position _unit);
diag_log format ["civ gunfight at %1",CIV_GUNFIGHT_POS];
publicVariableServer "CIV_GUNFIGHT_POS";

_shooterPosition = if (!(isNull _shooter)) then { position _shooter } else { [[position _unit, 200, 200, 0, false]] call CBA_fnc_randPosArea };
_hostileSides = _unit getVariable ["GRAD_civs_hostileSides", []];
_targetPosition = [position _unit] call GRAD_civs_fnc_findPositionOfInterest;
_escapePosition = [0,0];

_group = group _thisUnit;

_car = if ((vehicle _unit) isKindOf 'LandVehicle') then { vehicle _unit } else { objNull };


if (!isNull _car) then {

     if (canMove _car && {fuel _car > 0}) then {

          _escapePosition = [_unit, _shooter, 1000] call GRAD_civs_fnc_getOpposingDirection;

          _unit doMove _escapePosition;
          _unit setSpeedMode "FULL";
          _unit setVariable ["GRAD_civs_isFleeing", true];

          [{playSound3D ["a3\sounds_f\weapons\horns\truck_horn_2.wss", _this];}, [_car], 1 + random 2] call CBA_fnc_waitAndExecute;
          

          // _unit setVariable ["GRAD_civs_currentlyThinking", "driving away as fast as i can", true];
     } else {

          doStop _unit;

         { unassignVehicle _x } forEach crew _car;

         { doGetOut _x } forEach crew _car;
          _escapePosition = [_unit, _shooter, 100] call GRAD_civs_fnc_getOpposingDirection;
          _targetPosition = [_escapePosition] call GRAD_civs_fnc_findPositionOfInterest;
          _unit doMove _targetPosition;

          // _unit setVariable ["GRAD_civs_currentlyThinking", "running away as fast as i can, my car is broke", true];

     };
} else {

     _escapePosition = [_unit, _shooter, 200] call GRAD_civs_fnc_getOpposingDirection;
     _targetPosition = [_escapePosition] call GRAD_civs_fnc_findPositionOfInterest;
     _unit doMove _targetPosition;

     // _unit setVariable ["GRAD_civs_currentlyThinking", "running away as fast as i can", true];
};