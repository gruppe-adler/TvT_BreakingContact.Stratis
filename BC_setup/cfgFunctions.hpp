class BC_setup {

	class client {
		file = BC_setup\functions\client;

        class addBriefing;
        class addInteractions;
        class chooseSpawn;
        class createStartMarker;
        class establishingShot;
        class exitChooseSpawn;
        class initialSpawnClient;
        class isOnWater;
        class openSpawnDialog;
        class teleportPlayer;
		class radioSettings { preInit = 1; };
        class TFARsettings;
		class ACREsettings;
    };

  class server {
		file = BC_setup\functions\server;

        class defineWoodland { preInit = 1; };
        class findRandomPos;
		class fuelDrain;
        class getHighestRankOfSide;
        class getIslandCfgEntry { preInit = 1; };
        class initialSpawnServer;
        class registerDynamicGroup;
		class removeFuelStations { postInit = 1; };
        class showLeaderInformation;
        class teleportAI;
    };
};
