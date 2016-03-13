call compile preprocessFileLineNumbers "Engima\Traffic\Common\Common.sqf";
call compile preprocessFileLineNumbers "Engima\Traffic\Common\Debug.sqf";

ENGIMA_TRAFFIC_instanceIndex = -1;
ENGIMA_TRAFFIC_areaMarkerNames = [];
ENGIMA_TRAFFIC_roadSegments = [];
ENGIMA_TRAFFIC_edgeTopLeftRoads = [];
ENGIMA_TRAFFIC_edgeTopRightRoads = [];
ENGIMA_TRAFFIC_edgeBottomRightRoads = [];
ENGIMA_TRAFFIC_edgeBottomLeftRoads = [];
ENGIMA_TRAFFIC_edgeRoadsUseful = [];

if (isServer) then {
	call compile preprocessFileLineNumbers "Engima\Traffic\Server\Functions.sqf";
	call compile preprocessFileLineNumbers "Engima\Traffic\ConfigAndStart.sqf";
};


setCustomFace = 
{ 
	_thisunit = _this select 0;
	_face = _this select 1;
	_thisunit setFace _face;
	_thisunit disableConversation true;
	enableSentences false;
	_thisunit setVariable ["BIS_noCoreConversations", true];
};