((findDisplay 49) displayCtrl 1010) ctrlEnable true;
with missionnamespace do {
	_cam = missionnamespace getvariable ["CSSA3_mainCamera",objnull];
	_cam cameraeffect ["terminate","back"];
	vehicle player switchCamera "INTERNAL";
	camdestroy _cam;

	CSSA3_mainCamera = nil;
	BIS_fnc_camera_target = nil;
};

//If task force radio is enabled, turn off spectator mode.
[
	"CfgPatches",
	"task_force_radio",
	"[player, false] call TFAR_fnc_forceSpectator;"
] call CSSA3_fnc_classExists;

//If ACRE2 is enabled, turn off spectator mode.
[
	"CfgPatches",
	"acre_main",
	"[false] call acre_api_fnc_setSpectator;"
] call CSSA3_fnc_classExists;

//Destroy variables. With fire... and pitchforks.
uiNameSpace setVariable ['CSSA3_mainHUD',nil];

	if (!isNil {CSSA3_target} && {!isNull CSSA3_target}) then {deleteVehicle CSSA3_target};

CSSA3_LMB = nil;
CSSA3_RMB = nil;
CSSA3_lmbDown = nil;
CSSA3_fromRose = nil;
CSSA3_canChangeUnit = nil;
CSSA3_isDraggingLB = nil;
CSSA3_favourites = nil;
CSSA3_perspective = nil;
CSSA3_selectedTab = nil;
CSSA3_keys = nil;
CSSA3_LMBclick = nil;
CSSA3_RMBclick = nil;
CSSA3_pitchbank = nil;
CSSA3_fov = nil;
CSSA3_iconCamera = nil;
CSSA3_vision = nil;
CSSA3_visibleHUD = nil;
CSSA3_settings_shown = nil;
CSSA3_settings = nil;
CSSA_fnc_DrawLine3D = nil;
CSSA3_target = nil;
CSSA3_3dpCamPos = nil;
zamf_var_allUnitsPos = nil;

if !(isNil {CSSA3_fnc_DrawLine3D}) then
{
	removemissioneventhandler ["draw3d",CSSA3_fnc_DrawLine3D];
	CSSA3_fnc_DrawLine3D = nil;
};

camusenvg false;
false SetCamUseTi 0;

//Reapply underwater PP effects.
/*_null = [] spawn {
	//suffocating
	BIS_SuffCC = ppEffectCreate ["ColorCorrections", 1610];

	// init PP to avoid artefacts after going under water.
	BIS_SuffCC ppEffectAdjust [1,1,0,[0, 0, 0, 0 ],[1, 1, 1, 1],[0,0,0,0], [-1, -1, 0, 0, 0, 0.001, 0.5]];

	BIS_SuffRadialBlur = ppEffectCreate ["RadialBlur", 270];
	BIS_SuffBlur = ppEffectCreate ["DynamicBlur", 170];
};*/

cuttext ["","plain"];
deleteVehicle CSSA3_placeHolder;

enableradio true;

//Ensure that camera is set to player.
if (alive player && {cameraon != player}) then {
	player switchCamera "INTERNAL";
};

// [] spawn CSSA3_fnc_forceReopen;

diag_log text "[CSSA3 Notice]: CSSA3 Exited. (fn_CSSA3_mainFunctions)";