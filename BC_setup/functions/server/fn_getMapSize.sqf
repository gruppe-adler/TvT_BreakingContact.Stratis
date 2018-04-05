// check for arma3 map size
_mapSizeDetected = worldSize;
_mapSizeDetectedKnown = true;

// check for utes/chernarus
if (_mapSizeDetected < 2000) then {
_mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"zoom1">>"stepX")*(parseNumber mapGridPosition [0,0,0]);
diag_log format ["Calculating Spawnpos: Map doesnt seem to be Arma3 native. Checking for Chernarus/Utes.",_mapSizeDetected];
};

// check for OA terrains / takistan
if (_mapSizeDetected < 2000) then {
  _mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"offsety");
  diag_log format ["Calculating Spawnpos: Checking for OA Terrain.",_mapSizeDetected];
};

// now im out of functions to get map size correctly
if (_mapSizeDetected < 2000) then {
  _mapSizeDetectedKnown = false;
  diag_log format ["Calculating Spawnpos: Map Size < 2000 or unknown."];
} else {
  _mapSizeDetectedKnown = true;
  diag_log format ["Calculating Spawnpos: Map Size is  %1.",
  _mapSizeDetected];
};
[_mapSizeDetected,_mapSizeDetectedKnown]
