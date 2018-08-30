#include "rscDefines.hpp"

class gui_spawn_opfor
{
		idd = 8010;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_opfor_bg: BC_setup_RscBackground
			{
				idc = 8011;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class text_spawn_opfor1: BC_setup_RscStructuredText
			{
				idc = -1;
				text = "<t align='center' size='1.2'>Hello Commander!</t>";
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};

			class text_spawn_opfor2: BC_setup_RscStructuredText
			{
				idc = -1;
				text = $STR_GRAD_choose_spawn_location_hint;
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 3 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};

			class btn_spawn_opfor3: BC_setup_RscButton
			{
				idc = -1;
				text = $STR_GRAD_choose_spawn_location;
				x = 11 * GUI_GRID_W + GUI_GRID_X;
				y = 6 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0.81,0.55,0.12,1};
				tooltip = $STR_GRAD_choose_spawn_location_road;
				onButtonClick = "openMap [true,false]; player linkitem 'itemMap'; [] call BC_setup_fnc_chooseSpawn; closeDialog 0";
			};
		};
};