// 
/* this file contains notes only */
//


terminal attachTo [funkwagen,[0.25,-4.8,0]]; // perfect position for endgame terminal to attach on gaz66 142

hiddenSelections[] = {"Camo_1","Camo_2","Camo_3","Camo_4","Camo_5"}; // terminal camos
hiddenSelectionsMaterials[] = {"\A3\Data_F\Lights\Lamp_lcd.rvmat","\A3\Data_F\Lights\Lamp_lcd.rvmat","\A3\Props_F_Exp_A\Military\Equipment\Data\DataTerminal_blue.rvmat","\A3\Props_F_Exp_A\Military\Equipment\Data\DataTerminal_orange.rvmat","\A3\Props_F_Exp_A\Military\Equipment\Data\DataTerminal_green.rvmat"};
hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0,0,0,0.0,co)","#(argb,8,8,3)color(0,0,0,0.0,co)","#(argb,8,8,3)color(0,1,1,1.0,co)","#(argb,8,8,3)color(0.75,0.5,0,1.0,co)","#(argb,8,8,3)color(0.25,0.75,0.25,1.0,co)"};


hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0,0,0,0.0,co)","#(argb,8,8,3)color(0,0,0,0.0,co)","#(argb,8,8,3)color(0,1,1,1.0,co)","#(argb,8,8,3)color(0.75,0.5,0,1.0,co)","#(argb,8,8,3)color(0.25,0.75,0.25,1.0,co)"};



terminal setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
terminal setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
terminal setObjectTextureGlobal [2, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
terminal setObjectTextureGlobal [3, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
terminal setObjectTextureGlobal [4, "#(argb,8,8,3)color(0,0,0,0.0,co)"];










///////////////////////
[_unit, true, [0,1.1,0.092], 180] call FUNC(setDraggable);


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_targetEvent;

["SetHandcuffed", [guy1, true]] call ace_common_fnc_localEvent;


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_localEvent;

hedgehog = "Hedgehog" createVehicle position player; [hedgehog, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;

[hedgehog, vehicle] call ace_cargo_fnc_loadItem;

["LoadCargo", {hedgehog call FUNC(loadItem)}] call EFUNC(common,addEventHandler);

//[localize "str_GRAD_hint_bluforSpawned"] call EFUNC(common,displayTextStructured);

_hedgehog = "Hedgehog" createVehicle (getpos (_this select 0));
            [_hedgehog, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;
            _hedgehog setVariable ["ace_cargo_size", 1, true];
            [_hedgehog, _this select 0] call ace_cargo_fnc_loadItem;


"Land_BagFenceRound",
"Land_BagFenceLong"