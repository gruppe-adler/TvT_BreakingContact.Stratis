class GRAD_civs {

     class behaviour {
        file = grad_civs\functions\behaviour;

        class addBrainEventhandler {};
        class addConversationAnswers {};
        class findPositionOfInterest {};
        class fleeYouFool {};
        class getOpposingDirection {};
        class stopCiv {};
        class stopCivAbort {};
          class taskPatrol {};
    };

     class debug {
        file = grad_civs\functions\debug;

        class createDebugMarker {};
        class showWhatTheyThink {};
    };

    class player {
        file = grad_civs\functions\player;

        class addPointerTick {};
        class addQuestioningAction {};
        class checkWeaponOnCivilianPointer {};
        class createPilotMarker {};
        class playerLoop {};
        class removePointerTick {};
        class questionCiv {};
        class showQuestioningAnswer {};
        class startTalkLips {};
    };

    class spawn {
        file = grad_civs\functions\spawn;

        class addNewCivilian {};
        class addNewVehicle {};
        class clothDefinitions {};
        class createVehicleCargo {};
        class createVehicleDriver {};
          class dressAndBehave {};
        class findSpawnSegment {};
        class getPlayerPositions {};
        class serverLoop {};
    };
};