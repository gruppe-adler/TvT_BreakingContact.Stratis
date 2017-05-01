class GRAD_buymenu {

    class apiplayer {
        file = grad_buymenu\functions\player\api;
        
        class apiInvalidateSupply {};
    };

    class apiserver {
        file = grad_buymenu\functions\server\api;

        class apiCreateOrder {};
    };

	class player {
        file = grad_buymenu\functions\player;

        class addOrder {};
        class calculatePicturesColumn {};
        class calculateValuesColumn {};
        class createEntries {};
		class createEntryAmount {};
        class createEntryBuyButton {};
        class createEntryETA {};
        class createEntryMouseOver {};
        class createEntryMouseOverArea {};
        class createEntryPicture {};
        class createEntryPrice {};
        class createEntrySpawnMethod {};
        class createEntrySpawnMethodMouseOverArea {};
        class createEntryTitle {};
        class createKeys {};
        class createToolbar {};
        class createToolbarCredits {};
        class createToolbarExitButton {};
        class createToolbarHeadline {};
        class displayWindInfo {};
        class getNextIDC {};
        class immediatelyLockButton {};
        class moveDropMarker {};
        class moveFirstToLast {};
        class refreshCredits {};
        class refreshEntryAmount {};
        class refreshEntryBuyButton {};
        class RefreshGui {};
        class selectNextVehicleInArray {};
        class setModelPitchBankYaw {};
        class showMarkers {};
    };

	class server {
        file = grad_buymenu\functions\server;

        class clearInventory {};
        class prepareAfterBuyRefresh {};
        class raiseBluforMoney {};
        class raiseOpforMoney {};
        class spawnChute {};
        class spawnCiv {};
        class spawnSimple {};
        class spawnSlingLoad {};
        class spawnVehicleManager {};
        class spawnWater {};
    };
};