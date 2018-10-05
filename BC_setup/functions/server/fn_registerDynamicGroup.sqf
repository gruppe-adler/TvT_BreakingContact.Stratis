/*
[this, 'Command'] call mission_helpers_fnc_registerDynamicGroup;
*/

params ["_unit", "_groupCallsign"];

if (isServer) then {

  private _group  = group _unit;
  private _leader = leader _group;
  _data   = [nil, _groupCallsign, false]; // [<Insignia>, <Group Name>, <Private>]

  ["RegisterGroup", [_group, _leader, _data]] call BIS_fnc_dynamicGroups;

};
