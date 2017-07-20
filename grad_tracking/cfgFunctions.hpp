class GRAD_tracking {

	class player {
        file = grad_tracking\functions\player;

        class createMarkerLastSeen {};
        class createMarkerRadioVeh {};
        class createMarkerTerminal {};
        class createRadioPositionMarkerLocal {};
        class ensureRadioVehMarkerAnimation {};
        class ensureTerminalMarkerAnimation {};
        class hintEndTransmission {};
        class initClient {};
        class listenerInterval {};
        class listenerTicks {};
        class radioVehMarkerAnimation {};
        class setMarkerColorAndText {};
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
        class createRadioPositionMarker {};
        class getTransmissionPercentage {};
        class mainLoop {};
        class radioTruckCookoffFix {};
        class radioTruckDeploy {};
        class radioTruckRetract {};
        class radioVehIsSending {};
        class randomizeMarker {};
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