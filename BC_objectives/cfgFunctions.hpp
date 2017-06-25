class BC_objectives {

	class player {
		file = BC_objectives\functions\player;

		class endConditionListener {};
		class endMission {};
        class findRandomPos {};
		class preparationTimeCountdown {};
        class revealRadioPositionMarkers {};

	};

    class server {
        file = BC_objectives\functions\server;

        class afghanTasksBluforCreate {};
        class afghanTasksOpforCreate {};
        class classicTasksBluforCreate {};
        class classicTasksOpforCreate {};
        class createRadioPositionMarker {};
        class getIslandCfgEntry {};
        class loopConditions {};
		class startPreparationTime {};
        class waitingForUnconscious {};

    };
};
