class grad_buymenu_RscBackground {
	idc = -1;
	type = CT_STATIC;
	style = ST_HUD_BACKGROUND;
	text = "";
	colorText[] = {0, 0, 0, 0};
	font = "RobotoCondensed";
	sizeEx = 0.04;
	shadow = 0;
	colorBackground[] = {0, 0, 0, 0.9};
};

class grad_buymenu_RscText {

	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = "RobotoCondensed";
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};

class grad_buymenu_RscStructuredTextLeft {
	idc = -1;
	access = 0;
	type = CT_STRUCTURED_TEXT;
	style = 0;
	colorText[] = { 1 , 1 , 1 , 1 };
	colorBackground[] = {0,0,0,0.4};
	class Attributes {
		font = "RobotoCondensed";
		//color = "#e0d8a6";
		align = "left";
		shadow = 0;
	};
	text = "";
	size = 0.03921;
	shadow = 2;
};

class grad_buymenu_RscPicture {
	shadow = 0;
	type = CT_STATIC;
	style = 48 + 2048;
	sizeEx = 0.023;
	font = "RobotoCondensed";
	text = "";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};


class grad_buymenu_RscPictureKeepAspect: grad_buymenu_RscPicture {
	style = "0x30 + 0x800";
};


class grad_buymenu_RscButton {
	x = 0;
	y = 0;
	w = 0.15;
	h = 0.1;
	access = 0;
	type = CT_BUTTON;
	style = ST_RIGHT;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.1};
	colorBackground[] = {0,0,0,0.8};
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,0.3};
	colorBackgroundFocused[] = {0,0,0,0.5};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	shadow = 0;
	font = "RobotoCondensed";
	sizeEx = 0.04;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.000;
	offsetPressedY = 0.001;
	borderSize = 0;
};