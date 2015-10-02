// Create Diary Record - HINWEISE -
_minutes = str (POINTS_NEEDED_FOR_VICTORY/60);
player createDiaryRecord ["Diary", ["Mission",localize "str_GRAD_briefing" + " " + _minutes + " min."]];

player createDiaryRecord ["Diary", ["Story",localize "str_GRAD_story"]];