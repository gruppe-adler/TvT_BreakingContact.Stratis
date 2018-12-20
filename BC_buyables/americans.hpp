//buyables set:
class AmericanStuff {

    //category:  
    class Weapons {
        kindOf = "Weapons";
        displayName = "Weapons";

        //items of this category:
        class rhs_weap_m240G {
            displayName = "M240G";
            description = "The M240 is a belt-fed, gas-operated general purpose machine gun firing the 7.62x51mm NATO cartridge.";
            price = 2500;
            stock = 5;
            opticsItem = "optic_Aco";
        };
    };

    class Units {
        displayname = "Units";
        kindOf = "Units";
        tracking = 0;

        class B_Soldier_SL_F {
            displayName = "NATO Squadleader (x3)";
            description = "This is a team of NATO squad leaders.";
            price = 3000;
            amount = 3;
            stock = 5;
            code = "{_x removeWeaponGlobal (primaryWeapon _x)} forEach units (_this select 2)";
        };
    };
};