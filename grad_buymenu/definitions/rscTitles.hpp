	class gui_pleasewait
	{
		idd = -1;
		duration = 10e10;
		name = "gui_pleasewait";
		fadeIn = 1;
		fadeOut = 1;
		onLoad = "uiNamespace setVariable ['GRAD_rattrap_loading', (_this select 0)];";

	 	class controls {
			class gui_pleasewait_pic: RscPicture
			{
				idc = -1;
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 10 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = (10 * GUI_GRID_H) * 3/4;
				text = "pic\loading_pic.jpg";
			};
			class gui_pleasewait_txt : RscStructuredText {
				idc = 4444;
				text = "<t size='1' shadow='0' align='center'>Emergency Landing Zone Search.</t>";
				color[] = {1,1,1,0.3};
				x = 10 * GUI_GRID_W + GUI_GRID_X;
				y = 19 * GUI_GRID_H + GUI_GRID_Y;
				w = 20 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {0,0,0,0.7};
			};
		};
	};

	class gui_intel
	{
		idd = -1;
		duration = 10;
		name = "gui_intel";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic_us: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\intel.paa";
			};
		};
	};

	class gui_intel_paper_us
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_us";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic_us: RscPicture
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
			class gui_intel_paper_pic_us_lost: RscPicture
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
			class gui_intel_paper_pic_rus: RscPicture
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
			class gui_intel_paper_pic_rus_lost: RscPicture
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

	class gui_intel_paper_civ_killed
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_civ_killed";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_pic_killed: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\civ_killed_badge.paa";
			};
		};
	};

	class gui_intel_paper_civ_gunfight
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_civ_gunfight";
		fadeOut = 5;
		onLoad = "with uiNameSpace do { gui_intel_paper_civ_gunfight = _this select 0 }";

	 	class controls {

			class gui_intel_paper_pic_gunfight: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\civ_gunfight_badge.paa";
			};
		};
	};

	class gui_intel_paper_markerupdate
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_markerupdate";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_markerupdate_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "pic\rus_markerupdate.paa";
			};
		};
	};

	class gui_intel_paper_supplydrop_destroyed
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_paper_supplydrop_destroyed";
		fadeOut = 5;

	 	class controls {
			class gui_intel_paper_supplydrop_destroyed_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "grad_supplydrops\data\supplydrop_destroyed.paa";
			};
		};
	};


	class gui_waverespawn_oneplus
	{
		idd = -1;
		duration = 10;
		name = "gui_waverespawn_oneplus";
		fadeOut = 5;

	 	class controls {
			class gui_waverespawn_oneplus_pic: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "grad_waverespawn\data\waverespawn_oneplus.paa";
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
