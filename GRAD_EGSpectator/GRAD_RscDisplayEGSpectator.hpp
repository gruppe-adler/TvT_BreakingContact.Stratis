class RscControlsGroupNoScrollbars;
class RscTree;
class RscToolbox;
class RscPictureKeepAspect;
class RscListNBox;
class ScrollBar;
class RscButtonMenu;
class RscListBox;
// class RscStructuredText;
// class RscButtonMenu;
class RscActiveText;
class RscControlsGroup;

class GRAD_RscDisplayEGSpectator {
	idd = 60492;
	enableSimulation = 1;
	movingEnable = 0;
	closeOnMissionEnd = 1;
	scriptName = "GRAD_RscDisplayEGSpectator";
	scriptPath = "GUI";
	onLoad = "['onLoad',_this,'GRAD_RscDisplayEGSpectator','GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "['onUnload',_this,'GRAD_RscDisplayEGSpectator','GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";

	class ControlsBackground {

		class MouseHandler: RscText {
			idc = 42989;
			text = "";
			x = "safeZoneXAbs";
			y = "safeZoneY";
			w = "safeZoneWAbs";
			h = "safeZoneH";
			colorBackground[] = {1, 1, 1, 0};
			style = 16;
		};
	};

	class Controls {

		class GameTimeText: RscText {
			style = 2;
			idc = 42609;
			text = "00:00:00";
			x = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 				(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		safezoneY";
			w = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 0.750000};
			sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class GamePhaseText: RscText {
			style = 2;
			shadow = 0;
			idc = 48610;
			text = "PHASE III";
			x = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 				(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		safezoneY";
			w = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 0.500000};
			sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class SideAProgressGroup: RscControlsGroupNoScrollbars {
			idc = 48909;
			x = "5.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 				(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		safezoneY";
			w = "10.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class SideABackground: RscText {
					idc = 42613;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.500000};
				};

				class SideATask: RscText {
					style = 1;
					shadow = 0;
					idc = 42612;
					text = "DEFEND";
					x = "0.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 1};
					sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class SideAColorBackground: RscText {
					idc = 42615;
					x = "8.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class SideAColor: RscText {
					colorBackground[] = {"(profilenamespace getvariable ['Map_BLUFOR_R',0])", "(profilenamespace getvariable ['Map_BLUFOR_G',1])", "(profilenamespace getvariable ['Map_BLUFOR_B',1])", "(profilenamespace getvariable ['Map_BLUFOR_A',0.8])"};
					idc = 42617;
					x = "8.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};

		class SideBProgressGroup: RscControlsGroupNoScrollbars {
			idc = 43910;
			x = "23.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 				(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		safezoneY";
			w = "10.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class SideBBackground: RscText {
					idc = 42611;
					x = "0.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "10.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.500000};
				};

				class SideBTask: RscText {
					style = 0;
					shadow = 0;
					idc = 42614;
					text = "RETRIEVE";
					x = "1.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "7.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 1};
					sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class SideBColorBackground: RscText {
					idc = 42616;
					x = "0.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class SideBColor: RscText {
					colorBackground[] = {"(profilenamespace getvariable ['Map_OPFOR_R',0])", "(profilenamespace getvariable ['Map_OPFOR_G',1])", "(profilenamespace getvariable ['Map_OPFOR_B',1])", "(profilenamespace getvariable ['Map_OPFOR_A',0.8])"};
					idc = 42618;
					x = "0.18 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};

		class List: RscTree {
			multiselectEnabled = 0;
			x = "safeZoneX";
			y = "safezoneY + 0.06";
			colorBorder[] = {0, 0, 0, 0};
			colorBackground[] = {0, 0, 0, 0.750000};
			expandOnDoubleclick = 1;
			fade = 0.800000;
			shadow = 1;
			colorLines[] = {0, 0, 0, 0};

			class ScrollBar {
				width = 0;
				height = 0;
				scrollSpeed = 0.100000;
				color[] = {1, 1, 1, 0};
			};
			idc = 43109;
			w = "13.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "safezoneH";
		};

		class Tabs: RscToolbox {
			x = "safeZoneX";
			y = "safezoneY";
			h = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			fade = 0.800000;
			rows = 1;
			columns = 2;
			strings[] = {"$STR_A3_Spectator_Entities", "$STR_A3_Spectator_Locations"};
			values[] = {0, 1};
			sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 0.750000};
			colorSelectedBg[] = {0, 0, 0, 0.650000};
			idc = 43609;
			w = "13.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		};

		class CameraTypesGroup: RscControlsGroupNoScrollbars {
			idc = 52909;
			x = "15.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 				(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "safezoneY + safezoneH - 2.38 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "8.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = 2.600000;

			class controls {

				class CameraTypesBackground: RscText {
					idc = 52610;
					x = "0.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "7.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class Free: RscButton {
					style = 48;
					colorBackground[] = {0, 0, 0, 0};
					colorBackgroundDisabled[] = {0, 0, 0, 0};
					colorBackgroundActive[] = {0, 0, 0, 0};
					colorFocused[] = {0, 0, 0, 0};
					idc = 52809;
					text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\free.paa";
					x = "1.3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.63 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.37 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "$STR_A3_Spectator_free_camera_tooltip";
				};

				class Follow: RscButton {
					style = 48;
					colorBackground[] = {0, 0, 0, 0};
					colorBackgroundDisabled[] = {0, 0, 0, 0};
					colorBackgroundActive[] = {0, 0, 0, 0};
					colorFocused[] = {0, 0, 0, 0};
					idc = 52810;
					text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\follow.paa";
					x = "3.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.63 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.37 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "$STR_A3_Spectator_3pp_camera_tooltip";
				};

				class Fps: RscButton {
					style = 48;
					colorBackground[] = {0, 0, 0, 0};
					colorBackgroundDisabled[] = {0, 0, 0, 0};
					colorBackgroundActive[] = {0, 0, 0, 0};
					colorFocused[] = {0, 0, 0, 0};
					idc = 52811;
					text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\fps.paa";
					x = "5.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.63 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.37 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "$STR_A3_Spectator_1pp_camera_tooltip";
				};
			};
		};

		class MapGroup: RscControlsGroupNoScrollbars {
			idc = 63909;
			x = "-0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "-0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "41.5962 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "26.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class Map: RscMapControl {
					maxSatelliteAlpha = 0.750000;
					idc = 62609;
					x = "-3.36 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "40.0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "22.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1, 1, 1, 1};
				};

				class MapHeader: RscText {
					idc = 62610;
					x = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "40 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class MapFooter: RscText {
					style = 2;
					idc = 62611;
					text = "";
					x = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "24.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "40 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
					sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class MapTitle: RscText {
					idc = 62612;
					text = "";
					x = "1.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "36.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 1};
					sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class SpectatorsCount: RscText {
					idc = 62613;
					text = "";
					x = "39.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 1};
					sizeEx = "1.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class SpectatorsIcon: RscPictureKeepAspect {
					idc = 62809;
					text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Fps.paa";
					x = "37.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.900002 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};

		class HelpBackground: RscText {
			idc = 72812;
			x = "37 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 0.750000};
		};

		class Help: RscListNBox {

			class ListScrollBar: ScrollBar {
			};
			disableOverflow = 0;
			rowHeight = "SIZEEX_PURISTA(SIZEEX_S)";
			idc = 73189;
			x = "37.0 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "23.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "12.0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class FocusInfo: RscControlsGroupNoScrollbars {
			idc = 83909;
			x = "12.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "24 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "16 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class UpperBackground: RscText {
					idc = 82609;
					x = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class LowerLeftBackground: RscText {
					idc = 82611;
					x = "9.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1, 1, 1, 0.400000};
				};

				class LowerRightBackground: RscText {
					idc = 82612;
					x = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class AvatarBackground: RscText {
					idc = 82613;
					x = "-0.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.750000};
				};

				class VehicleType: RscPicture {
					idc = 82818;
					text = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
					x = "13.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class UnitType: RscPictureKeepAspect {
					idc = 82810;
					text = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
					x = "14.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Name: RscText {
					shadow = 0;
					idc = 82610;
					text = "RoyaltyInExile";
					x = "3.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "9.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Avatar: RscPictureKeepAspect {
					idc = 82809;
					text = "a3\Ui_f\data\GUI\Cfg\UnitInsignia\bi_ca.paa";
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Kills: RscPictureKeepAspect {
					idc = 82811;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
					x = "3.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class LandKills: RscPictureKeepAspect {
					idc = 82812;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\soft_ca.paa";
					x = "4.64 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class ArmoredKills: RscPictureKeepAspect {
					idc = 82813;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\armored_ca.paa";
					x = "5.76 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class AirKills: RscPictureKeepAspect {
					idc = 82814;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\air_ca.paa";
					x = "6.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Deaths: RscPictureKeepAspect {
					idc = 82815;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\killed_ca.paa";
					x = "7.92 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Total: RscPictureKeepAspect {
					idc = 82816;
					text = "a3\Ui_f\data\IGUI\Cfg\MPTable\total_ca.paa";
					x = "8.86 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Kills_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82614;
					text = "99";
					x = "3.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class LandKills_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82615;
					text = "99";
					x = "4.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class ArmoredKills_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82616;
					text = "99";
					x = "5.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class AirKills_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82617;
					text = "99";
					x = "6.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Deaths_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82618;
					text = "99";
					x = "7.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class Total_Count: RscText {
					style = 2;
					shadow = 0;
					idc = 82619;
					text = "99";
					x = "8.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class WeaponPicture: RscPictureKeepAspect {
					idc = 82817;
					text = "A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa";
					x = "9.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};

		class RespawnControlsGroup: RscControlsGroupNoScrollbars {
			fade = 1;
			idc = 88800;
			onLoad = "(_this select 0) ctrlEnable false;_this execVM 'a3\ui_f\scripts\gui\RscRespawnControls.sqf'";
			x = "1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "(15 - 1.15 ) * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "(9.7 + 1.15 ) * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class LocBackground: RscText {
					idc = 88802;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class RoleBackground: RscText {
					idc = 88803;
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class GearBackground: RscText {
					idc = 88804;
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(2.9 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "5.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class HeaderBackground: RscText {
					idc = 88801;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.2 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "38.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class OverHeaderBackground: RscText {
					idc = 88870;
					show = 0;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "38.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.1) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class OverHeaderLeft: RscStructuredText {
					idc = 88871;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					show = 0;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.3) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class OverHeaderRight: RscStructuredText {
					idc = 88872;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					show = 0;
					x = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "(1.15  - 0.3) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class ButtonSpectate: RscButtonMenu {
					idc = 88811;

					class Attributes {
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};
					text = "$STR_A3_RscRespawnControls_Spectate";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(8.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class LocList: RscListBox {
					idc = 88808;
					colorPictureSelected[] = {0, 0, 0, 1};
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class RoleList: RscListBox {
					idc = 88809;
					colorPictureSelected[] = {0, 0, 0, 1};
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class CounterText: RscStructuredText {
					idc = 88826;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "15.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class Counter: RscStructuredText {
					idc = 88806;
					x = "15.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.10 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.55 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class AutoRespawn: RscActiveText {
					idc = 88830;
					style = 48;
					color[] = {1, 1, 1, 0.700000};
					text = "\a3\ui_f\data\map\respawn\icon_autorespawn_ca.paa";
					x = "20.95 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.75 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.60 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.60 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorText[] = {1, 1, 1, 0.300000};
					colorBackground[] = {1, 1, 1, 0.300000};
					colorActive[] = {1, 1, 1, 1};
				};

				class TeamText: RscStructuredText {
					idc = 88827;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class Team: RscStructuredText {
					idc = 88805;
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.375 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.00 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class ReviveInfo: RscText {
					idc = 88874;
					show = 0;
					x = "12.2 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class ReviveInfoTitle: RscStructuredText {
					idc = 88875;
					show = 0;
					x = "6.3 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class ReviveInfoOption: RscStructuredText {
					idc = 88876;
					show = 0;
					x = "6.3 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.475 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class TicketsText: RscStructuredText {
					idc = 88828;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "30.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class Tickets: RscStructuredText {
					idc = 88807;
					x = "30.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.375 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "8 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.00 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class RespawnInfo: RscText {
					idc = 88877;
					show = 0;
					x = "25.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.5 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class RespawnInfoTitle: RscStructuredText {
					idc = 88878;
					show = 0;
					x = "25.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.625 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class RespawnInfoOption: RscStructuredText {
					idc = 88879;
					show = 0;
					x = "25.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(1.475 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class HeaderRespawnButton: RscButtonMenu {
					idc = 88829;

					class Attributes {
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};

					class TextPos {
						bottom = 0;
						left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
						right = 0.005000;
						top = "0.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					text = "$STR_A3_RscRespawnControls_Respawn";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
				};

				class Warning: RscStructuredText {
					idc = 88831;
					text = "";
					x = "9.475 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(0.35 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19.05 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "2.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.700000, 0, 0, 1};
				};

				class ComboLoadout: RscCombo {
					idc = 88813;
					wholeHeight = 0.220000;
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class ButtonDetails: RscButtonMenu {
					idc = 88814;

					class Attributes {
						align = "center";
						color = "#E5E5E5";
						font = "PuristaLight";
						shadow = "false";
					};

					class TextPos {
						bottom = 0;
						left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
						right = 0.005000;
						top = "0.12 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					text = "$STR_A3_RscRespawnControls_Details";
					x = "31.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class BackgroungPrimaryWeapon: RscPicture {
					idc = 88822;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "25.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class BackgroungSecondaryWeapon: RscPicture {
					idc = 88823;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "31.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class BackgroungOptics: RscPicture {
					idc = 88824;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "25.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.025 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class BackgroungItem: RscPicture {
					idc = 88825;
					text = "#(argb,8,8,3)color(1,1,1,0.3)";
					x = "28.625 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "3.025 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class PicturePrimaryWeapon: RscPicture {
					idc = 88815;
					x = "27.225 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class PictureSecondaryWeapon: RscPicture {
					idc = 88816;
					x = "33.475 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(5.55 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "2.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class PictureOptics: RscPicture {
					idc = 88817;
					x = "26.3375 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.35 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class PictureItem: RscPicture {
					idc = 88818;
					x = "29.4625 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(7.0 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.35 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};

				class LocTitle: RscStructuredText {
					idc = 88819;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class RoleTitle: RscStructuredText {
					idc = 88820;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class GearTitle: RscStructuredText {
					idc = 88821;
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(3.275 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class LocDisabled: RscStructuredText {
					idc = 88832;
					text = "$STR_A3_RscRespawnControls_LocDisabled";
					x = "0.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class RoleDisabled: RscStructuredText {
					idc = 88833;
					text = "$STR_A3_RscRespawnControls_RoleDisabled";
					x = "12.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};

				class LoadoutDisabled: RscStructuredText {
					idc = 88834;
					text = "$STR_A3_RscRespawnControls_LoadoutDisabled";
					x = "25.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "(4.4 + 1.15 ) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0};
				};
			};
		};

		class RespawnDetailsControlsGroup: RscControlsGroupNoScrollbars {
			fade = 1;
			idc = 88850;
			onLoad = "(_this select 0) ctrlEnable false";
			x = "26.4 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))";
			w = "12.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "14.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			class controls {

				class BackgroundDetails: RscText {
					idc = 88851;
					x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.6 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "14.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0.100000, 0.100000, 0.100000, 0.800000};
				};

				class DetailsTitle: RscStructuredText {
					idc = 88852;
					x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "11.85 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0, 0, 0, 0.900000};
				};

				class ButtonDetailsClose: RscButton {
					idc = 88853;
					x = "11.85 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0.2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.75 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1, 1, 1, 1};
				};

				class RespawnDetailsListControlsGroup: RscControlsGroup {
					idc = 88860;
					x = "0.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.05 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "12.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "13.45 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

					class controls {

						class DetailsList: RscStructuredText {
							idc = 88861;
							x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
							y = "0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
							w = "11.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
							h = "12.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
							colorBackground[] = {1, 1, 1, 0.300000};
						};
					};
				};
			};
		};
	};
};