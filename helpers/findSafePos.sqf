/*
 * Joris-Jan van 't Land 's findSafePos.sqf - shortened to not return default positions
 */

scopeName "main";

private ["_pos", "_minDist", "_maxDist", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist"];
_pos = _this select 0;
_minDist = _this select 1;
_maxDist = _this select 2;
_objDist = _this select 3;
_waterMode = _this select 4;
_maxGradient = _this select 5;
_shoreMode = _this select 6;

if (_shoreMode == 0) then {_shoreMode = false} else {_shoreMode = true};

_blacklist = [];
if ((count _this) > 7) then
{
	_blacklist = _this select 7;
};

_defaultPos = [];
if ((count _this) > 8) then
{
	_defaultPos = _this select 8;
};

//See if default world values should be used.
if ((count _pos) == 0) then
{
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
};
if ((count _pos) == 0) exitWith {debugLog "Log: [findSafePos] No center position was passed!"; []}; //TODO: instead return defaults below.

if (_maxDist == -1) then
{
	_maxDist = getNumber(configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
};

//TODO: Validate parameters.

private ["_newPos", "_posX", "_posY"];
_newPos = nil;
_posX = _pos select 0;
_posY = _pos select 1;


//Limit the amount of attempts at finding a good location.
private ["_attempts"];
_attempts = 0;
while {_attempts < 1000} do
{
	private ["_newX", "_newY", "_testPos"];
	_newX = _posX + (_maxDist - (random (_maxDist * 2)));
	_newY = _posY + (_maxDist - (random (_maxDist * 2)));
	_testPos = [_newX, _newY];

	//Blacklist check.
	//TODO: Do not use function when the blacklist is empty?
	if (!([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted)) then
	{
			if ((_pos distance _testPos) >= _minDist) then
			{
				if (!((count (_testPos isFlatEmpty [_objDist, 0, _maxGradient, _objDist max 5, _waterMode, _shoreMode, objNull])) == 0)) then
				{
					_newPos = _testPos;
					breakTo "main";
				};
			};
	};

	_attempts = _attempts + 1;
};

_newPos