#define GRID_W (pixelW * pixelGrid * 0.5)
#define GRID_H (pixelH * pixelGrid * 0.5)

// Base classes
#include "RscButton.hpp"
#include "RscCombo.hpp"
#include "RscText.hpp"

// Dialog
class BC_ww2_assignPlaneCrew
{
    idd = -1;
    movingEnable = false;
    onLoad = "_this call BC_ww2_fnc_onLoad;";
    class ControlsBackground	{};
    class Controls {
        class title: BC_ww2_RscText
        {
            x = safezoneW / 2 - 45 * GRID_W + safezoneX;
            y = safezoneH / 2 - 16.05 * GRID_H + safezoneY;
            w = 90 * GRID_W;
            h = 5.5 * GRID_H;
            text = "CHOOSE THE DESIRED PILOT (AND GUNNER)";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
        };
        class background: BC_ww2_RscText
        {
            x = safezoneW / 2 - 45 * GRID_W + safezoneX;
            y = safezoneH / 2 - 10 * GRID_H + safezoneY;
            w = 90 * GRID_W;
            h = 20 * GRID_H;
            colorBackground[] = {0,0,0,0.75};
        };
        class button: BC_ww2_RscButton
        {
            x = safezoneW / 2 + 25 * GRID_W + safezoneX;
            y = safezoneH / 2 + 10.55 * GRID_H + safezoneY;
            w = 20 * GRID_W;
            h = 5.5 * GRID_H;
            text = "CHOOSE";
            onButtonClick = "_this call BC_ww2_fnc_onButtonClick;";
        };
        class text_pilot: BC_ww2_RscText
    {
            text = "Pilot:";
            x = safezoneW / 2 - 42 * GRID_W  + safezoneX;
            y = safezoneH / 2 - 7 * GRID_H + safezoneY;
            w = 22 * GRID_W;
            h = 5.5 * GRID_H;
        };
        class text_gunner: text_pilot
        {
            text = "Gunner:";
            y = safezoneH / 2 + 1.5 * GRID_H + safezoneY;
        };
        class combo_pilot: BC_ww2_RscCombo
        {
            idc = 42;
            x = safezoneW / 2 - 20 * GRID_W  + safezoneX;
            y = safezoneH / 2 - 7 * GRID_H + safezoneY;
            w = 62 * GRID_W;
            h = 5.5 * GRID_H;
        };
        class combo_gunner: combo_pilot
        {
            idc = 7;
            y = safezoneH / 2 + 1.5 * GRID_H + safezoneY;
        };
    };
};