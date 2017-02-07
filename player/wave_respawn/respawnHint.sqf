/*    Shows formatted hint during wave respawn time
*
*/

params ["_side","_status"];
private ["_status"];

_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------</t></t>";
_lineBreak = parseText "<br />";

if (isNil "_status") then {
    _status = switch (_side) do {
        case (WEST): {WAVERESPAWNSTATUSBLU};
        case (EAST): {WAVERESPAWNSTATUSOPF};
        default {"ERROR - UNKOWN SIDE"};
    };
};

_status = parseText format ["<t align='center' size='1.4'>%1</t>",_status];

_playerTimeLeft = player getVariable "wr_playerRespawnTimeLeft";
_playerTimeLeftStr = parseText format ["<t align='center' size='1.4'>Player: <t color='%1'>%2</t></t>", if (_playerTimeLeft > 0) then {'#ffff00'} else {'#00ff00'},[_playerTimeLeft, "MM:SS"] call BIS_fnc_secondsToString];

_waveTimeLeft = call (player getVariable "wr_waveTimeLeft");
_timeLeftStr = [_waveTimeLeft, "MM:SS"] call BIS_fnc_secondsToString;
_playersLeft = call (player getVariable "wr_playersLeft");
_waveSize = player getVariable "wr_waveSize";
_waveLeftStr = parseText format ["<t align='center' size='1.4'>Wave: <t color='%3'>%1/%2</t> - <t color ='%4'>%5</t></t>", _waveSize - _playersLeft, _waveSize, if (_playersLeft > 0) then {'#ffff00'} else {'#00ff00'},if (_waveTimeLeft > 0) then {'#ffff00'} else {'#00ff00'}, _timeLeftStr];

_maxTime = parseText format ["<t align ='center' size='0.7'>Skipping waiting time in: %1.</t>", [MAXRESPAWNTIME - (time - (player getVariable ["wr_timeOfDeath",time])),"MM:SS"] call BIS_fnc_secondsToString];


_hintArray = [
    _rule,
    _lineBreak,
    _playerTimeLeftStr,
    _lineBreak,
    _waveLeftStr,
    _lineBreak,
    _status,
    _lineBreak,
    _rule,
    _lineBreak,
    _maxTime
];

hintSilent composeText _hintArray;