//a different set of buyables
class RussianStuff {    

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";

        class RHS_Ural_MSV_01 {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['standard',1], ['light_hide',1]]";
        };

        class RHS_Ural_VV_01: RHS_Ural_MSV_01 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_sand',1], ['light_hide',1]]";
        };

        class rhs_uaz_open_MSV_01 {
            displayName = "UAZ";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhs_uaz_open_vdv: rhs_uaz_open_MSV_01 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";

        class rhs_tigr_m_vdv {
            displayName = "Tigr-M";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhs_tigr_m_3camo_vdv: rhs_tigr_m_vdv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhsgref_nat_uaz_dshkm {
            displayName = "UAZ Dshkm";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhsgref_cdf_b_reg_uaz_dshkm: rhsgref_nat_uaz_dshkm {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };


        class rhsgref_ins_uaz_spg9 {
            displayName = "UAZ SPG9";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhsgref_nat_uaz_spg9: rhsgref_ins_uaz_spg9 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };

    };
};