class russianSupplyGUI
{
		idd = 1000;
		movingenable = 0;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};

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
				text = "Anfordern";
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_2: RscButton
			{
				idc = 1502;
				text = "Anfordern";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_3: RscButton
			{
				idc = 1503;
				text = "Anfordern";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_4: RscButton
			{
				idc = 1504;
				text = "Anfordern";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_5: RscButton
			{
				idc = 1505;
				text = "Anfordern";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_6: RscButton
			{
				idc = 1506;
				text = "Anfordern";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderRussianVehicle.sqf';";
			};
			class russian_gui_btn_anfordern_7: RscButton
			{
				idc = 1507;
				text = "Anfordern";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
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
				text = "spawn\gui\pic\rus_gaz66_medic.paa";
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
				text = "spawn\gui\pic\rus_brm1k.paa";
			};
			class russian_gui_pic_5: RscPicture
			{
				idc = 1005;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\rus_btr60.paa";
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
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_2: RscStructuredText
			{
				idc = 1102;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_3: RscStructuredText
			{
				idc = 1103;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_4: RscStructuredText
			{
				idc = 1104;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_5: RscStructuredText
			{
				idc = 1105;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_6: RscStructuredText
			{
				idc = 1106;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_namedisplay_7: RscStructuredText
			{
				idc = 1107;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
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
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_2: RscStructuredText
			{
				idc = 1302;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_3: RscStructuredText
			{
				idc = 1303;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_4: RscStructuredText
			{
				idc = 1304;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_5: RscStructuredText
			{
				idc = 1305;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_6: RscStructuredText
			{
				idc = 1306;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_pricedisplay_7: RscStructuredText
			{
				idc = 1307;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_price: RscStructuredText
			{
				idc = -1;
				text = "<t color='#80ffffff'>Kosten</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_countleft: RscStructuredText
			{
				idc = -1;
				text = "<t color='#80ffffff'>Anzahl verf.</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};
			class russian_gui_text_legend_namedisplay: RscStructuredText
			{
				idc = -1;
				text = "<t color='#80ffffff'>Fahrzeug</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {0.5,0.5,0.5,1};
				colorBackground[] = {-1,-1,-1,0};
			};

			class russian_gui_text_headline: RscStructuredTextHeadline
			{
				idc = 1600;
				text = "<t size='2' align='center' color='#33ffffff'>Nachschub anfordern</t>";
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
				tooltip = "Verbleibende Credits";
				lineSpacing = 0.4;
			};
			class russian_gui_btn_close: RscButtonSmall
			{
				idc = -1;
				text = "Schließen";
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
				text = "Anfordern";
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_2: RscButton
			{
				idc = 3502;
				text = "Anfordern";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_3: RscButton
			{
				idc = 3503;
				text = "Anfordern";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_4: RscButton
			{
				idc = 3504;
				text = "Anfordern";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_5: RscButton
			{
				idc = 3505;
				text = "Anfordern";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_6: RscButton
			{
				idc = 3506;
				text = "Anfordern";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
				onButtonClick = "disableSerialization; [_this select 0] execVM 'spawn\gui\orderUSVehicle.sqf';";
			};
			class US_gui_btn_anfordern_7: RscButton
			{
				idc = 3507;
				text = "Anfordern";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 16 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 2 * GUI_GRID_H;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,1};
				tooltip = "Fahrzeug anfordern";
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
				text = "spawn\gui\pic\us_m113_medic.paa";
			};
			class US_gui_pic_5: RscPicture
			{
				idc = 3005;
				x = 27 * GUI_GRID_W + GUI_GRID_X;
				y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 7 * GUI_GRID_W;
				h = 6 * GUI_GRID_H;
				text = "spawn\gui\pic\us_javelin.paa";
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
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_2: RscStructuredText
			{
				idc = 3102;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_3: RscStructuredText
			{
				idc = 3103;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_4: RscStructuredText
			{
				idc = 3104;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_5: RscStructuredText
			{
				idc = 3105;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_6: RscStructuredText
			{
				idc = 3106;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_namedisplay_7: RscStructuredText
			{
				idc = 3107;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
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
				x = -3 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_2: RscStructuredText
			{
				idc = 3302;
				text = "<t align='center'>lade ...</t>";
				x = 5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_3: RscStructuredText
			{
				idc = 3303;
				text = "<t align='center'>lade ...</t>";
				x = 12.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_4: RscStructuredText
			{
				idc = 3304;
				text = "<t align='center'>lade ...</t>";
				x = 20 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_5: RscStructuredText
			{
				idc = 3305;
				text = "<t align='center'>lade ...</t>";
				x = 27.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_6: RscStructuredText
			{
				idc = 3306;
				text = "<t align='center'>lade ...</t>";
				x = 35 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_pricedisplay_7: RscStructuredText
			{
				idc = 3307;
				text = "<t align='center'>lade ...</t>";
				x = 42.5 * GUI_GRID_W + GUI_GRID_X;
				y = 14 * GUI_GRID_H + GUI_GRID_Y;
				w = 6 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_legend_price: RscStructuredText
			{
				idc = -1;
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
				idc = -1;
				text = "<t color='#80ffffff'>Anzahl verf.</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 12 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {1,1,1,0.5};
				colorBackground[] = {-1,-1,-1,0};
			};
			class US_gui_text_legend_namedisplay: RscStructuredText
			{
				idc = -1;
				text = "<t color='#80ffffff'>Fahrzeug</t>";
				x = -9 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorText[] = {0.5,0.5,0.5,1};
				colorBackground[] = {-1,-1,-1,0};
			};

			class US_gui_text_headline: RscStructuredTextHeadline
			{
				idc = 3600;
				text = "<t size='2' align='center' color='#33ffffff'>Nachschub anfordern</t>";
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
				tooltip = "Verbleibende Credits";
				lineSpacing = 0.4;
			};
			class US_gui_btn_close: RscButtonSmall
			{
				idc = -1;
				text = "Schließen";
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
			class dlgBackground: background
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

			class btn_spawn_blufor: RscButton
			{
				idc = 8002;
				text = "Warte auf Opfor...";
				x = 14 * GUI_GRID_W + GUI_GRID_X;
				y = 5 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0.81,0.55,0.12,1};
				tooltip = "Warte auf Opfor...";
				onButtonClick = "openMap [true,false]; [] execVM 'mission_setup\teleport.sqf'; closeDialog 0";
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
			class dlgBackground: background
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
				text = "<t align='center' size='1.3'>TvT Breaking Contact</t>";
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
			class dlgBackground: background
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

			class btn_spawn_opfor: RscButton
			{
				idc = 8022;
				text = $STR_GRAD_choose_spawn_location;
				x = 16 * GUI_GRID_W + GUI_GRID_X;
				y = 2 * GUI_GRID_H + GUI_GRID_Y;
				w = 12 * GUI_GRID_W;
				h = 3 * GUI_GRID_H;
				colorText[] = {0,0,0,1};
				colorBackground[] = {0.81,0.55,0.12,1};
				tooltip = $STR_GRAD_choose_spawn_location;
				onButtonClick = "openMap [true,false]; [] execVM 'mission_setup\teleport.sqf'; closeDialog 0";
			};
		};
};