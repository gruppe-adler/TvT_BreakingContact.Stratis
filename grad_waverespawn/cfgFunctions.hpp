class GRAD_waveRespawn {

	class player {
        file = GRAD_waveRespawn\functions\player;

        class onPlayerKilled {};
        class prepareRespawn {};
		class removeFromWaveRespawn {};
        class respawnHint {};
    };

	class server {
        file = GRAD_waveRespawn\functions\server;

        class addPlayerToWaiting {};
        class canRespawn {};
        class checkWaiting {};
        class removePlayerWaiting {};
    };
};
