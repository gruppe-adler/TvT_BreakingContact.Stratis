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

_createdGui = uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0];

//Define idc's for controls for easy access
_comboA = 2339;

{
	_index = lbAdd [_comboA, _x];
	_data = (_createdGui displayCtrl _comboA) lbSetData [_forEachIndex, _x];
	// hintsilent format ["adding %1 to list with index %2",_x,_forEachIndex];
} forEach ["NORTH"];



_createdGui displayCtrl 2338 ctrlMapCursor ["","HC_overFriendly"];

// _createdGui displayCtrl 2338 ctrlAddEventHandler ["onMouseButtonDown","0 = [_this] execVM 'grad_buymenu\createDropMarker.sqf'; "];
// onMapSingleClick "0 = [_pos,currentMarkerToMove] execVM 'grad_buymenu\moveDropMarker.sqf;'";
["GRAD_mapClickListener", "onMapSingleClick", {
	[_pos,currentMarkerToMove] spawn fnc_moveDropMarker;
	["GRAD_mapClickListener", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
}] call BIS_fnc_addStackedEventHandler;
