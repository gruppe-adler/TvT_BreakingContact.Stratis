class GRAD_waverespawn {

	class player {
        file = grad_waverespawn\functions\player;

        class onPlayerKilled {};
        class prepareRespawn {};
		class removeFromWaveRespawn {};
        class respawnHint {};
    };

	class server {
        file = grad_waverespawn\functions\server;

        class addPlayerToWaiting {};
        class canRespawn {};
        class checkWaiting {};
        class removePlayerWaiting {};
    };
};
