class BC_setup {

	class client {
		file = BC_setup\functions\client;

        class disableSpawn;
        class isOnWater;
        class teleportPlayer;
	};

  class definitions {
		file = BC_setup\definitions;

        class configureBluforStartVehicle;
        class configureOpforStartVehicle;
	};

  class server {
		file = BC_setup\functions\server;

        class clearInventory;
        class findSpawnPosition;
        class getMapSize;
        class getSlope;
        class isInsideMap;
        class publishBluforTeleportTarget;
        class publishOpforTeleportTarget;
        class spawnStartVehicle;
	};
};
