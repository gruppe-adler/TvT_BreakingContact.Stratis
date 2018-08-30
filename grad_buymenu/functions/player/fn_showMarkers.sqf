waitUntil {!isNil "spawnMarkerBluforLand" && !isNil "spawnMarkerOpforHelicopter"};

diag_log "fnc show markers";


// note: removed all other markers here for this mission
if (playerside == west) then {
     {_x setMarkerAlphaLocal 1;} forEach [
          spawnMarkerBluforLand
          ];
}; 

if (playerside == east) then {
     {_x setMarkerAlphaLocal 1;} forEach [
          spawnMarkerOpforLand
          ];
};