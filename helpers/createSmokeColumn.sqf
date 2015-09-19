/* A Handy-Dandy Smoke Column Generator
 * For all your smoke column generation needs!
 * Author: {C9}Jester
 * With special thanks to ColonelSandersLite for the templates found here: http://community.bistudio.com/wiki/ParticleTemplates
 * Questions? Problems? Find me in #cloud-9 on Gamesurge (irc.gamesurge.net:6667)
 *
 * ----------------------------------------------------------------------------------
 *
 * Parameters
 *
 * 0: (object) Object to attach the smoke column to
 * 1: (string) Type of smoke: "oil", "wood", "mixed" (optional; default mixed)
 * 2: (string) Size of column: "small", "medium", "large" (optional; default medium)
 *
 * Returns: true on success (but exits if there's errors)
 *
 * Side note: You should always pass an array, even if it's only one param
 *
 * ----------------------------------------------------------------------------------
 */

// PIMPED BY nomisum: this select 3 should be false to delete again

// Check that we got at least ONE arg
if ((count _this) < 1) exitWith {debugLog "Log: [C9J_fnc_smokeColumn] Function requires at least 1 parameter"; []};

private["_object", "_type", "_size", "_position", "_source1", "_source2"];

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_type = [_this, 1, "mixed", [""]] call BIS_fnc_param;
_size = [_this, 2, "medium", [""]] call BIS_fnc_param;

_position = getPos _object;

// Double check params
if((_type != "oil") and (_type != "wood") and (_type != "mixed")) exitWith {debugLog "Log: [C9J_fnc_smokeColumn] Invalid smoke type. Valid types are oil, wood, mixed"; []};

if((_size != "small") and (_size != "medium") and (_size != "large")) exitWith {debugLog "Log: [C9J_fnc_smokeColumn] Invalid smoke size. Valid sizes are small, medium, large"; []};

_source1 = "#particlesource" createVehicle _position;
_source2 = "#particlesource" createVehicle _position;

// Lazy controls statements
if(_type == "oil") then
{
	if(_size == "small") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 0.5], 0, 10, 7.9, 0.066, [1, 1.5, 2], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 0.2, 0, "", "", _object];
		_source1 setDropInterval 0.05;
	};
	if(_size == "medium") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.1;
	};
	if(_size == "large") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 6], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.1, 0.1, 0.1, 0.8], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.1;
	};
};

if(_type == "wood") then
{
	if(_size == "small") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.5, 0.5, 0.5, 0.15], [0.75, 0.75, 0.75, 0.075], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.05;
	};
	if(_size == "medium") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.5, 0.5, 0.5, 0.3], [0.75, 0.75, 0.75, 0.15], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.1;
	};
	if(_size == "large") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.5, 0.5, 0.5, 0.5], [0.75, 0.75, 0.75, 0.25], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.1;
	};
};

if(_type == "mixed") then
{
	
	if(_size == "small") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.2, 0.2, 0.2, 0.45], [0.35, 0.35, 0.35, 0.225], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.1;
		
		_source2 setParticleCircle [0, [0, 0, 0]];
		_source2 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source2 setDropInterval 0.1;
	};
	if(_size == "medium") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.2;
		
		_source2 setParticleCircle [0, [0, 0, 0]];
		_source2 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source2 setDropInterval 0.2;
	};
	if(_size == "large") then
	{
		_source1 setParticleCircle [0, [0, 0, 0]];
		_source1 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 6], "", "billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _object];
		_source1 setDropInterval 0.2;
		
		_source2 setParticleCircle [0, [0, 0, 0]];
		_source2 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _object];
		_source2 setDropInterval 0.2;
	};
};


//hintSilent format ["%1",_conditionToDelete];
waitUntil (_this select 3);
deleteVehicle _source1;
deleteVehicle _source2;