class GRAD_tracking {

	class player {
        file = grad_tracking\functions\player;

        class addGetInVehicleEH {};
        class createMarkerLastSeen {};
        class createMarkerRadioVeh {};
        class createMarkerTerminal {};
        class ensureRadioVehMarkerAnimation {};
        class ensureTerminalMarkerAnimation {};
        class hintEndTransmission {};
        class initClient {};
        class listenerInterval {};
        class listenerTicks {};
        class radioVehMarkerAnimation {};
        class showIntervalWarning {};
        class showMarkerUpdateHint {};
        class showTicksInstant {};
        class showTicksWarning {};
        class terminalAddAction {};
        class terminalClose {};
        class terminalDistanceHint {};
        class terminalDistanceListenerClient {};
        class terminalMarkerAnimation {};
        class terminalOpen {};
    };

	class server {
        file = grad_tracking\functions\server;
        
        class bluforCaptured {};
        class bluforSurrendered {};
        class booleanEqual {};
        class mainLoop {};
        class radioTruckCookoffFix {};
        class radioTruckDeploy {};
        class radioTruckRetract {};
        class radioVehIsSending {};
        class randomizeMarker {};
        class registerVehicleEnter {};
        class registerVehicleExit {};
        class setRadioVehMarkerPosition {};
        class setRadioVehMarkerSize {};
        class setRadioVehMarkerStatus {};
        class setTerminalMarkerPosition {};
        class setTerminalMarkerStatus {};
        class showTicksInstant {};
        class terminalAttachToVeh {};
        class terminalCalculateDistanceModifier {};
        class terminalDistanceListenerServer {};
        class terminalDistanceToVehCalc {};
        class terminalExplodeDelayed {};
        class terminalIsSending {};
    };
};