disableSerialization;
waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
  cheffeKeyEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
    "KeyDown",
    format ["
        if (OPFOR_TELEPORT_TARGET select 0 != 0) then {
          ([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];

          playSound ['click', true];

        };

        if (_this select 1 == 57) then {createDialog 'gui_spawn_opfor'; true};
      "]
  ];
  createDialog "gui_spawn_opfor";
  waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
  ([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
