class GRAD_tracking {

	class player {
        file = grad_tracking\functions\player;

        class createMarkerLastSeen {};
        class createMarkerRadioVeh {};
        class createMarkerTerminal {};
        class ensureRadioVehMarkerAnimation {};
        class ensureTerminalMarkerAnimation {};
        class hintEndTransmission {};
        class initClient {};
        class radioVehMarkerAnimation {};
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
        class execIfLocal {};
        class mainLoop {};
        class radioVehIsSending {};
        class setRadioVehMarkerPosition {};
        class setRadioVehMarkerStatus {};
        class setTerminalMarkerPosition {};
        class setTerminalMarkerStatus {};
        class terminalAttachToVeh {};
        class terminalDistanceListenerServer {};
        class terminalDistanceToVehCalc {};
        class terminalExplodeDelayed {};
        class terminalIsSending {};
        class radioTruckDeploy {};
        class radioTruckRetract {};
    };
};