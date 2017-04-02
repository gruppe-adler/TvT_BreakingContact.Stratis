class GRAD_civs {

	class behaviour {
        file = grad_civs\functions\behaviour;

        class findPositionOfInterest {};
        class fleeAndFake {};
        class fleeYouFool {};
        class stopCiv {};
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
        class checkWeaponOnCivilianPointer {};
        class playerLoop {};
        class removePointerTick {};
    };

    class spawn {
        file = grad_civs\functions\spawn;

        class addNewCivilian {};
        class clothDefinitions {};
		class dressAndBehave {};
        class findSpawnSegment {};
        class getPlayerPositions {};
        class serverLoop {};
    };
};