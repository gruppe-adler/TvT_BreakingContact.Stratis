addItemsToUniform = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToUniform _class;
    };
};

addMagazinesToVest = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToVest _class;
    };
};

addMagazinesToBackpack = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToBackpack _class;
    };
};