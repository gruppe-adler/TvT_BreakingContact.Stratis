class CSSA3_openMain
{
	onLoad = "";
	onUnload = "['respawn',objNull] spawn CSSA3_fnc_createSpectateDialog";
	idd=7810;
	movingEnable=0;
	iconCamera = "\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa";
	onKeyDown = "['KeyDown',_this] call CSSA3_fnc_mainSpectateFunctions;";
	onKeyUp = "['KeyUp',_this] call CSSA3_fnc_mainSpectateFunctions;";
	onMouseButtonDown = "['MouseButtonDown',_this] call CSSA3_fnc_mainSpectateFunctions;";
	onMouseButtonUp = "['MouseButtonUp',_this] call CSSA3_fnc_mainSpectateFunctions;";

	class controlsBackground
	{
		class MouseArea: RscText
		{
			idc = 7910;
			style = 16;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			onMouseMoving = "['Mouse',_this] call CSSA3_fnc_mainSpectateFunctions;";
			onMouseHolding = "['Mouse',_this] call CSSA3_fnc_mainSpectateFunctions;";
			onMouseZchanged = "['MouseZChanged',_this] call CSSA3_fnc_mainSpectateFunctions;";
		};
		class cMap: CSSA3RscMapControl
		{
			idc = 7911;
			x = -10;
			y = -10;
			w = "0.7 * safezoneW";
			h = "0.7 * safezoneH";
		};
	};

	class Controls
	{
		class CSSA3_favouritesBoxText: CSSA3favouritesBoxText
		{
			idc = 79120;
			text = "$STR_CSSA3_addremove";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.758 * safezoneH + safezoneY;
			w = 0.13200 * safezoneW;
			h = 0.03 * safezoneH;
		};

		class CSSA3_minmaxUnitListGroup: RscControlsGroup
		{
			idc = 791200;
			text = "";
			x = 0.131947396 * safezoneW + safezoneX;
			y = 0.508 * safezoneH + safezoneY;
			w = 0.0123125 * safezoneW;
			h = 0.03 * safezoneH;

			class controls
			{
				class CSSA3_minmaxUnitslistButton: RscCSSA3Button
				{
					idc = 791201;
					text = "<";
					x = 0;
					y = 0;
					w = 0.0123125 * safezoneW;
					h = 0.03 * safezoneH;
					action = "[] execVM 'CSSA3\functions\fn_animateUnitList.sqf'";
				};
				class CSSA3_unitsFrame: RscFrame
				{
					idc = 791202;
					text = "";
					x = -0.001;
					y = 0.001;
					w = 0.0124125 * safezoneW;
					h = 0.03 * safezoneH;
				};
			};
		};

		class CSSA3_unitListGroup: RscControlsGroup
		{
			idc = 7912;
			text = "";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.13210367 * safezoneW;
			h = 0.520 * safezoneH;

			class controls
			{
				class CSSA3_unitsHeader: RscCSSA3HeaderText
				{
					text = "$STR_CSSA3_Units";
					idc = 79121;
					x = 0;
					y = 8.19564e-004 * safezoneH;
					w = 0.13210367 * safezoneW;
					h = 0.02 * safezoneH;
				};
				class CSSA3_unitsFrame: RscFrame
				{
					idc = 79122;
					text = "";
					x = 0;
					y = 8.19564e-004 * safezoneH;
					w = 0.13210367 * safezoneW;
					h = 0.5183 * safezoneH;
				};
				class CSSA3_favouritesBoxInvsibleTooltipText: RscCSSA3Text
				{
					idc = 79120;
					text = "";
					x = 0 * safezoneW;
					y = 0.4878 * safezoneH;
					w = 0.13066667 * safezoneW;
					h = 0.03 * safezoneH;
					tooltip = "$STR_CSSA3_addremove_Tooltip";
				};
				class CSSA3_unitsListBox: RscCSSA3IGUIListBox
				{
					idc = 79124;
					text = "";
					x = 0 * safezoneW;
					y = 0.0435 * safezoneH;
					w = 0.13066667 * safezoneW;
					h = 0.4443 * safezoneH;
					canDrag = 1;
					onLBSelChanged = "if (CSSA3_canChangeUnit) then {[] spawn CSSA3_fnc_unitListIndexChange};";
					onLBDrag = "CSSA3_isDraggingLB = _this;";
				};
				class CSSA3_allUnitsTab: CSSA3RscYellowButton
				{
					idc = 79125;
					text = "";
					x = 0 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_All";
					action = "CSSA3_selectedTab = 'All'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_bluforUnitsTab: CSSA3RscBluButton
				{
					idc = 79126;
					text = "";
					x = 0.01866667 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_BLUFOR";
					action = "CSSA3_selectedTab = 'Blufor'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_opforUnitsTab: CSSA3RscRedButton
				{
					idc = 79127;
					text = "";
					x = 0.03733334 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_OPFOR";
					action = "CSSA3_selectedTab = 'Opfor'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_indUnitsTab: CSSA3RscGreenButton
				{
					idc = 79128;
					text = "";
					x = 0.05600001 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_Independent";
					action = "CSSA3_selectedTab = 'Independent'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_civUnitsTab: CSSA3RscPurpleButton
				{
					idc = 79129;
					text = "";
					x = 0.07479668 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_CIVILIAN";
					action = "CSSA3_selectedTab = 'Civilians'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_playersTab: CSSA3RscPlayersButton
				{
					idc = 791210;
					text = "";
					x = 0.09356335 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_Players";
					action = "CSSA3_selectedTab = 'Players'; [] spawn CSSA3_fnc_updateUnitList";
				};
				class CSSA3_favouriteUnitsTab: CSSA3RscFavButton
				{
					idc = 791210;
					text = "<3";
					x = 0.11223002 * safezoneW;
					y = 0.023 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "$STR_CSSA3_Favourites";
					action = "CSSA3_selectedTab = 'Favourites'; [] spawn CSSA3_fnc_updateUnitList";
				};
			};
		};

		class CSSA3_bottomBar: RscControlsGroup
		{
			idc = 7913;
			text = "";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.965 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.030 * safezoneH;
			class controls
			{
				class CSSA3_barBorderBack: CSSA3RscTransparentBack
				{
					idc = 79131;
					x = 0 * safezoneW;
					y = 0.001 * safezoneH;
					w = 0.665156 * safezoneW;
					h = 0.029 * safezoneH;
				};
				class CSSA3_barBorder: RscFrame
				{
					idc = 79132;
					x = 0 * safezoneW;
					y = 0.0003 * safezoneH;
					w = 0.665156 * safezoneW;
					h = 0.0292 * safezoneH;
				};
				class CSSA3_TimeUntilRespawn: RscCSSA3Text
				{
					idc = 79133;
					text = "Respawn: -- --";
					x = 0.566812 * safezoneW;
					y = 0.00 * safezoneH;
					w = 0.0773437 * safezoneW;
					h = 0.030 * safezoneH;
					tooltip = "$STR_CSSA3_TimeUntilRespawn";
				};
				class CSSA3_helpMenuButton: RscCSSA3Button
				{
					idc = 79134;
					text = "?";
					x = 0.0103122 * safezoneW;
					y = 0.004 * safezoneH;
					w = 0.0123125 * safezoneW;
					h = 0.022 * safezoneH;
					tooltip = "$STR_CSSA3_HelpTooltip";
					action = "['KeyDown',[findDisplay 46,59,0,0,0]] spawn CSSA3_fnc_mainSpectateFunctions";
				};
				class CSSA3_settingsMenuButton: RscCSSA3Button
				{
					idc = 79134;
					text = "S"; //--- ToDo: Localize;
					x = 0.0283122 * safezoneW;
					y = 0.004 * safezoneH;
					w = 0.0123125 * safezoneW;
					h = 0.022 * safezoneH;
					tooltip = "$STR_CSSA3_Settings_Tooltip";
					action = "['KeyDown',[findDisplay 46,60,0,0,0]] spawn CSSA3_fnc_mainSpectateFunctions";
				};
				class CSSA3_spectatingText: RscCSSA3Text
				{
					idc = 79135;
					x = 0.27735615 * safezoneW;
					y = 0.00 * safezoneH;
					w = 0.1004437 * safezoneW;
					h = 0.030 * safezoneH;
					text = "";
					tooltip = "$STR_CSSA3_currentlySpectating_Tooltip";
				};
			};
		};

		class CSSA3_settingsControl: RscControlsGroup
		{
			idc = 7914;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.4048 * safezoneH;
			class controls
			{
				class CSSA3_settingsHeader: RscCSSA3HeaderText
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 0.351661 * safezoneW;
					h = 0.02 * safezoneH;
					text = "$STR_CSSA3_CSSA3Settings";
				};
				class CSSA3_settingsBack: CSSA3RscTransparentBack1
				{
					idc = -1;
					x = -0.00103095 * safezoneW;
					y = 0.02220002 * safezoneH;
					w = 0.351661 * safezoneW;
					h = 0.3803 * safezoneH;
				};
				class CSSA3_settingsFrame: RscFrame
				{
					idc = 79141;
					x = 0.00020 * safezoneW;
					y = 0.0004 * safezoneH;
					w = 0.350841 * safezoneW;
					h = 0.4040 * safezoneH;
				};
				class CSSA3_cbUnitNames: RscCheckbox
				{
					idc = 79142;
					x = 0.0051565 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['showUnitNames',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ShowUnitNames_Tooltip";
				};
				class CSSA3_cbUnitTags: RscCheckbox
				{
					idc = 79143;
					x = 0.00515602 * safezoneW;
					y = 0.066 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['showUnitTags',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ShowUnitTags_Tooltip";
				};
				class CSSA3_cbClickToInteract: RscCheckbox
				{
					idc = 79144;
					x = 0.00515602 * safezoneW;
					y = 0.099 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['enableClickToInteract',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ClickToInteract_Tooltip";
				};
				class CSSA3_viewDistanceSlider: RscCSSA3XSliderH
				{
					idc = 79145;
					x = 0.015469 * safezoneW;
					y = 0.3200 * safezoneH;
					w = 0.319688 * safezoneW;
					h = 0.023 * safezoneH;
					onSliderPosChanged = "['distanceSliderChanged',_this] spawn CSSA3_fnc_settingsHandler;";
				};
				class CSSA3_viewdistanceText: RscText
				{
					idc = 791451;
					text = "$STR_CSSA3_ViewDistance";
					x = 0.0309377 * safezoneW;
					y = 0.302 * safezoneH;
					w = 0.0973437 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_unitNamesCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ShowUnitNames";
					x = 0.0206252 * safezoneW;
					y = 0.0396 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_unitTagsCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ShowUnitTags";
					x = 0.0206252 * safezoneW;
					y = 0.0726 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_clickToInteractCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ClickToInteract";
					x = 0.0206252 * safezoneW;
					y = 0.1056 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_preloadCameraCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_PreloadCamera";
					x = 0.0206252 * safezoneW;
					y = 0.1386 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_cbPreloadCamera: RscCheckbox
				{
					idc = 79147;
					x = 0.00515602 * safezoneW;
					y = 0.132 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['preloadCamera',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_PreloadCamera_tooltip";
				};
				class CSSA3_btnCloseSettings: RscButton
				{
					idc = 79148;
					text = "$STR_CSSA3_Close";
					x = 0.268125 * safezoneW;
					y = 0.363 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.033 * safezoneH;
					action = "['closeSettings','save'] spawn CSSA3_fnc_settingsHandler;";
				};
			};
		};
		class CSSA3_interactMenuGroup: RscControlsGroup
		{
			idc = 7915;
			x = -10;
			y = -10;
			w = 0.221719 * safezoneW;
			h = 0.143 * safezoneH;
			class controls
			{
				class CSSA3_InteractImage: RscPicture
				{
					idc = 791511;
					text = "CSSA3\images\roseMid.paa";
					x = 0.079944 * safezoneW;
					y = 0.00440002 * safezoneH;
					w = 0.0620312 * safezoneW;
					h = 0.1102 * safezoneH;
				};
				class CSSA3_buttonInteractClose: RscCSSA3InvisibleButton
				{
					idc = 79151;
					text = "$STR_CSSA3_Close";
					x = 0.083532 * safezoneW;
					y = 0.0154 * safezoneH;
					w = 0.0546561 * safezoneW;
					h = 0.0924 * safezoneH;
					action = "[] spawn CSSA3_fnc_closeInteractRose;";
					tooltip = "$STR_CSSA3_Close";
				};
				class CSSA3_button1st: RscButton
				{
					idc = 79153;
					text = "$STR_CSSA3_First_Person";
					x = 0.015469 * safezoneW;
					y = 2.45869e-008 * safezoneH;
					w = 0.0670312 * safezoneW;
					h = 0.033 * safezoneH;
					action = "CSSA3_perspective = 'firstPerson'; CSSA3_fromRose = true; [] spawn CSSA3_fnc_changeView;";
					tooltip = "$STR_CSSA3_firstButtonTip";
				};
				class CSSA3_buttonFree: RscButton
				{
					idc = 79152;
					text = "$STR_CSSA3_Free_Camera";
					x = 2.33576e-007 * safezoneW;
					y = 0.044 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.033 * safezoneH;
					action = "CSSA3_perspective = 'freeCam'; CSSA3_fromRose = true; [] spawn CSSA3_fnc_changeView;";
					tooltip = "$STR_CSSA3_freeButtonTip";
				};
				class CSSA3_button3rd: RscButton
				{
					idc = 79154;
					text = "$STR_CSSA3_Third_Person";
					x = 0.015469 * safezoneW;
					y = 0.088 * safezoneH;
					w = 0.0670312 * safezoneW;
					h = 0.033 * safezoneH;
					action = "CSSA3_perspective = 'thirdPerson'; CSSA3_fromRose = true; [] spawn CSSA3_fnc_changeView;";
					tooltip = "$STR_CSSA3_thirdButtonTip";
				};
				class CSSA3_buttonRoseAddFavourite: RscButton
				{
					idc = 79155;
					text = "$STR_CSSA3_Favourite";
					x = 0.139219 * safezoneW;
					y = 2.45869e-008 * safezoneH;
					w = 0.0670312 * safezoneW;
					h = 0.033 * safezoneH;
					action = "[CSSA3_CTIselectedUnit] spawn CSSA3_fnc_addremoveFavourite; [] spawn CSSA3_fnc_closeInteractRose";
					tooltip = "$STR_CSSA3_addRemove_Tooltip";
				};
				class CSSA3_temp2: RscButton
				{
					idc = 79156;
					text = "- - -"; //--- ToDo: Localize;
					x = 0.149532 * safezoneW;
					y = 0.044 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class CSSA3_temp3: RscButton
				{
					idc = 79157;
					text = "- - -"; //--- ToDo: Localize;
					x = 0.139219 * safezoneW;
					y = 0.088 * safezoneH;
					w = 0.0670312 * safezoneW;
					h = 0.033 * safezoneH;
				};
				class CSSA3_nameText: RscCSSA3Text
				{
					idc = 79158;
					text = "";
					x = 0.061696 * safezoneW;
					y = 0.121 * safezoneH;
					w = 0.098375 * safezoneW;
					h = 0.022 * safezoneH;
				};
			};
		};
	};
};