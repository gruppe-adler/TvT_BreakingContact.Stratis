#include "ui_toolkit.hpp"

#define CT_STRUCTURED_TEXT          13
#define ST_LEFT                     0x00


#define GRAD_PREPARATIONTIME_W      (X_SCALE * 0.20)
#define GRAD_PREPARATIONTIME_H      (Y_SCALE * 0.045)
#define GRAD_PREPARATIONTIME_X      (safeZoneX + safeZoneW - GRAD_PREPARATIONTIME_W)
#define GRAD_PREPARATIONTIME_Y      (safeZoneY + Y_SCALE * 0.5)

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

            size = 0.04 * TEXT_SCALE;
            text = "STARTZEIT: <br/>ASD";
            class Attributes {
                font = "PuristaLight";
                color = "#ffffff";
                align = "left";
                valign = "middle";
                shadow = false;
                shadowColor = "#ff0000";
                size = 1;
            };

            w = GRAD_PREPARATIONTIME_W;
            h = GRAD_PREPARATIONTIME_H;
            x = GRAD_PREPARATIONTIME_X;
            y = GRAD_PREPARATIONTIME_Y;
        };
    };
};
