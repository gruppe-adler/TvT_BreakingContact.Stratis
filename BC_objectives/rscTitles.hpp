#define CT_STRUCTURED_TEXT          13
#define ST_LEFT                     0x00

#define GRAD_PREPARATIONTIME_W      pixelGridNoUIScale * pixelW * 10
#define GRAD_PREPARATIONTIME_H      pixelGridNoUIScale * pixelH * 3
#define GRAD_PREPARATIONTIME_X      safeZoneX + safeZoneW - GRAD_PREPARATIONTIME_W
#define GRAD_PREPARATIONTIME_Y      safeZoneY + pixelGridNoUIScale * pixelH * 30

class grad_preparationTime {
    idd = -1;
    fadein = 0;
    fadeout = 1;
    duration = 2;

    enableSimulation = 1;
    enableDisplay = 1;

    class ControlsBackground {
        class Countdown {
            onLoad = "uiNamespace setVariable ['grad_preparationTime', _this select 0];";
            onUnload = "uiNamespace setVariable ['grad_preparationTime', controlNull];";

            idc = -1;
            access = 0;
            type = CT_STRUCTURED_TEXT;
            style = ST_LEFT;
            colorBackground[] = {0,0,0,0.85};

            size = 0.018;
            text = "STARTZEIT: <br/>ASD";
            class Attributes {
                font = "PuristaLight";
                color = "#ffffff";
                align = "left";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = "2.4";
            };

            w = GRAD_PREPARATIONTIME_W;
            h = GRAD_PREPARATIONTIME_H;
            x = GRAD_PREPARATIONTIME_X;
            y = GRAD_PREPARATIONTIME_Y;
        };
    };
};
