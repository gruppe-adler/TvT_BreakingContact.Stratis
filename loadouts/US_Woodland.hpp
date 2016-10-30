
class US_Woodland: US_Desert {
	class AllUnits: AllUnits {
		uniform = "rhs_uniform_FROG01_wd";
		vest = "rhsusf_iotv_ocp_Squadleader";
		backpack = "rhsusf_assault_eagleaiii_coy";
		headgear = "rhsusf_mich_helmet_marpatwd";
	};
	class Type: Type {
		class Soldier_TL_F : Soldier_TL_F {
			backpack = "tf_rt1523g_big_bwmod";
		};
		class Soldier_SL_F: Soldier_TL_F {
			headgear = "rhs_8point_marpatwd";
			backpack = "tf_rt1523g_big_bwmod";
		};
		class officer_F: Soldier_SL_F {};
		class Crew_F: Crew_F {
			headgear = "rhsusf_cvc_green_helmet";
		};
		class Helipilot_F: Crew_F {};
	};
};
