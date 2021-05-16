/*
*   Original function from ace_logistics_wirecutter by PabstMirror
*   Adapted for grad_axe by McDiod
*   Adapted for BC_vietnam by nomisum
*/

params ["_interactionType"];

//Ignore self-interaction menu or mounted vehicle interaction
if ((_interactionType != 0) || {(vehicle ACE_player) != ACE_player}) exitWith {};

//for performance only do stuff it they have a wirecutter item
//(if they somehow get one durring keydown they'll just have to reopen)

[{
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedHelpers", "_treesHelped", "_helperQueue"];

    if (!ace_interact_menu_keydown) then {
        {deleteVehicle _x; nil} count _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {

        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) > 5) then {

            private _fncStatement = {
                params ["_helper", "_player", "_attachedTree"];
                private _positionHelper = getPos _helper;
                [_positionHelper, _player, _attachedTree] call BC_vietnam_fnc_buildProgress;
            };

            private _fncCondition = {
                params ["_helper", "_player", "_attachedTree"];

                if (!([_player, _attachedTree, ["isNotSwimming"]] call ace_common_fnc_canInteractWith)) exitWith {false};

                    // systemChat "can interact";

                ((!isNull _attachedTree) && {(damage _attachedTree) < 1} && {
                    //Custom LOS check for tree
                    private _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
                    ((!(lineIntersects [AGLtoASL _headPos, AGLtoASL (_helper modelToWorldVisual [0,0,1.25]), _attachedTree, ACE_player])) ||
                    {!(lineIntersects [AGLtoASL _headPos, getPosASL _attachedTree, _attachedTree, ACE_player])})
                } &&
                {!(_attachedTree getVariable ["BC_vietnam_hasSniperNest", false])})
            };

            {
                _treesHelped pushBack _x;
                private _helper = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                private _action = ["BC_vietnam_cutDownTree","Build Sniper Nest","x\grad\addons\axe\ui\action_axe_ca.paa", _fncStatement, _fncCondition, {}, _x, {[0,0,0]}, 5.5, [false, false, false, false, true]] call ace_interact_menu_fnc_createAction;
                [_helper, 0, [],_action] call ace_interact_menu_fnc_addActionToObject;
                _addedHelpers pushBack _helper;
                _helperQueue pushBack [_helper,_x];
            } forEach (
                (nearestTerrainObjects [ace_player, ["TREE", "SMALL TREE"], 15]) select {
                    !(_x in _treesHelped) &&
                    {!isObjectHidden _x}
                }
            );

            [{
                params ["_helperQueue","_PFHID"];
                if (count _helperQueue == 0) exitWith {[_PFHID] call CBA_fnc_removePerFrameHandler};
                (_helperQueue deleteAt 0) params ["_helper","_tree"];
                _helper setPosASL ([_tree] call BC_vietnam_fnc_findTrunk);
            },0.1,_helperQueue] call CBA_fnc_addPerFrameHandler;

            _args set [0, (getPosASL ace_player)];
        };
    };
}, 0.1, [((getPosASL ace_player) vectorAdd [-100,0,0]),[],[],[]]] call CBA_fnc_addPerFrameHandler;
