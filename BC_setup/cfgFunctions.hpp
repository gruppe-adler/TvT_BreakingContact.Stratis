class BC_setup {

    class definitions {
    file = BC_setup\definitions;

        class configureBluforStartVehicle;
        class configureOpforStartVehicle;
<<<<<<< HEAD
    };
    
    class client {     	
        file = BC_setup\functions\client;
=======
  };

	class client {
		file = BC_setup\functions\client;
>>>>>>> parent of 83e541e... tab to spaces

        class addBriefing;
        class addInteractions;
        class chooseSpawn;
        class createStartMarker;
        class disableSpawn;
        class establishingShot;
        class initialSpawnClient;
        class isOnWater;
        class openSpawnDialog;
        class teleportPlayer;
<<<<<<< HEAD
        class TFARsettings { preInit = 1; }; 
    };

    class server {     	
        file = BC_setup\functions\server;
=======
        class TFARsettings { preInit = 1; };
	};

  class server {
		file = BC_setup\functions\server;
>>>>>>> parent of 83e541e... tab to spaces

        class clearInventory;
        class defineWoodland { preInit = 1; };
        class findRandomPos;
        class findSpawnPosition;
        class getHighestRankOfSide;
        class getIslandCfgEntry { preInit = 1; };
        class getMapSize;
        class getSlope;
        class getSpawnPos;
        class getStartVehiclePos;
        class initialSpawnServer;
        class isInsideMap;
        class publishBluforTeleportTarget;
        class publishOpforTeleportTarget;
        class registerDynamicGroup;
        class showLeaderInformation;
        class spawnStartVehicle;
<<<<<<< HEAD
        class teleportAI;     
    };
=======
        class teleportAI;
	};
>>>>>>> parent of 83e541e... tab to spaces
};
