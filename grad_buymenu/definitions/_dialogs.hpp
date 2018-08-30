class GRAD_buy_menu
{
        idd = 1337;
        movingenable = 0;

        enableSimulation = 1;
        enableDisplay = 1;
        onLoad = "uiNamespace setVariable ['GRAD_buy_menu_var', (_this select 0)];";
        fadein = 0.25;
        fadeout = 0.25;

        class ControlsBackground
        {
            class dlgBackground: BC_buymenu_RscBackground
            {
                idc = 1336;
                x = safeZoneX;
                y = safeZoneY;
                w = safeZoneW;
                h = safeZoneH;
                colorBackground[] = {0,0,0,0.8};
            };
    };

        class Objects {

            class pic1 {
                onObjectMoved = "systemChat str _this";
                idc = 1338;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0};
                position[] = {0,3,0.25};
                positionBack[] = {0,3,0.25};
                // x = 0.5; y = 0.5; z = 1;
                // xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 0;
                enableZoom = 0;
                zoomDuration = 0.001;
                onLoad = "ctrlShow [_this, false];";

            };

            class pic2 {
                onObjectMoved = "systemChat str _this";
                idc = 1339;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic3 {
                onObjectMoved = "systemChat str _this";
                idc = 1340;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic4 {
                onObjectMoved = "systemChat str _this";
                idc = 1341;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";
            };

            class pic5 {
                onObjectMoved = "systemChat str _this";
                idc = 1342;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic6 {
                onObjectMoved = "systemChat str _this";
                idc = 1343;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic7 {
                onObjectMoved = "systemChat str _this";
                idc = 1344;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic8 {
                onObjectMoved = "systemChat str _this";
                idc = 1345;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic9 {
                onObjectMoved = "systemChat str _this";
                idc = 1346;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic10 {
                onObjectMoved = "systemChat str _this";
                idc = 1347;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic11 {
                onObjectMoved = "systemChat str _this";
                idc = 1348;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

            class pic12 {
                onObjectMoved = "systemChat str _this";
                idc = 1349;
                type = 82;
                model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
                scale = 0.3;
                direction[] = {0, -0.35, -0.65};
                up[] = {0, 0.65, 0}; //position[] = {0,0,0.2}; optional
                x = 0.5; y = 0.5; z = 0.2; //positionBack[] = {0,0,1.2}; optional
                xBack = 0.5; yBack = 0.5; zBack = 1;
                inBack = 1;
                enableZoom = 1;
                zoomDuration = 0.001;
                onload = "ctrlShow [_this,false]";

            };

        };
};
