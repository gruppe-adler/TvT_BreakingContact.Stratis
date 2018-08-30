
class RU_Woodland: RU_Desert {
	class AllUnits: AllUnits {
		uniform = "rhs_uniform_msv_emr";
		headgear = "rhs_6b27m_digi";
	};
	class Type: Type {
		class Soldier_F: Soldier_F {
			vest = "rhs_6b23_digi_sniper";
		};
		class Soldier_AR_F: Soldier_AR_F {
			vest = "rhs_6b23_digi_vydra_3m";
		};
		class Soldier_AT_F : Soldier_AT_F{
			vest = "rhs_6b23_digi_6sh92";
		};
		class Soldier_A_F: Soldier_A_F {
			vest = "rhs_6b23_digi_sniper";
		};
		class Medic_F: Medic_F {
			vest = "rhs_6b23_digi_medic";
		};
		class Soldier_TL_F: Soldier_TL_F {
			vest = "rhs_6b23_digi_6sh92_radio";
			backpack = "tf_mr3000_bwmod";
		};
		class Soldier_SL_F: Soldier_TL_F {
			vest = "rhs_6b23_6sh116";
			headgear = "rhs_fieldcap_digi";
		};
		class officer_F: Soldier_SL_F {};
		class Crew_F: Crew_F {
			vest = "rhs_6b23_digi_crew";
		};
	};
};