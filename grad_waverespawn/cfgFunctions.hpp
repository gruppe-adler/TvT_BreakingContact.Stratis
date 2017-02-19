class GRAD_waverespawn {

	class player {
        file = grad_waverespawn\functions\player;

        class onPlayerKilled {};
        class prepareRespawn {};
		class removeFromWaveRespawn {};
        class respawnHint {};
        class respawnOnePlusHint {};
    };

	class server {
        file = grad_waverespawn\functions\server;

        class addPlayerToWaiting {};
        class addRespawnForSide {};
        class canRespawn {};
        class checkWaiting {};
        class removePlayerWaiting {};
    };
};
