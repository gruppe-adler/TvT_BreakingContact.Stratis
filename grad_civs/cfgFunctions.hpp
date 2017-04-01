class GRAD_civs {

	class behaviour {
        file = grad_civs\functions\behaviour;

        class findPositionOfInterest {};
        class fleeAndFake {};
        class fleeYouFool {};
		class taskPatrol {};
    };

	class debug {
        file = grad_civs\functions\debug;

        class createDebugMarker;
    };

    class player {
        file = grad_civs\functions\player;

        class checkWeaponOnCivilianPointer {};
        class playerLoop {};
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