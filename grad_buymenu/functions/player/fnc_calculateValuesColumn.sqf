// calculate x position and width of a column

fnc_calculateValuesColumn = {
	_entriesCount = _this select 0;
	_currentColumn = _this select 1;
	_currentColumn = _currentColumn;

	_100percent = (safeZoneX + safeZoneW);
	_singleWidth = (_100percent/_entriesCount);

	_xCoordinate = (_100percent - (_currentColumn * _singleWidth)) + safeZoneX/2;

	[_xCoordinate,_singleWidth]
};