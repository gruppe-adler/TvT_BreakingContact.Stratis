class grad_civMarker {

  class client {
    file = grad_civMarker\functions\client;

        class civGunfightCreateClient;
        class civKilledCreateClient;
        class createCivGunfightMarker;
        class createCivKilledMarker;
        class showCivGunfightHint;
        class showCivKilledHint;
  };

  class server {
    file = grad_civMarker\functions\server;

        class civGunfightListener;
        class civKilledListener;
  };
};
