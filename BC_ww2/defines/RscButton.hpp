class BC_ww2_RscButton
{
	access = 0;
	idc = -1;
	default = 0;

	type = 1; // Type
	style =  + 0xC0;

	soundClick[] =	{"\A3\ui_f\data\sound\RscButton\soundClick",0.090000004,1};
	soundEnter[] =	{"\A3\ui_f\data\sound\RscButton\soundEnter",0.090000004,1};
	soundPush[] =	{"\A3\ui_f\data\sound\RscButton\soundPush",0.090000004,1};
	soundEscape[] ={"\A3\ui_f\data\sound\RscButton\soundEscape",0.090000004,1};


	colorBackground[] = {0,0,0,0.75}; // Fill color
	colorBackgroundDisabled[] = {0,0,0,0}; // Disabled fill color
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1}; // Mouse hover fill color
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1}; // Selected fill color (oscillates between this and colorBackground)

	font = "RobotoCondensedLight";
	sizeEx = 5 * GRID_H;
	shadow = 1;
	text = ""; // Displayed text
	colorText[] = {1,1,1,1}; // Text color
	colorDisabled[] = {1,1,1,0.25}; // Disabled text color

	borderSize = 0; // Left color width (border is a stripe of the control height on the left side)
	colorBorder[] = {0,0,0,0}; // Left border color

	colorShadow[] = {0,0,0,0}; // Background frame color
	offsetX = 0; // Horizontal background frame offset
	offsetY = 0; // Vertical background frame offset
	offsetPressedX = pixelW; // Horizontal background offset when pressed
	offsetPressedY = pixelH; // Horizontal background offset when pressed

	period = 0; // Oscillation time between colorBackground and colorFocused when selected
	periodFocus = 2; // Unknown?
	periodOver = 0.5; // Unknown?

	// Xbox hints (behavior unknown)
	class KeyHints
	{
		class A
		{
			key = KEY_XBOX_A;
			hint = "KEY_XBOX_A";
		};
	};
};