sql: rhs_6b23_6sh116
ftl: rhs_6b23_digi_6sh92_radio
medic: rhs_6b23_digi_medic
rifleman: rhs_6b23_digi_sniper
crew: rhs_6b23_digi_crewofficer
mg: rhs_6b23_digi_vydra_3m

comment "Excomment "Exported from Arsenal by nomisum";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "rhs_uniform_msv_emr";
this addVest "rhs_6b23_digi_crewofficer";
this addBackpack "rhs_sidor";
this addHeadgear "rhs_fieldcap_digi";

comment "Add weapons";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "tf_microdagr";
this linkItem "tf_anprc148jem_1";

comment "Set identity";
this setFace "GreekHead_A3_04";
this setSpeaker "ACE_NoVoice";
