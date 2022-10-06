params ["_position"];

private _particlesSources = [];
{
	private _particleSource = "#particlesource" createVehicleLocal _position;
	private _type = _x;
	// _particleSource attachTo [_vehicle, [0,0,0]];

	_particleSource setParticleCircle [0, [0, 0, 0]];  
	_particleSource setParticleRandom [0, [1, 1, 0], [5, 5, 4], 0, 0.25, [0, 0, 0, 0.1], 0, 0];  
	_particleSource setParticleParams [
		[_type, 1, 0, 1], "", "SpaceObject", 0.5, 30, 
		[0, 0, 0.3], [5, 5, (random 100) max 50], 0.5, 200, 0.2, 0.075, [.5, .5, .5], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
		[0.08], 1, 0, "", "", _this,0,true,0.1
	];  
	_particleSource setDropInterval 0.1; 
	_particlesSources pushBackUnique _particleSource;
} forEach [
	"christmas_gifts\objects\giftbiggifts.p3d",
	"christmas_gifts\objects\giftbigsnowflakes.p3d",
	"christmas_gifts\objects\giftbigsnowmen.p3d",
	"christmas_gifts_pickable\objects\giftmediumbox.p3d",
	"christmas_gifts\objects\giftmediumtree.p3d",
	"christmas_gifts\objects\giftmediumpattern.p3d",
	"christmas_gifts\objects\giftmediumwishes.p3d",
	"christmas_gifts_pickable\objects\giftmediumround.p3d",
	"christmas_gifts\objects\giftsmallgifts.p3d",
	"christmas_gifts\objects\giftsmallstars.p3d",
	"christmas_gifts\objects\giftsmallbells.p3d"
];


[{
	GRAD_RADIO_VEH_MARKER_HIDDEN 
}, {
	params ["_particlesSources"];
	{ deleteVehicle _x; } forEach _particlesSources;
}, [_particlesSources]] call CBA_fnc_waitUntilAndExecute;



/* 



"christmas_gifts\objects\giftbiggifts.p3d"
"christmas_gifts\objects\giftbigsnowflakes.p3d"
"christmas_gifts\objects\giftbigsnowmen.p3d"
"christmas_gifts_pickable\objects\giftmediumbox.p3d"
"christmas_gifts\objects\giftmediumtree.p3d"
"christmas_gifts\objects\giftmediumpattern.p3d"
"christmas_gifts\objects\giftmediumwishes.p3d"
"christmas_gifts_pickable\objects\giftmediumround.p3d"
"christmas_gifts\objects\giftsmallgifts.p3d"
"christmas_gifts\objects\giftsmallstars.p3d"
"christmas_gifts\objects\giftsmallbells.p3d"
"a3\weapons_f\dummyitem.p3d"

*/
