/*    Shows formatted hint during wave respawn time
*
*/

params ["_number"];
private ["_headline", "_lineBreak", "_text", "_hintArray"];

_headline = parseText "<t align='center' color='#708090'>Respawn available</t>";
_lineBreak = parseText "<br />";

_text = parseText format ["<t align='center' size='1.4'>Wave: %1</t>", _number];

_hintArray = [
    _headline,
    _lineBreak,
    _text
];

[composeText _hintArray] call EFUNC(common,displayTextStructured); 