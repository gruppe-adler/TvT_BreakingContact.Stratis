class BC_objectives {

    class common {
        file = BC_objectives\functions\common;

        class init {postInit = 1; };

    };

	class player {
		file = BC_objectives\functions\player;

        class endConditionListener {};
	    class endMission {};
	    class preparationTimeCountdown {};

     };

    class server {
        file = BC_objectives\functions\server;

        class createTaskElimination {};
        class createTaskMain {};
        class loopConditions {};
        class removeTruckArmor {};
        class startPreparationTime {};
        class waitingForUnconscious {};

    };
};
