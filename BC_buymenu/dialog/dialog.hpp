class grad_buymenu {
    idd = grad_buymenu_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground {
        class MainBackground: grad_buymenu_RscBackground {
            x = grad_buymenu_BG_X;
            y = grad_buymenu_BG_Y;
            w = grad_buymenu_BG_W;
            h = grad_buymenu_BG_H;
        };

        class DialogTitleText: grad_buymenu_RscText {
            idc = grad_buymenu_TITLE;
            text = "NAME OF VENDOR";
            sizeEx = 0.04 * TEXT_SCALE;

            x = grad_buymenu_BG_X;
            y = grad_buymenu_TopBar_Y;
            w = grad_buymenu_BG_W;
            h = grad_buymenu_Item_H;
        };

        class MyFunds: grad_buymenu_RscText {
            idc = grad_buymenu_MYFUNDS;
            text = "MY FUNDS";
            sizeEx = 0.04 * TEXT_SCALE;
            style = ST_RIGHT;

            x = grad_buymenu_BG_X;
            y = grad_buymenu_TopBar_Y;
            w = grad_buymenu_BG_W;
            h = grad_buymenu_Item_H;
        };

        class ItemListBG: grad_buymenu_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_buymenu_Column1_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y + grad_buymenu_Item_H + grad_buymenu_ItemSpace_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Itemlist_H;
        };

        class PreviewPictureBG: grad_buymenu_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_buymenu_Column2_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Picture_H;
        };

        class PreviewPicture: grad_buymenu_RscPicture {
            idc = grad_buymenu_PICTURE;
            colorBackground[] = {0,0,0,0.4};

            x = grad_buymenu_Column2_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Picture_H;
        };

        class Description: grad_buymenu_RscStructuredTextLeft {
            idc = grad_buymenu_DESCRIPTION;
            text = "";

            x = grad_buymenu_Column2_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y + grad_buymenu_Picture_H + grad_buymenu_ItemSpace_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Description_H;
        };
    };

    class Controls {
        class Category: grad_buymenu_RscCombo {
            idc = grad_buymenu_CATEGORY;

            x = grad_buymenu_Column1_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Item_H;

            onLBSelChanged = "_this call grad_buymenu_fnc_updateList";
        };

        class ItemList: grad_buymenu_RscListNBox {
            idc = grad_buymenu_ITEMLIST;

            x = grad_buymenu_Column1_X;
            y = grad_buymenu_BG_Y + grad_buymenu_Padding_Y + grad_buymenu_Item_H + grad_buymenu_ItemSpace_Y;
            w = grad_buymenu_Column_W;
            h = grad_buymenu_Itemlist_H;

            onLBSelChanged = "_this call grad_buymenu_fnc_updateItemData; _this call grad_buymenu_fnc_updatePicture";
        };

        class BuyButton: grad_buymenu_RscButton {
            idc = grad_buymenu_BUYBUTTON;
            text = "BUY";
            action = "[] call grad_buymenu_fnc_buyClient";

            x = grad_buymenu_BG_X + grad_buymenu_BG_W - grad_buymenu_Button_W;
            y = grad_buymenu_BG_Y + grad_buymenu_BG_H + grad_buymenu_ItemSpace_Y;
            w = grad_buymenu_Button_W;
            h = grad_buymenu_Item_H;
        };
    };
};
