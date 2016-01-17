_thisUnit = _this select 0;

fnc_setUnitInsignias =
{
                _unit = _this select 0;
                _patch = _this select 1;
                _index = 1;
                {
                        if (_x == "rank") exitwith {_index = _foreachindex;};
                }       foreach getarray (configfile >> "CfgVehicles" >> gettext ( configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");
                _unit setObjectTextureGlobal [_index, _patch];
};
 
_group = group _thisUnit;   
        switch (_group) do
        {
                case "Command":
                {
                        [_thisUnit, "pic\insignia\command.paa"] call fnc_setUnitInsignias;
                };
                case "Alpha":
                {
                        [_thisUnit, "pic\insignia\alpha.paa"] call fnc_setUnitInsignias;
                };
                 case "Bravo":
                {
                        [_thisUnit, "pic\insignia\bravo.paa"] call fnc_setUnitInsignias;
                };
                case "Charlie":
                {
                        [_thisUnit, "pic\insignia\charlie.paa"] call fnc_setUnitInsignias;
                };
                 case "Delta":
                {
                        [_thisUnit, "pic\insignia\delta.paa"] call fnc_setUnitInsignias;
                };
                case "Foxtrot":
                {
                        [_thisUnit, "pic\insignia\foxtrot.paa"] call fnc_setUnitInsignias;
                };
                case "Golf":
                {
                        [_thisUnit, "pic\insignia\golf.paa"] call fnc_setUnitInsignias;
                };
                case "Hotel":
                {
                        [_thisUnit, "pic\insignia\hotel.paa"] call fnc_setUnitInsignias;
                };
                case "India":
                {
                        [_thisUnit, "pic\insignia\india.paa"] call fnc_setUnitInsignias;
                };
                case "Air":
                {
                        [_thisUnit, "pic\insignia\air.paa"] call fnc_setUnitInsignias;
                };
                default {};
        };