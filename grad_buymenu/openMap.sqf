//test.sqf
// https://forums.bistudio.com/topic/156858-dialogs-rsc-listbox-rsc-combo-box/
_method = _this select 0;

_side = str side player;
currentMarkerToMove = "";

if (_side == "west") then {
	switch (_method) do {
			case "plane": { currentMarkerToMove = spawnMarkerBluforPlane;};
			case "slingload": { currentMarkerToMove = spawnMarkerBluforHelicopter;};
			default {currentMarkerToMove = spawnMarkerBluforPlane;};
	};
} else {
	switch (_method) do {
			case "plane": { currentMarkerToMove = spawnMarkerOpforPlane;};
			case "slingload": { currentMarkerToMove = spawnMarkerOpforHelicopter;};
			default {currentMarkerToMove = spawnMarkerOpforPlane;};
	};
};

disableSerialization;

0 = createDialog "GRAD_buy_menu_select_airdrop";
waitUntil {dialog};

//display ace wind info
[] spawn fnc_displayWindInfo;

_createdGui = uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0];

//Define idc's for controls for easy access
_comboA = 2339;

{
	_index = lbAdd [_comboA, _x];
	_data = (_createdGui displayCtrl _comboA) lbSetData [_forEachIndex, _x];
	// hintsilent format ["adding %1 to list with index %2",_x,_forEachIndex];
} forEach ["NORTH"];


/*
if (side player == west) then {
	switch (SPAWN_APPROACH_BLUFOR) do {
		case "NORTH": { (_createdGui displayCtrl _comboA) lbSetCurSel 0; };
		case "EAST": { (_createdGui displayCtrl _comboA) lbSetCurSel 1; };
		case "SOUTH": { (_createdGui displayCtrl _comboA) lbSetCurSel 2; };
		case "WEST": { (_createdGui displayCtrl _comboA) lbSetCurSel 3; };
		default {(_createdGui displayCtrl _comboA) lbSetCurSel 0; diag_log "resetting listbox to north"; };
	};
} else {
	switch (SPAWN_APPROACH_OPFOR) do {
		case "NORTH": { (_createdGui displayCtrl _comboA) lbSetCurSel 0; };
		case "EAST": { (_createdGui displayCtrl _comboA) lbSetCurSel 1; };
		case "SOUTH": { (_createdGui displayCtrl _comboA) lbSetCurSel 2; };
		case "WEST": { (_createdGui displayCtrl _comboA) lbSetCurSel 3; };
		default {(_createdGui displayCtrl _comboA) lbSetCurSel 0;  diag_log "resetting listbox to north"; };
	};
};
*/
//set an event to fire when a selection is made in comboA
/*
if (side player == west) then {
	(_createdGui displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged",{
	SPAWN_APPROACH_BLUFOR = (uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0] displayCtrl _comboA) lbData (_this select 1);
	publicVariable "SPAWN_APPROACH_BLUFOR";
	diag_log format ["changing blufor approach to %1", SPAWN_APPROACH_BLUFOR];
	}];
} else {
	(_createdGui displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged",{
	SPAWN_APPROACH_OPFOR = (uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0] displayCtrl _comboA) lbData (_this select 1);
	publicVariable "SPAWN_APPROACH_OPFOR";
	diag_log format ["changing opfor approach to %1", SPAWN_APPROACH_OPFOR];
	}];
};
*/
//"hintsilent format ['%1',(_this select 0) lbText (_this select 1)];

_createdGui displayCtrl 2338 ctrlMapCursor ["","HC_overFriendly"];

// _createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonDown","0 = [_this] execVM 'grad_buymenu\createDropMarker.sqf'; "];
// onMapSingleClick "0 = [_pos,currentMarkerToMove] execVM 'grad_buymenu\moveDropMarker.sqf;'";
["GRAD_mapClickListener", "onMapSingleClick", {
	[_pos,currentMarkerToMove] spawn fnc_moveDropMarker;
	["GRAD_mapClickListener", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
}] call BIS_fnc_addStackedEventHandler;

// onMapSingleClick "[_pos,_marker] call fnc_moveDropMarker; false";

/*
_createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonClick",{
		0 = [_this] execVM "grad_buymenu\moveDropMarker.sqf";
		uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0] displayCtrl 2338 ctrlMapCursor ["","Arrow"];
		diag_log "added EH click for map";
}];*/
