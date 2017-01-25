/*
 * Original Author: Ruthberg
 * ripped by nomisum to his needs
 * Displays a wind info (colored arrow) at [cursor position]
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_displayWindInfo
 *
 * Public: No
 */

fnc_displayWindInfo = {
    #include "\z\ace\addons\main\script_component.hpp"

    // #define __dsp (uiNamespace getVariable "GRAD_buy_menu_select_airdrop")
    #define __dsp (uiNamespace getVariable "GRAD_buy_menu_select_airdrop")
    #define __ctrl (__dsp displayCtrl 2339)

    #define _mapcontrol (__dsp displayCtrl 2338)

    mousePositionOnWorld = [0,0];
    // _mapdisplay = uiNamespace getVariable ['GRAD_buy_menu_select_airdrop',0];

    /*
    if (GVAR(WindInfo)) exitWith {
        GVAR(WindInfo) = false;
        (["GRAD_buy_menu_select_airdrop"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
        true
    };
    */

    EGVAR(advanced_ballistics,Protractor) = false;
    1 cutText ["", "PLAIN"];
    /* GVAR(WindInfo) = true;


    TRACE_1("Starting Wind Info PFEH", GVAR(WindInfo));
    */

    [{
        disableSerialization;
        params ["", "_pfID"];

        if (!dialog) exitWith {
            // TRACE_1("Ending Wind Info PFEH", GVAR(WindInfo));
            // GVAR(WindInfo) = false;
            // (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };

        _mouseCoordEH = _mapcontrol ctrlAddEventHandler
            [
            	"MouseMoving",
            	{
            		mousePositionOnWorld = (_this select 0) ctrlMapScreenToWorld [_this select 1,_this select 2];
                // diag_log format ["mousePositionOnWorld %1", mousePositionOnWorld];
            	}
            ];

        //Keeps the display open:
        // (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutRsc ["RscWindIntuitive", "PLAIN", 1, false];
        _windSpeed = vectorMagnitude ACE_wind;


        private _playerDir = 0; // always north // (ACE_player call CBA_fnc_headDir) select 0;
        private _windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);
        _windDir = 30 * (round(((_windDir - _playerDir + 360) % 360) / 30));

        _windDirString = localize ([
              LSTRING(S),
              LSTRING(SSW),
              LSTRING(SW),
              LSTRING(WSW),
              LSTRING(W),
              LSTRING(WNW),
              LSTRING(NW),
              LSTRING(NNW),
              LSTRING(N),
              LSTRING(NNE),
              LSTRING(NE),
              LSTRING(ENE),
              LSTRING(E),
              LSTRING(ESE),
              LSTRING(SE),
              LSTRING(SSE),
              LSTRING(S)
          ] select (round (_windDir / 360 * 16)));

        // Color Codes from https://en.wikipedia.org/wiki/Beaufort_scale#Modern_scale
        private _beaufortNumber = 0;
        private _windColor = [1, 1, 1, 1];
        if (_windSpeed > 0.3) then { _windColor = [0.796, 1, 1, 1]; _beaufortNumber = 1; };
        if (_windSpeed > 1.5) then { _windColor = [0.596, 0.996, 0.796, 1]; _beaufortNumber = 2; };
        if (_windSpeed > 3.3) then { _windColor = [0.596, 0.996, 0.596, 1]; _beaufortNumber = 3; };
        if (_windSpeed > 5.4) then { _windColor = [0.6, 0.996, 0.4, 1]; _beaufortNumber = 4; };
        if (_windSpeed > 7.9) then { _windColor = [0.6, 0.996, 0.047, 1]; _beaufortNumber = 5; };
        if (_windSpeed > 10.7) then { _windColor = [0.8, 0.996, 0.059, 1]; _beaufortNumber = 6; };
        if (_windSpeed > 13.8) then { _windColor = [1, 0.996, 0.067, 1]; _beaufortNumber = 7; };
        if (_windSpeed > 17.1) then { _windColor = [1, 0.796, 0.051, 1]; _beaufortNumber = 8; };
        if (_windSpeed > 20.7) then { _windColor = [1, 0.596, 0.039, 1]; _beaufortNumber = 9; };
        if (_windSpeed > 24.4) then { _windColor = [1, 0.404, 0.031, 1]; _beaufortNumber = 10; };
        if (_windSpeed > 28.4) then { _windColor = [1, 0.22, 0.027, 1]; _beaufortNumber = 11; };
        if (_windSpeed > 32.6) then { _windColor = [1, 0.078, 0.027, 1]; _beaufortNumber = 12; };

        if (_beaufortNumber < 1) then {
          hintSilent "No Wind";
        }
          else {

          hintSilent parseText format ["Wind Force - <t size='2'>%1</t>
            <br/>Wind Angle - <t size='2'>%2</t>",_beaufortNumber,_windDirString];
          };
        /*
        TRACE_3("update display",_beaufortNumber,_windDir,_windSpeed);
        __ctrl ctrlSetTextColor _windColor;
        if (_beaufortNumber > 0) then {
          diag_log "beaufort > 0";
            __ctrl ctrlSetText QPATHTOEF(weather,UI\wind_arrow_ca.paa);
            __ctrl ctrlSetAngle [_windDir, 0.5, 0.5];
        } else {
          diag_log "nowind";
            __ctrl ctrlSetText QPATHTOEF(weather,UI\wind_noneCircle_ca.paa);
        };
        __ctrl ctrlCommit 0;

        //Update the beaufort balls:

        (ctrlPosition __ctrl) params ["_ctrlX", "_ctrlY", "_ctrlWidth", "_ctrlHeight"];
        private _centerX = _ctrlX + _ctrlWidth / 2;
        private _centerY = _ctrlY + _ctrlHeight / 2;
        private _ballHeight = _ctrlHeight / 17;
        private _ballWidth = _ballHeight * 3/4;

        for "_index" from 0 to (_beaufortNumber - 1) do {
            private _ball = __dsp ctrlCreate ["RscPicture", _index];
            _ball ctrlSetText QPATHTOEF(weather,UI\wind_dot_ca.paa);
            _ball ctrlSetTextColor [1,1,1,1];
            private _ballCenterX = _centerX - (_ballWidth / 2) + ((sin _windDir) * 0.013333) * (_index - 4.9) + ((cos _windDir) * 0.0125);
            private _ballCenterY = _centerY - (_ballHeight / 2) - ((1 * cos _windDir) * 4/3*0.013333) * (_index - 4.9) + ((sin _windDir) * 0.0125);
            _ball ctrlSetPosition [_ballCenterX, _ballCenterY, _ballWidth, _ballHeight];
            _ball ctrlCommit 0;
        };
        */

    }, 0.5, []] call CBA_fnc_addPerFrameHandler;

    true
};
