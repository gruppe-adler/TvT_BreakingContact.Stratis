// idea from a script by austin_medic
// completely reworked by nomisum for Gruppe Adler

////// SETUP
_recording_precision = 1; // smaller is more precise (delay between snapshots)
_playback_speed = 0.1; // smaller is faster (delay between playback steps)

GRAD_startRecording = compile preprocessFile "GRAD_replay\recording\recording.sqf";
GRAD_startPlayback = compile preprocessFile "GRAD_replay\playback\playback_new.sqf";

[_recording_precision] call GRAD_startRecording;

waitUntil {MISSION_COMPLETED};

[_playback_speed] call GRAD_startPlayback;