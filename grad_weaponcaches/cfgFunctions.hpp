class GRAD_weaponcaches {

	class player {
        file = grad_weaponcaches\functions\player;
        
        class createCacheMarker {};
        class randomizeMarker {};
    };


	class server {
        file = grad_weaponcaches\functions\server;
        
        class fillInventory {};
        class findPositionInHouse {};
        class getSettlement {};
        class isNearby {};
        class prepareCache {};
        class spawnCache {};
        
    };
};