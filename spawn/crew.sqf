// reduce sending range of radio to 20%
player setVariable ["tf_sendingDistanceMultiplicator", 0.2];

hint "Warte auf Spawn des Piloten...";

// 
waitUntil { (CRASH_SITE_SELECTED) };

hint "Spawnpunkt jetzt verfügbar!";

sleep 10;

hint "";