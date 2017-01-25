fnc_refreshCredits = {
    _title = _this select 0;
    disableSerialization;

    _createdGui = uiNamespace getVariable ['GRAD_buy_menu_var', 0];
    _ctrlCredits = _createdGui displayctrl 2001;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#ffffff' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;

    sleep 0.1;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#f9f6ec' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.09;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#f3edd8' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.08;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#ece4c5' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.07;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#e6dbb2' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.06;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#e0d29f' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.05;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#dac88b' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.04;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#d4bf78' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.03;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#cdb665' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.02;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#c7ad51' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;
    sleep 0.01;

    _ctrlCredits ctrlSetStructuredText parseText ("<t color='#c1a43e' size='2' shadow='0' align='center'>" + (str _title) + "<t size='1'> cr</t></t>");
    _ctrlCredits ctrlCommit 0;

};
