params ["_civilian", "_player"];
  
doStop _civilian;
_civilian setVariable ["GRAD_civs_brainStop", 1, true];

diag_log format ["executing GRAD_civs_fnc_questionCiv with civ %1 and player %2 ...", _civilian, _player];



// dont do anything if the civilian is already in 'use'
if (_civilian getVariable ["GRAD_civs_civOccupied",false]) exitWith {};


 _sentenceGetOffMe = selectRandom [
  "Ich hab euch schon alles gesagt, was ihr hören wolltet!",
  "Mehr weiß ich nicht! Ihr habt alles gehört!",
  "Mehr kann ich euch nicht sagen! Geht jetzt.",
  "Ich habe euch bereits geholfen."
];

// exit if civ was already interviewed
if (_civilian getVariable ["isInterviewedByWest",false] && side _player == west) exitWith {
    [position _civilian,"Nochmal: Wo ist der Pilot?", []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    sleep 4;
    [position _civilian,_sentenceGetOffMe, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["GRAD_civs_civOccupied",false,true];
    _civilian doFollow _civilian;
 };

 if (_civilian getVariable ["isInterviewedByEast",false] && side _player == east) exitWith {
    [position _civilian,"Nochmal: Wo ist der Pilot?", []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    sleep 4;
    [position _civilian,_sentenceGetOffMe, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["GRAD_civs_civOccupied",false,true];
    _civilian doFollow _civilian;
 };

_civilian setVariable ["GRAD_civs_civOccupied",true,true];


_GRAD_civs_isQuestioned = _civilian getVariable ["GRAD_civs_isQuestioned",0];
_civilian setVariable ["GRAD_civs_isQuestioned",_GRAD_civs_isQuestioned + 0.05,true];

_knowsSomething = _civilian getVariable ["civ_knowsSomething",false];
_alreadyRevealed = _civilian getVariable ["GRAD_civs_hasRevealed",false];

_sentenceDenyingCalmArray = _civilian getVariable ["sentenceDenyingCalm",["Ich weiß nichts."]];
_sentenceDenyingSeriousArray = _civilian getVariable ["sentenceDenyingSerious",["Bitte, ich weiß nichts."]];
_sentenceDenyingBeggingArray = _civilian getVariable ["sentenceDenyingBegging",["Aaaaaah..."]];

_sentenceDenyingCalm = selectRandom _sentenceDenyingCalmArray;
_sentenceDenyingSerious = selectRandom _sentenceDenyingSeriousArray;
_sentenceDenyingBegging = selectRandom _sentenceDenyingBeggingArray;

_sentenceQuestionCalmArray = _civilian getVariable ["sentenceQuestionCalm",["Wo ist der Pilot?"]];
_sentenceQuestionSeriousArray = _civilian getVariable ["sentenceQuestionSerious",["Erzähl uns keine Scheiße!"]];
_sentenceQuestionRageArray = _civilian getVariable ["sentenceQuestionRage",["Du verdammter Wichser, wir hängen dich auf wenn du nichts rausrückst!"]];

_sentenceQuestionCalm = selectRandom _sentenceQuestionCalmArray;
_sentenceQuestionSerious = selectRandom _sentenceQuestionSeriousArray;
_sentenceQuestionRage = selectRandom _sentenceQuestionRageArray;

_sentenceReveal = selectRandom [
	"Ja, ja.. ich sag es ja. Ich hab jemanden gesehen bei ",
	"Ok, ok. Ich habe gehört, jemand sei bei ",
	"Gut, ich hab etwas gesehen bei ",
	"Lasst mich und ich verrate euch auch alles. Ich habe gehört, es sei jemand bei ",
	"Ich habe gehört bei "
	];



_chanceToReveal = 0.2;


 


if (side _player == west) then {
  _chanceToReveal = CHANCE_TO_REVEAL_BLUFOR + _GRAD_civs_isQuestioned;
} else {
  _chanceToReveal = CHANCE_TO_REVEAL_OPFOR + _GRAD_civs_isQuestioned;
};

// even if he already revealed sth you might ask and reveal again! good for other sides coming by... but beware he will be dead somewhen.
if (_knowsSomething) exitWith {
	if (random 1 > _chanceToReveal) then {
		if (_GRAD_civs_isQuestioned < 0.4) then {
      [position _civilian,_sentenceQuestionCalm, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionCalm", _sentenceQuestionCalmArray - [_sentenceQuestionCalm],true];
			sleep 4;
			[_civilian] spawn GRAD_civs_fnc_startTalkLips;
			[position _civilian,_sentenceDenyingCalm, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm],true];
		};
		if (_GRAD_civs_isQuestioned >= 0.4 && _GRAD_civs_isQuestioned <= 0.7) then {
      [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
      [_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
			sleep 0.5;

      [_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
			sleep 0.1;
      [_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
			sleep 1.9;
			[_player, "AidlPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", _player];
			[_civilian] spawn GRAD_civs_fnc_startTalkLips;
			[position _civilian,_sentenceDenyingSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious],true];
		};

		
  if (_GRAD_civs_isQuestioned > 0.4) then {
      _damage = (random 0.3);
      [_civilian, _damage, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
      _civilian setVariable ["ACE_medical_lastDamageSource",_player];
      _civilian playMoveNow "RHS_flashbang_cover";
      sleep 0.1;
      _civilian disableAI "ANIM";
  };

		if (_GRAD_civs_isQuestioned > 0.7) then {
      [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
			[_player, "Acts_Executioner_Backhand"] remoteExec ["playMoveNow", _player];
			sleep 0.5;
			[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
			sleep 0.1;
			[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
			sleep 4;
			[_player, "AidlPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", _player];
			[_civilian] spawn GRAD_civs_fnc_startTalkLips;
			[position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
      _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];
     
		};

	} else {
    [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    diag_log "civilian knows and talks";
		sleep 4;
		[_civilian] spawn GRAD_civs_fnc_startTalkLips;
		[position _civilian,format ["Zivilist: %1",_sentenceReveal + (CURRENT_PILOTS_POSITION select 0) + ". Ich markiere es auf eurer Karte."],[CURRENT_PILOTS_POSITION select 1, CURRENT_PILOTS_POSITION select 2]] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
		_civilian setVariable ["GRAD_civs_hasRevealed",true,true];

    if (side _player == west) then {
      _civilian setVariable ["isInterviewedByWest",true,true];
    } else {
      _civilian setVariable ["isInterviewedByEast",true,true];
    };
	};
	_civilian setVariable ["GRAD_civs_civOccupied",false,true];
};

if (!_knowsSomething) exitWith {
	if (_GRAD_civs_isQuestioned < 0.4) then {
    [position _civilian,_sentenceQuestionCalm, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceQuestionCalm", _sentenceQuestionCalmArray - [_sentenceQuestionCalm],true];
		sleep 4;
		[_civilian] spawn GRAD_civs_fnc_startTalkLips;
		[position _civilian,_sentenceDenyingCalm, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceDenyingCalm", _sentenceDenyingCalmArray - [_sentenceDenyingCalm],true];

	};
	if (_GRAD_civs_isQuestioned >= 0.4 && _GRAD_civs_isQuestioned <= 0.7) then {
    [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
		[_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
		sleep 0.5;
		[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
		sleep 0.1;
		[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
		sleep 1.9;
		[_player, "AidlPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", _player];
		[_civilian] spawn GRAD_civs_fnc_startTalkLips;
		[position _civilian,_sentenceDenyingSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceDenyingSerious", _sentenceDenyingSeriousArray - [_sentenceDenyingSerious],true];
	};
	if (_GRAD_civs_isQuestioned > 0.7) then {
    [position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
		[_player, "Acts_Executioner_Backhand"] remoteExec ["playMoveNow", _player];
		sleep 0.5;
		[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
		sleep 0.1;
		[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
		sleep 4;
		[_player, "AidlPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", _player];
		[_civilian] spawn GRAD_civs_fnc_startTalkLips;
		[position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
    _civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];
    
	};

	if (_GRAD_civs_isQuestioned > 0.4) then {
			_damage = (random 0.3);
			[_civilian, _damage, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
			_civilian setVariable ["ACE_medical_lastDamageSource",_player];
      _civilian playMoveNow "RHS_flashbang_cover";
      sleep 0.1;
      _civilian disableAI "ANIM";
	};

	// when someone questions too hard, reveal something random
	if (_GRAD_civs_isQuestioned > 3 && alive _civilian) then {
    diag_log "civilian doesnt know and talks";
		_location = ((nearestLocations [getPos _civilian,
   			[
		    "NameCity",
		    "NameCityCapital",
		    "NameMarine",
		    "NameVillage",
		    "NameLocal"
		   ],6000]) call BIS_fnc_selectRandom);
		_text = text _location;
		[_civilian] spawn GRAD_civs_fnc_startTalkLips;
		[position _civilian,format ["Zivilist: %1",_sentenceReveal + _text + ". Ich markiere es auf eurer Karte."],[getpos _location]] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
		_civilian setVariable ["GRAD_civs_hasRevealed",true,true];

    if (side _player == west) then {
      _civilian setVariable ["isInterviewedByWest",true,true];
    } else {
      _civilian setVariable ["isInterviewedByEast",true,true];
    };

	};

	_civilian setVariable ["GRAD_civs_civOccupied",false,true];
};

// if you just go on hitting him...


if (_GRAD_civs_isQuestioned > 0.4) then {
  _damage = (random 0.3);
  [_civilian, _damage, "leg_l", "punch"] call ace_medical_fnc_addDamageToUnit;
  _civilian setVariable ["ACE_medical_lastDamageSource",_player];
  _civilian playMoveNow "RHS_flashbang_cover";
  sleep 0.1;
  _civilian disableAI "ANIM";
};


[position _civilian,_sentenceQuestionSerious, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
_civilian setVariable ["sentenceQuestionSerious", _sentenceQuestionSeriousArray - [_sentenceQuestionSerious],true];
[_player, "Acts_Executioner_Forehand"] remoteExec ["playMoveNow", _player];
sleep 0.5;
[_civilian, selectRandom ["smack1","smack2","smack3"]] remoteExec ["say3D",0,false];
sleep 0.1;
[_civilian, selectRandom ["ouch1","ouch2","ouch3"]] remoteExec ["say3D",0,false];
sleep 4;
[_player, "AidlPercMstpSnonWnonDnon_G01"] remoteExec ["switchMove", _player];
[_civilian] spawn GRAD_civs_fnc_startTalkLips;
[position _civilian,_sentenceDenyingBegging, []] remoteExec ["GRAD_civs_fnc_showQuestioningAnswer", [0, -2] select isMultiplayer, false];
_civilian setVariable ["sentenceDenyingBegging", _sentenceDenyingBeggingArray - [_sentenceDenyingBegging],true];

_civilian setVariable ["GRAD_civs_civOccupied",false,true];