class BC_vietnam {

    class client {
        file = BC_vietnam\functions\client;
        
        class addActionRepair { postInit = 1; };
        class autoAddEH { postInit = 1; };
        class buildProgress;
        class findTrunk;
        class interactEH;
        class repairVehicle;
        class spawnSplinters;
    };

  class server {
         file = BC_vietnam\functions\server;

         class addFortifications;
         class addKilledExplosionEH;
         class applyTruckCamo;
         class build;
         class explosionServer;
         class placeTrapDoor;
    };
};
