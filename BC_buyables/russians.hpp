//a different set of buyables
class RussianStuff {        
    class Vehicles {
        displayName = "Vehicles";
        kindOf = "Vehicles";

        class RHS_Ural_MSV_01 {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['standard',1], ['light_hide',1]]";
        };

        class RHS_Ural_VV_01: RHS_Ural_MSV_01 {
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['rhs_sand',1], ['light_hide',1]]";
        };


        
    };
};