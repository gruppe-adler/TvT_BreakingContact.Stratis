class GRAD_tracking {

     class player {
        file = grad_tracking\functions\player;

        class antennaDisable;
        class antennaMarkerAnimation;
        class antennaStart;
        class antennaStop;
        class attachUnitAntenna;
        class createMarkerAntenna;

        class createMarkerLastSeen;
        class createMarkerRadioVeh;
        class createMarkerTerminal;
        class createRadioPositionMarkerLocal;
        class ensureAntennaMarkerAnimation;
        class ensureRadioVehMarkerAnimation;
        class ensureTerminalMarkerAnimation;
        class hintEndTransmission;
        class initClient;
        class listenerInterval;
        class listenerTicks;
        class radioVehMarkerAnimation;
        class setMarkerColorAndText;
        class showIntervalWarning;
        class showMarkerUpdateHint;
        class showTicksInstant;
        class showTicksWarning;
        class terminalClose;
        class terminalDistanceHint;
        class terminalDistanceListenerClient;
        class terminalMarkerAnimation;
        class terminalOpen;
        class terminalDetach;
    };

     class server {
        file = grad_tracking\functions\server;
        
        class bluforCaptured;
        class bluforSurrendered;
        class booleanEqual;
        class createRadioPositionMarker;
        class getTransmissionPercentage;
        class mainLoop;
        class nearestIsFinished;
        class radioTruckCookoffFix;
        class radioTruckDeploy;
        class radioTruckRetract;
        class radioVehIsSending;
        class randomizeMarker;
        class setAntennaMarkerPosition;
        class setAntennaMarkerStatus;
        class setRadioVehMarkerPosition;
        class setRadioVehMarkerSize;
        class setRadioVehMarkerStatus;
        class setTerminalMarkerPosition;
        class setTerminalMarkerStatus;
        class showTicksInstant;
        class terminalAttachToVeh;
        class terminalCalculateDistanceModifier;
        class terminalDistanceListenerServer;
        class terminalDistanceToVehCalc;
        class terminalIsSending;
    };
};