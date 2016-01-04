class russianSupplyGUI
{
		idd = 1000;
		movingenable = 0;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; [1000,[1801,1802,1803,1804,1805,1806,1807]] execVM 'spawn\gui\hideControl.sqf';";


		class ControlsBackground
		{
			class dlgBackground: background
			{
				idc = 1999;
				x = -10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 60 * GUI_GRID_W;
				h = 19 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};


		};

		class Controls {

			class russian_gui_btn_anfordern_1: RscButton
			{
				idc = 1501;
				text = $STR_GRAD_buy_order;
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_2: RscButton
			{
				idc = 1502;
				text = $STR_GRAD_buy_order;
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_3: RscButton
			{
				idc = 1503;
				text = $STR_GRAD_buy_order;
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_4: RscButton
			{
				idc = 1504;
				text = $STR_GRAD_buy_order;
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_5: RscButton
			{
				idc = 1505;
				text = $STR_GRAD_buy_order;
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_6: RscButton
			{
				idc = 1506;
				text = $STR_GRAD_buy_order;
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_7: RscButton
			{
				idc = 1507;
				text = $STR_GRAD_buy_order;
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_pic_1: RscPicture
			{
				idc = 1001;
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_gaz66.paa";
			};

			class russian_gui_pic_2: RscPicture
			{
				idc = 1002;
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_tigr.paa";
			};

			class russian_gui_pic_3: RscPicture
			{
				idc = 1003;
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_gaz66_repair.paa";
			};

			class russian_gui_pic_4: RscPicture
			{
				idc = 1004;
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_uaz_dshkm.paa";
			};

			class russian_gui_pic_5: RscPicture
			{
				idc = 1005;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_btr70.paa";
			};

			class russian_gui_pic_6: RscPicture
			{
				idc = 1006;
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_t72.paa";
			};

			class russian_gui_pic_7: RscPicture
			{
				idc = 1007;
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_static_mg.paa";
			};
			
			class russian_gui_text_namedisplay_1: RscStructuredText
			{
				idc = 1101;
				text = "<t align='center'>lade...</t>";
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_2: RscStructuredText
			{
				idc = 1102;
				text = "<t align='center'>lade ...</t>";
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_3: RscStructuredText
			{
				idc = 1103;
				text = "<t align='center'>lade ...</t>";
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_4: RscStructuredText
			{
				idc = 1104;
				text = "<t align='center'>lade ...</t>";
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_5: RscStructuredText
			{
				idc = 1105;
				text = "<t align='center'>lade ...</t>";
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_6: RscStructuredText
			{
				idc = 1106;
				text = "<t align='center'>lade ...</t>";
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_7: RscStructuredText
			{
				idc = 1107;
				text = "<t align='center'>lade ...</t>";
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_1: RscStructuredText
			{
				idc = 1201;
				text = "<t align='center'>lade ...</t>";
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_2: RscStructuredText
			{
				idc = 1202;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_3: RscStructuredText
			{
				idc = 1203;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_4: RscStructuredText
			{
				idc = 1204;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_5: RscStructuredText
			{
				idc = 1205;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_6: RscStructuredText
			{
				idc = 1206;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_countleft_7: RscStructuredText
			{
				idc = 1207;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_1: RscStructuredText
			{
				idc = 1301;
				text = "<t align='center'>lade ...</t>";
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_2: RscStructuredText
			{
				idc = 1302;
				text = "<t align='center'>lade ...</t>";
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_3: RscStructuredText
			{
				idc = 1303;
				text = "<t align='center'>lade ...</t>";
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_4: RscStructuredText
			{
				idc = 1304;
				text = "<t align='center'>lade ...</t>";
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_5: RscStructuredText
			{
				idc = 1305;
				text = "<t align='center'>lade ...</t>";
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_6: RscStructuredText
			{
				idc = 1306;
				text = "<t align='center'>lade ...</t>";
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_7: RscStructuredText
			{
				idc = 1307;
				text = "<t align='center'>lade ...</t>";
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_namedisplay: RscStructuredText
			{
				idc = 1401;
				text = $STR_GRAD_buy_legend_vehicle;
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {0.5,0.5,0.5,1};
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_price: RscStructuredText
			{
				idc = 1402;
				text = $STR_GRAD_buy_legend_price;
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_countleft: RscStructuredText
			{
				idc = 1403;
				text = $STR_GRAD_buy_legend_count;
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};

			class russian_gui_tooltip_1: RscStructuredTextTooltip
			{
				idc = 1801;
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1801] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1801]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_2: RscStructuredTextTooltip
			{
				idc = 1802;
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1802] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1802]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_3: RscStructuredTextTooltip
			{
				idc = 1803;
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1803] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1803]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_4: RscStructuredTextTooltip
			{
				idc = 1804;
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1804] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1804]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_5: RscStructuredTextTooltip
			{
				idc = 1805;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1805] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1805]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_6: RscStructuredTextTooltip
			{
				idc = 1806;
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1806] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1806]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class russian_gui_tooltip_7: RscStructuredTextTooltip
			{
				idc = 1807;
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [1000,1807] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [1000,[1807]] execVM 'spawn\gui\hideControl.sqf';";
			};

			class russian_gui_text_headline: RscStructuredTextHeadline
			{
				idc = 1600;
				text = $STR_GRAD_buy_headline;
				x = 2 * GUI_GRID_W + GUI_GRID_X;
				y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 36 * GUI_GRID_W;
				h = 2.5 * GUI_GRID_H;
				colorText[] = {0.3,0.3,0.3,0.5};

			};
			class russian_gui_text_credits_remaining: RscStructuredText
			{
				idc = 1700;
				text = "<t align='left'>3000 cr</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 4.5 * GUI_GRID_W;
				h = 2.5 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
				tooltip = $STR_GRAD_buy_credits_hint;
				lineSpacing = 0.4;
			};
			class russian_gui_btn_close: RscButtonSmall
			{
				idc = -1;
				text = $STR_GRAD_buy_exit;
				x = 43.5 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {0,0,0,1};
				tooltip = "Dialog schließen";
				action = "closeDialog 0";
				onMouseEnter = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
				onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 0.5]";
				period = 0;
			};
		};
};



class USSupplyGUI
{
		idd = 3000;
		movingenable = 0;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; [3000,[3801,3802,3803,3804,3805,3806,3807]] execVM 'spawn\gui\hideControl.sqf';";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				idc = 3999;
				x = -10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 60 * GUI_GRID_W;
				h = 19 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};


		};

		class Controls {

			class US_gui_btn_anfordern_1: RscButton
			{
				idc = 3501;
				text = $STR_GRAD_buy_order;
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_2: RscButton
			{
				idc = 3502;
				text = $STR_GRAD_buy_order;
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_3: RscButton
			{
				idc = 3503;
				text = $STR_GRAD_buy_order;
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_4: RscButton
			{
				idc = 3504;
				text = $STR_GRAD_buy_order;
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_5: RscButton
			{
				idc = 3505;
				text = $STR_GRAD_buy_order;
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_6: RscButton
			{
				idc = 3506;
				text = $STR_GRAD_buy_order;
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_7: RscButton
			{
				idc = 3507;
				text = $STR_GRAD_buy_order;
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = $STR_GRAD_buy_order_hint;
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_pic_1: RscPicture
			{
				idc = 3001;
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_hmmvv_transport.paa";
			};
			class US_gui_pic_2: RscPicture
			{
				idc = 3002;
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_hmmvv_m2.paa";
			};
			class US_gui_pic_3: RscPicture
			{
				idc = 3003;
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_m113_m2.paa";
			};
			class US_gui_pic_4: RscPicture
			{
				idc = 3004;
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_m113_ammo.paa";
			};
			class US_gui_pic_5: RscPicture
			{
				idc = 3005;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_parachutes.paa";
			};
			class US_gui_pic_6: RscPicture
			{
				idc = 3006;
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_mh6.paa";
			};
			class US_gui_pic_7: RscPicture
			{
				idc = 3007;
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_uh60.paa";
			};
			class US_gui_text_namedisplay_1: RscStructuredText
			{
				idc = 3101;
				text = "<t align='center'>lade...</t>";
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_2: RscStructuredText
			{
				idc = 3102;
				text = "<t align='center'>lade ...</t>";
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_3: RscStructuredText
			{
				idc = 3103;
				text = "<t align='center'>lade ...</t>";
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_4: RscStructuredText
			{
				idc = 3104;
				text = "<t align='center'>lade ...</t>";
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_5: RscStructuredText
			{
				idc = 3105;
				text = "<t align='center'>lade ...</t>";
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_6: RscStructuredText
			{
				idc = 3106;
				text = "<t align='center'>lade ...</t>";
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_7: RscStructuredText
			{
				idc = 3107;
				text = "<t align='center'>lade ...</t>";
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_1: RscStructuredText
			{
				idc = 3201;
				text = "<t align='center'>lade ...</t>";
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_2: RscStructuredText
			{
				idc = 3202;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_3: RscStructuredText
			{
				idc = 3203;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_4: RscStructuredText
			{
				idc = 3204;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_5: RscStructuredText
			{
				idc = 3205;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_6: RscStructuredText
			{
				idc = 3206;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_countleft_7: RscStructuredText
			{
				idc = 3207;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_1: RscStructuredText
			{
				idc = 3301;
				text = "<t align='center'>lade ...</t>";
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_2: RscStructuredText
			{
				idc = 3302;
				text = "<t align='center'>lade ...</t>";
				x = 3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_3: RscStructuredText
			{
				idc = 3303;
				text = "<t align='center'>lade ...</t>";
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_4: RscStructuredText
			{
				idc = 3304;
				text = "<t align='center'>lade ...</t>";
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_5: RscStructuredText
			{
				idc = 3305;
				text = "<t align='center'>lade ...</t>";
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_6: RscStructuredText
			{
				idc = 3306;
				text = "<t align='center'>lade ...</t>";
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_7: RscStructuredText
			{
				idc = 3307;
				text = "<t align='center'>lade ...</t>";
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_legend_namedisplay: RscStructuredText
			{
				idc = 3401;
				text = "<t color='#80ffffff'>Fahrzeug</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {0.5,0.5,0.5,1};
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_legend_price: RscStructuredText
			{
				idc = 3402;
				text = "<t color='#80ffffff'>Kosten</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_legend_countleft: RscStructuredText
			{
				idc = 3403;
				text = "<t color='#80ffffff'>Anzahl verf.</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};

			class US_gui_tooltip_1: RscStructuredTextTooltip
			{
				idc = 3801;
				x = -3.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3801] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3801]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_2: RscStructuredTextTooltip
			{
				idc = 3802;
				x = 4.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3802] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3802]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_3: RscStructuredTextTooltip
			{
				idc = 3803;
				x = 12 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3803] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3803]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_4: RscStructuredTextTooltip
			{
				idc = 3804;
				x = 19.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3804] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3804]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_5: RscStructuredTextTooltip
			{
				idc = 3805;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3805] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3805]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_6: RscStructuredTextTooltip
			{
				idc = 3806;
				x = 34.5 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3806] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3806]] execVM 'spawn\gui\hideControl.sqf';";
			};
			class US_gui_tooltip_7: RscStructuredTextTooltip
			{
				idc = 3807;
				x = 42 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 12 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8}; 
				text = "loading";
				size = 0.028;
				onMouseEnter = "disableSerialization; [3000,3807] execVM 'spawn\gui\showControl.sqf';";
				onMouseExit = "disableSerialization; [3000,[3807]] execVM 'spawn\gui\hideControl.sqf';";
			};

			class US_gui_text_headline: RscStructuredTextHeadline
			{
				idc = 3600;
				text = $STR_GRAD_buy_headline;
				x = 2 * GUI_GRID_W + GUI_GRID_X;
				y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 36 * GUI_GRID_W;
				h = 2.5 * GUI_GRID_H;
				colorText[] = {0.3,0.3,0.3,0.5};

			};
			class US_gui_text_credits_remaining: RscStructuredText
			{
				idc = 3700;
				text = "<t align='left'>3000 cr</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 4.5 * GUI_GRID_W;
				h = 2.5 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
				tooltip = $STR_GRAD_buy_credits_hint;
				lineSpacing = 0.4;
			};
			class US_gui_btn_close: RscButtonSmall
			{
				idc = -1;
				text = $STR_GRAD_buy_exit;
				x = 43.5 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1.5 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {0,0,0,1};
				tooltip = "Dialog schließen";
				action = "closeDialog 0";
				onMouseEnter = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
				onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 0.5]";
				period = 0;
			};
		};
};


class gui_spawn_blufor
{
		idd = 8000;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_blufor_bg: background
			{
				idc = 8001;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class btn_spawn_blufor: RscStructuredText
			{
				idc = 8002;
				text = "Warte auf Opfor...";
				x = 14 * GUI_GRID_W + GUI_GRID_X;
				y = 5 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {0,0,0,1};
			};
		};
};

class gui_spawn_opfor
{
		idd = 8010;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_opfor_bg: background
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

			class text_spawn_opfor: RscStructuredText
			{
				idc = 3202;
				text = "<t align='center' size='1.2'>TvT Breaking Contact</t>";
				x = 14 * GUI_GRID_W + GUI_GRID_X;
				y = 1 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};

			class btn_spawn_opfor: RscButton
			{
				idc = 8012;
				text = $STR_GRAD_choose_spawn_location;
				x = 14 * GUI_GRID_W + GUI_GRID_X;
				y = 5 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0.81,0.55,0.12,1};
				tooltip = $STR_GRAD_choose_spawn_location;
				onButtonClick = "openMap [true,false]; [] execVM 'mission_setup\teleport.sqf'; closeDialog 0";
			};
		};
};

class gui_spawn_waitplease
{
		idd = 8020;
		movingenable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

		class ControlsBackground
		{
			class gui_spawn_waitplease_bg: background
			{
				idc = 8021;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 0 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 10 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.8};
			};
		};

		class Controls {

			class btn_wait_opfor: RscStructuredText
			{
				idc = 8022;
				text = $STR_GRAD_choose_spawn_location;
				x = 16 * GUI_GRID_W + GUI_GRID_X;
				y = 2 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorBackground[] = {0,0,0,1};
				
			};
		};
};


class RscTitles {

	class gui_intel_paper_us
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_us";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\us_satellite_badge.paa";
			};
		};
	};

	class gui_intel_paper_us_lost
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_us_lost";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\us_satellite_badge_lost.paa";
			};
		};
	};

	class gui_intel_paper_rus
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_rus";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\rus_satellite_badge.paa";
			};
		};
	};

	class gui_intel_paper_rus_lost
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_rus_lost";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;  
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\rus_satellite_badge_lost.paa";
			};
		};
	};

	class gui_blufor_pleasewait
	{
		idd = -1;
		duration = 10e10;
		name = "gui_blufor_pleasewait";
		fadeIn = 1;

	 	class controls {
			class gui_blufor_pleasewait_pic: RscPicture
			{
				idc = -1;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 16 * GUI_GRID_W;
				h = 8 * GUI_GRID_H;
				text = "pic\blufor_please_wait.paa";
			};
		};
	};

	class gui_opfor_pleasewait
	{
		idd = -1;
		duration = 10e10;
		name = "gui_opfor_pleasewait";
		fadeIn = 1;

	 	class controls {
			class gui_opfor_pleasewait_pic: RscPicture
			{
				idc = -1;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 18 * GUI_GRID_W;
				h = 8 * GUI_GRID_H;
				text = "pic\opfor_please_wait.paa";
			};
		};
	};
};
