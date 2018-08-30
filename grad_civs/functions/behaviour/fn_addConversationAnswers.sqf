params ["_unit"];

_unit addEventHandler ["killed", {_this execVM 'civilianOutrage\civilianKilled.sqf'}];


_unit setVariable ["sentenceDenyingCalm", [
    "Ich weiß von nichts.",
    "Ich habe niemand gesehen.",
    "Nein. Ich habe nichts gehört oder gesehen.",
    "Nein. Ich habe nichts gehört.",
    "Tut mir leid, davon weiß ich nichts.",
    "Wirklich keine Ahnung, tut mir leid.",
    "Keinen blassen Schimmer.",
    "Ich habe nichts gehört.",
    "Davon wüsste ich."
    ]];

_unit setVariable ["sentenceDenyingSerious", [
     "Bitte lasst mich laufen, ich habe keine Ahnung.",
     "Ich bin unschuldig, glaubt mir.",
     "Ich weiß wirklich nichts!",
     "Brüder, glaubt mir, ich weiß nichts!",
     "Nein, ich habe wirklich niemand gesehen!",
     "Nein! Ich schwöre bei meiner Mutter, nein!",
     "Ich weiß nichts!"
     ]];

_unit setVariable ["sentenceDenyingBegging", [
     "Aaaah, bitte lasst mich doch gehen!",
     "O Gott, o Gott, o Gott... Neiiin!",
     "Bitte, bitte! Ich weiß doch nichts!",
     "Bitte lasst mich! Ich weiß nichts!",
     "Wenn ich es euch doch sage, ich kann euch nichts sagen! Ich weiß es nicht!",
     "Gott wird euch richten!",
     "Schmort in der Hölle ihr Sadisten!",
     "Bitte nein, lasst mich leben! Bitte, ich bin unschuldig!"
     ]];

_unit setVariable ["sentenceQuestionCalm", [
     "Hast du einen fremden Piloten gesehen?",
     "Wir suchen abgeschossene Piloten.",
     "Hast du von den abgeschossenen Piloten gehört?",
     "Wir brauchen deine Hilfe - wir suchen einen Piloten!",
     "Den Piloten suchen wir. Schon von ihm gehört?",
     "Wir wollen mal nett sein und fragen erst höflich: Wo ist der Pilot?",
     "Den oder die Piloten, die abgeschossen wurden.. wo sind die?",
     "Wir suchen einen oder mehrere Piloten."
     ]];

_unit setVariable ["sentenceQuestionSerious", [
     "Wo ist der Pilot?",
     "Hör auf zu lügen!",
     "Wir wissen, wo deine Familie wohnt!",
     "Du und nichts wissen, willst du uns verarschen?",
     "Schon mal gegen ne Faust gerannt?",
     "Pass bloß auf, erzähl uns keinen Scheiß!",
     "Noch ein letztes Mal: Wo ist der verdammte Pilot?",
     "Du kannst uns nicht zum Narren halten!",
     "Rücks raus, aber plötzlich!"
     ]];


_unit setVariable ["sentenceQuestionRage", [
     "Du Penner, jetzt gibts was!",
     "Nimm das, du Stück Scheiße!",
     "Wo ist der Pilot, verdammte Kacke! Rücks raus!"
     ]];

_unit setVariable ["GRAD_civs_isQuestioned",0,true];
_unit setVariable ["GRAD_civs_hasRevealed",false,true];
_unit setVariable ["GRAD_civs_isOccupied",false,true];

_unit setVariable ["BIS_noCoreConversations", true];

if (random 1 < 0.8) then {
     _unit setVariable ["civ_knowsSomething",true,true];
} else {
     _unit setVariable ["civ_knowsSomething",false,true];
};

/*
_unit addEventHandler ["FiredNear", {
          _this execVM 'civilianOutrage\civilianFiredNear.sqf';
}];
*/

/*
_unit addEventHandler ["Hit", {
          _questioned = (_this select 0) getVariable ["GRAD_civs_isQuestioned",0];
          (_this select 0) setVariable ["GRAD_civs_isQuestioned",_questioned + 0.4,true];
}];

_unit remoteExec ["GRAD_civs_fnc_addQuestioningAction", [0,-2] select isDedicated, true];

*/