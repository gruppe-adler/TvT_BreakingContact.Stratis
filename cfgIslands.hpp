class CfgIslands {
    class Altis {
        displayName = "Altis";
        type = "mediterranean";
        isWoodland = true;
        spawnPosBlu[] = {8454.05,25140.7,0};
        spawnPosOpf[] = {8712.9,25205.4,0};
        previewCamPos[] = {5279.3,11319.1,0};
        previewCamTarget[] = {5047.8,11146.8,0};
        locationBlacklist[] = {
            "AAC airfield",
            "Agios Georgios",
            "Agios Georgios",
            "Agios Kosmas",
            "Agios Panagiotis",
            "Aktinarki",
            "Almyra",
            "Atsalis",
            "Bomos",
            "Cap Agrios",
            "Cap Drakontas",
            "Cap Kategidis",
            "Cap Makrinos",
            "Cap Thelos",
            "Cap Zefyris",
            "Chelonisi",
            "Drimea",
            "dump",
            "Edoris",
            "Faros",
            "Fournos",
            "Gori",
            "Kavala Pier",
            "Limni",
            "Livadi",
            "Makrynisi",
            "Mazi",
            "mine",
            "Molos Airfield",
            "Monisi",
            "Nychi",
            "Ochrolimni",
            "Pyrgi",
            "quarry",
            "Sagonisi",
            "Savri",
            "Sideras",
            "Surf Club",
            "Xirolimni Dam",
            "Zeloran"
        };
    };

    class Beketov {
        displayName = "Beketov";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {-258.376,308.728,0};
        spawnPosOpf[] = {-249.061,955.673,0};
        previewCamPos[] = {7922.44,4267.45,0};
        previewCamTarget[] = {8098.12,4289.63,0};
        locationBlacklist[] = {
            "Belokamenka",
            "Dorogino",
            "Limonovo",
            "Malaevo",
            "Oblepikhino",
            "SWAMP"
        };
    };

    class Chernarus {
        displayName = "Chernarus";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {15074.6,14748.2,0};
        spawnPosOpf[] = {15128.1,13945.9,0};
        previewCamPos[] = {11847.9,8954.7,0};
        previewCamTarget[] = {11994.3,9141.31,0};
        locationBlacklist[] = {
            "airfield",
            "airstrip",
            "Black Forest",
            "Blunt Rocks",
            "Cap Golova",
            "Dichina",
            "Drakon",
            "Green Mountain",
            "Grozovoy Pass",
            "Kopyto",
            "Krutoy Cap",
            "Kumyrna",
            "Novy Lug",
            "Old Fields",
            "Pass Oreshka",
            "Pass Sosnovy",
            "power plant",
            "quarry",
            "Skalisty Island",
            "Skalka",
            "Three Valleys",
            "Vysota"
        };
    };

    class Chernarus_Summer: Chernarus {};
    class Chernarus_winter: Chernarus {};

    class dingor {
        displayName = "Dingor";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {1096.81,9389.22,0};
        spawnPosOpf[] = {889.053,9438.74,0};
        previewCamPos[] = {4101.22,4372.11,0};
        previewCamTarget[] = {4260.88,4542.04,0};
        locationBlacklist[] = {
            "Puente Malargo",
            "Mt. Toris"
        };
    };

    class Intro {
        displayName = "Ramahdi";
        type = "middle eastern";
        isWoodland = false;
        sizeFactor = 0.30;
        spawnPosBlu[] = {1604.93,1575.83,0};
        spawnPosOpf[] = {1542.37,1750.86,0};
        previewCamPos[] = {3151.42,3039.7,0};
        previewCamTarget[] = {2907.92,2885.13,0};

        class customLocations {
            class Ramahdi {
                name = "Ramahdi";
                type = "NameVillage";
                pos[] = {2893.81,2879.46,0};
            };
        };
    };

    class fallujah {
        displayName = "Fallujah";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {10226.5,605.61,0};
        spawnPosOpf[] = {10204.2,1033.22,0};
        previewCamPos[] = {5272.81,4593.33,0};
        previewCamTarget[] = {5401.2,4490.22,0};

        class customLocations {
            class airfieldN {
                name = "Airfield North";
                type = "NameCityCapital";
                pos[] = {7972.45,2142.85,0};
            };

            class airfieldS {
                name = "Airfield South";
                type = "NameCityCapital";
                pos[] = {8304.41,1593.64,0};
            };

            class hotel {
                name = "Hotel";
                type = "NameVillage";
                pos[] = {8231.46,5520.07,0};
            };

            class village1 {
                name = "Shakbur";
                type = "NameVillage";
                pos[] = {9068.4,9026.81,0};
            };

            class FOB {
                name = "FOB";
                type = "NameVillage";
                pos[] = {5692.07,9856.37,0};
            };

            class powerplant {
                name = "Power Plant";
                type = "NameVillage";
                pos[] = {687.158,8340.91,0};
            };

            class outskirts1 {
                name = "Outskirts";
                type = "NameVillage";
                pos[] = {3890.94,2827.52,0};
            };

            class milbase {
                name = "Military Base";
                type = "NameCity";
                pos[] = {2927.96,6340.07,0};
            };
        };
    };

    class fata {
        displayName = "Fata";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {10616.3,8942.11,0};
        spawnPosOpf[] = {10723.9,10105,0};
        previewCamPos[] = {3947.86,3766.57,0};
        previewCamTarget[] = {4045.79,3631.37,0};
        locationBlacklist[] = {
            "Goram Valley",
            "Kabashir Forest",
            "Mouaneb",
            "Mussara Bridge",
            "Paktita Valley",
            "Serpent's Road",
            "Sirika",
            "Suhani Valley",
            "Sukri River",
            "Tamir Bridge",
            "Tamir Highway",
            "Tamir River"
        };
    };

    class lingor3 {
        displayName = "Lingor";
        type = "tropic";
        isWoodland = true;
        spawnPosBlu[] = {1096.81,9389.22,0};
        spawnPosOpf[] = {889.053,9438.74,0};
        previewCamPos[] = {4101.22,4372.11,0};
        previewCamTarget[] = {4260.88,4542.04,0};
        locationBlacklist[] = {
            "Puente Malargo",
            "Mt. Toris"
        };
    };

    class lythium {
        displayName = "Lythium";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {-788.312,169.817,0};
        spawnPosOpf[] = {240.184,-536.609,0};
        previewCamPos[] = {9744.18,11424.5,0};
        previewCamTarget[] = {9860.08,11091.6,0};
        locationBlacklist[] = {};
    };

    class Malden {
        displayName = "Malden";
        type = "mediterranean";
        isWoodland = true;
        spawnPosBlu[] = {10092.8,6046.75,0};
        spawnPosOpf[] = {9912.59,5925.78,0};
        previewCamPos[] = {3072.14,6510.89,0};
        previewCamTarget[] = {3261.39,6395.49,0};
        locationBlacklist[] = {
            "Pegasus Air Co.",
            "Moray",
            "Faro",
            "harbor"
        };
    };

    class mbg_celle2 {
        displayName = "Celle";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {13121.7,12175.6,0};
        spawnPosOpf[] = {12488.2,12689.2,0};
        previewCamPos[] = {5550.89,3959.02,0};
        previewCamTarget[] = {5740.59,3945.92,0};
        locationBlacklist[] = {};
    };

    class Porto {
        displayName = "Porto";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {1376.64,628.892,0};
        spawnPosOpf[] = {1136.77,671.378,0};
        previewCamPos[] = {2879.93,2515.96,0};
        previewCamTarget[] = {2715.8,2438.52,0};
        sizeFactor = 0.30;

        class customLocations {
            class portoHarbor {
                name = "Porto Harbor";
                type = "NameCity";
                pos[] = {2589.53,2232.25,0};
            };
        };
    };

    class prei_khmaoch_luong {
        displayName = "Prei Khmaoch Luong";
        type = "tropic";
        isWoodland = true;
        spawnPosBlu[] = {8034,8372,0};
        spawnPosOpf[] = {8284,8104,0};
        previewCamPos[] = {3939,4968,0};
        previewCamTarget[] = {3853,4930,0};
    };

    class WL_Rosche {
        displayName = "Rosche";
        type = "european";
        isWoodland = true;
        spawnPosBlu[] = {552,4759,0};
        spawnPosOpf[] = {940,3239,0};
        previewCamPos[] = {3939,4968,0};
        previewCamTarget[] = {3853,4930,0};
    };

    class ruha {
        displayName = "Ruha";
        type = "european";
        isWoodland = true;
        spawnPosBlu[] = {0,0,0};
        spawnPosOpf[] = {8284,8104,0};
        previewCamPos[] = {3939,4968,0};
        previewCamTarget[] = {3853,4930,0};
    };

    class Stratis {
        displayName = "Stratis";
        type = "mediterranean";
        isWoodland = true;
        spawnPosBlu[] = {1540, 5015,0};
        spawnPosOpf[] = {1800, 6000,0};
        previewCamPos[] = {2866.68,5832.54,0};
        previewCamTarget[] = {2898.26,5944.2,0};
        locationBlacklist[] = {
            "airfield",
            "Kamino Coast",
            "LZ Baldy",
            "Pythos",
            "The Spartan",
            "Xiros"
        };
    };

    class Sara_dbe1 {
        displayName = "United Sahrani";
        type = "mediterranean";
        isWoodland = true;
        spawnPosBlu[] = {17997.3,18808.7,0};
        spawnPosOpf[] = {18177.5,18120.4,0};
        previewCamPos[] = {10939.1,9586.23,0};
        previewCamTarget[] = {10734.8,9492.12,0};
        locationBlacklist[] = {
            "Antigua",
            "Cabo Canino",
            "Cabo de Fidel",
            "Cabo Gavio",
            "Cabo Gavio",
            "Cabo Indice",
            "Cabo Juventudo",
            "Cabo Santa Lucia",
            "Cabo Valiente",
            "Calha de Cayo",
            "Calheta de Cedras",
            "Calheta Demiseca",
            "Calheta Seca",
            "Cimas Dobles",
            "El Gordo",
            "Isla Arimar",
            "Isla de la Caja",
            "Isla de Libertad",
            "Isla de los Tojos",
            "Isla de Matey",
            "Isla del Vassal",
            "Isla del Vida",
            "Isla del Zorra",
            "Isla des Compadres",
            "Islas Gatunas",
            "Matas",
            "Monte Asharah",
            "Monte Galassi",
            "Parvulo",
            "Passo Epone",
            "Passo Paradiso",
            "Passo San Andres",
            "Passo San Marco",
            "Pesadas",
            "Puntas Occidental",
            "Puntas Oriental",
            "Roca del Dror",
            "Rocara",
            "San Peregrino",
            "San Tomas",
            "Sierra de los Pinos",
            "Sierra Madre",
            "Sierra Masbete",
            "Sierra Pita",
            "Terra Acorcha",
            "Terra Marismo",
            "Trelobada",
            "Tres Valles",
            "Valle Azul",
            "Valle de Carmen",
            "Vallejo"
        };
    };

    class Shapur_BAF {
        displayName = "Shapur";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {2881.15,1992.91,0};
        spawnPosOpf[] = {2626.44,2236.07,0};
        previewCamPos[] = {1265.21,1192.48,0};
        previewCamTarget[] = {1353.71,1124.39,0};
        sizeFactor = 0.75;
        locationBlacklist[] = {
            "airfield"
        };
    };

    class Takistan {
        displayName = "Takistan";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {13662.5,3886.99,0};
        spawnPosOpf[] = {13727.4,4748.37,0};
        previewCamPos[] = {6459.43,11181,0};
        previewCamTarget[] = {6341.68,11236.5,0};
        locationBlacklist[] = {
            "airfield",
            "Bala pass",
            "Darbang pass",
            "Jaza",
            "Loy Manara oilfield",
            "military base",
            "Nagara-1 oilfield",
            "Nar",
            "Naran Darre pass",
            "Naygul valley",
            "Par-e Siah oilfield",
            "Sar-e Sang pass"
        };
    };

    class Tanoa {
        displayName = "Tanoa";
        type = "tropic";
        isWoodland = true;
        spawnPosBlu[] = {1389.42,947.902,0};
        spawnPosOpf[] = {1150.11,593.379,0};
        previewCamPos[] = {7526.8,8318.33,0};
        previewCamTarget[] = {7499.85,8449.76,0};
        locationBlacklist[] = {
            "camp remnants",
            "Ile Sainte-Marie",
            "Ravi-ta Island",
            "vehicle range",
            "GSM station",
            "Comms Whiskey",
            "firing range",
            "maze",
            "Mont Tanoa",
            "harbor remnants",
            "Ile Douen",
            "Red Spring surface mine",
            "Yasa Island",
            "Sosovu Island",
            "railway depot",
            "diesel power plant",
            "temple ruins",
            "banana plantations",
            "plantation",
            "lumberyard",
            "fuel depot",
            "Yani Islets",
            "cocoa plantations",
            "sawmill",
            "Ile Saint-George",
            "ferry",
            "fortress ruins",
            "Tuadua Island",
            "Imuri Island"
        };
    };

    class utes {
        displayName = "Utes";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {4377.08,2324.57,0};
        spawnPosOpf[] = {4315.79,2452.54,0};
        previewCamPos[] = {3637.3,3719.64,0};
        previewCamTarget[] = {3572.53,3690.84,0};
        sizeFactor = 0.75;
        locationBlacklist[] = {
            "USS Khe Sanh"
        };
    };

    class vt5 {
        displayName = "vt5";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {5709.2,6239.52,0};
        spawnPosOpf[] = {6156.56,5841.48,0};
        previewCamPos[] = {3892.89,2751.88,0};
        previewCamTarget[] = {3941.14,2644.39,0};
        sizeFactor = 0.75;
        locationBlacklist[] = {};
        class customLocations {
            class powerplant {
                name = "power plant";
                type = "NameCity";
                pos[] = {3260.85,3464.43};
            };
            class radiotower {
                name = "Mätäsvaara";
                type = "NameVillage";
                pos[] = {801.424,484.858};
            };
            class airfield {
                name = "airfield";
                type = "NameVillage";
                pos[] = {212.334,405.515};
            };
            class gasStation {
                name = "gas station";
                type = "NameVillage";
                pos[] = {2381.52,1499.99};
            };
            class factory {
                name = "Röykkä";
                type = "NameCity";
                pos[] = {741.191,5601.93};
            };
            class garages {
                name = "Klaukkala";
                type = "NameCity";
                pos[] = {4921.19,4142.72};
            };
            class fields {
                name = "Hyrylä";
                type = "NameCity";
                pos[] = {5009.03,2233.1};
            };
            class haybales {
                name = "Kärpänkylä";
                type = "NameVillage";
                pos[] = {4194.69,2172.19};
            };
            class forest {
                name = "Parkumäki";
                type = "NameVillage";
                pos[] = {3900.89,2701.57};
            };
            class peninsula {
                name = "Tuukkala";
                type = "NameVillage";
                pos[] = {3482.91,1596.57};
            };
        };
    };

    class Woodland_ACR {
        displayName = "Bystrica";
        type = "russian";
        isWoodland = true;
        spawnPosBlu[] = {-731.747,-209.233,0};
        spawnPosOpf[] = {-486.606,323.952,0};
        previewCamPos[] = {5131.69,1635.64,0};
        previewCamTarget[] = {5065.48,1547.17,0};
        sizeFactor = 1;
        locationBlacklist[] = {};
        class customLocations {
            class cherno {
                name = "Chernogorsk";
                type = "NameCityCapital";
                pos[] = {1358.15,1684.27,0};
            };

            class elektro {
                name = "Elektrozavodsk";
                type = "NameCity";
                pos[] = {5145.3,1462.94,0};
            };

            class elektroHarbor {
                name = "Elektro Harbor";
                type = "NameCity";
                pos[] = {4735.83,1111.63,0};
            };

            class farms {
                name = "Farms";
                type = "NameCity";
                pos[] = {2560.86,2637.29,0};
            };

            class pusta {
                name = "Pusta";
                type = "NameVillage";
                pos[] = {3761.12,3020.14,0};
            };
        };
    };

    class Zargabad {
        displayName = "Zargabad";
        type = "middle eastern";
        isWoodland = false;
        spawnPosBlu[] = {7396.98,5339.07,0};
        spawnPosOpf[] = {7756.23,5303.44,0};
        previewCamPos[] = {3847.33,4568.03,0};
        previewCamTarget[] = {3754.99,4477.96,0};
        locationBlacklist[] = {
            "airfield",
            "Firuz Baharv"
        };
        class customLocations {
            class barracks {
                name = "Barracks";
                type = "NameVillage";
                pos[] = {3956.09,2787.43,0};
            };
        };
    };
};
