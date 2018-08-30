class russians {
        class ural_wd {
            condition = "BC_BC_IS_WOODLAND";
            classname = "rhsgref_nat_ural";
            displayname = "Ural Transport";
            amount = 4;
            price = 200;
            init = [['standard',1], ['light_hide',1]];
        };

        class ural_de {
            condition = "!BC_BC_IS_WOODLAND";
            classname = "rhsgref_nat_ural";
            displayname = "Ural Transport";
            amount = 4;
            price = 200;
            init = [['rhs_sand',1], ['light_hide',1]];
        };
};