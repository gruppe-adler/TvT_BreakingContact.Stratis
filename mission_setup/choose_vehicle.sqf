_player_action = _this select 0;
vehicle_position = getPos player;



vehicle_classname_transport = "I_G_Van_01_transport_F";
vehicle_classname_tactical = "I_G_Offroad_01_armed_F";
vehicle_classname_mortar = "O_G_Mortar_01_F";
if (!IS_VANILLA) then {
		if (BLUFORCE == 0) then {
			vehicle_classname_littlebird = "MH6_Tropentarn";
			vehicle_classname_mbt = "Leopard_2A6_Tarn";
		};
		if (BLUFORCE == 1) then {
			vehicle_classname_littlebird = "MH6_Flecktarn";	
			vehicle_classname_mbt = "Leopard_2A6_Fleck";
		};
		if ((BLUFORCE == 2) || (BLUFORCE == 3)) then {
			vehicle_classname_littlebird = "B_Heli_Light_01_F";
			vehicle_classname_mbt = "RHS_M2A3_BUSKIII";
		};
	} else {
	vehicle_classname_littlebird = "B_Heli_Light_01_F";
	vehicle_classname_mbt = "B_MBT_01_TUSK_F";
};
vehicle_classname_hemtt = "B_Truck_01_covered_F";
vehicle_classname_at4_box = "box_nato_wpslaunch_f";


if (player == opfor_teamlead) then {
	player removeAction choose_vehicle_opfor; 
	 createVehicleTransport = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn Transporter",
	 {[vehicle_position,vehicle_classname_transport,east] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

	 createVehicleTactical = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn Tactical",
	 {[vehicle_position,vehicle_classname_tactical,east] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

	 createVehicleMortar = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn Mortar",
	 {[vehicle_position,vehicle_classname_mortar,east] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

	if (!MBT_VS_AT) exitWith {};

	 createVehicleAt4Box= opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn AT4 Box",
 	{[vehicle_position,vehicle_classname_at4_box,east] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

};

if (player == blufor_teamlead) then {
	player removeAction choose_vehicle_blufor; 
	 createVehicleHEMTT = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn HEMTT",
 	{[vehicle_position,vehicle_classname_hemtt,west] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

 	createVehicleLittlebird = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn Littlebird",
 	{[vehicle_position,vehicle_classname_littlebird,west] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];

 	if (!MBT_VS_AT) exitWith {};

 	createVehicleMBT = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn MBT",
	{[vehicle_position,vehicle_classname_mbt,west] execVM "mission_setup\spawnVehicle.sqf";}, _Args, 1, false, true, "","_this == _target"];


};