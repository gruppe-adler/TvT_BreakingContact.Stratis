class BC_objectives {

	class player {
		file = BC_objectives\functions\player;

		class endConditionListener {};
		class endMission {};
		class preparationTimeCountdown {};

	};

    class server {
        file = BC_objectives\functions\server;

        class afghanTasksBluforCreate {};
        class afghanTasksOpforCreate {};
        class classicTasksBluforCreate {};
        class classicTasksOpforCreate {};
        class loopConditions {};
		class startPreparationTime {};
        class waitingForUnconscious {};

    };
};
