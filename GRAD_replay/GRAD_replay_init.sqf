// idea from a script by austin_medic
// completely reworked by nomisum for Gruppe Adler

////// SETUP
_recording_precision = _this select 0; // smaller is more precise (delay between snapshots)

GRAD_startRecording = compile preprocessFile "GRAD_replay\recording\recording.sqf";
GRAD_startPlayback = compile preprocessFile "GRAD_replay\playback\playback.sqf";

[_recording_precision] call GRAD_startRecording;

waitUntil {MISSION_COMPLETED};

[] call GRAD_startPlayback;