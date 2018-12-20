//a different set of buyables
class RussianStuff {        
    class Vehicles {
        displayName = "Vehicles";
        kindOf = "Vehicles";

        class C_Hatchback_01_sport_F {
            displayName = "Hatchback (Sport)";
            description = "This thing is quick";
            price = 4000;
            stock = 10;
            picture = "myPictureFolder\sportscar.paa";  //this item uses a custom picture
            code = "(_this select 2) setFuel 0.5";  //this car will spawn with half a tank of gas                
            spawnEmpty = true;
        };
    };

    class Items {
        displayName = "Items";
        kindOf = "Items";

        class ACE_fieldDressing {
            displayName = "Bandages (x10)";
            description = "10 simple bandages in sterile packaging.";
            amount = 10;
            price = 100;
            stock = 40;     //note that a total of 400 bandages can be bought (in sets of 10)
        };
    };
};