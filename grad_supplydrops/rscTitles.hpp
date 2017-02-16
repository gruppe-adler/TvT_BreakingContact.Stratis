class gui_intel_supplydrop
	{
		idd = -1;
		duration = 10;
		name = "gui_intel_supplydrop";
		fadeOut = 5;

	 	class controls {
			class gui_intel_supplydrop_paper: RscPicture
			{
				idc = -1;
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.4;
				text = "grad_supplydrops\data\hint.paa";
			};
		};
	};