class GRAD_supplydrops {

    class player {
        file = grad_supplydrops\functions\player;
        
        class createDropMarker {};
        class showDropHint {};
    };

	class server {
        file = grad_supplydrops\functions\server;
        
        class createCarrier {};
        class fillInventory {};
        class findNearestMapEdge {};
    };
};