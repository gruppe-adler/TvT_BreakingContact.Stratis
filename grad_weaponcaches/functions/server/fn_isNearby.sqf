params ["_pos", "_side", "_radius"];

({side _x == _side} count nearestObjects [_pos,["Man","Car","Tank"],_radius] > 0)