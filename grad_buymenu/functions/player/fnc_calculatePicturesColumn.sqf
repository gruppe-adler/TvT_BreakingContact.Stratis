/* client side */
/* calculation of model picture column */

fnc_calculatePicturesColumn = {

	_entriesCount = _this select 0;
	_currentColumn = _this select 1;
	_currentColumn = _currentColumn;

	_100percent = (safeZoneX + safeZoneW);
	_singleWidth = (_100percent/_entriesCount);

	_xCoordinate = (_100percent - (_currentColumn * _singleWidth)) + _singleWidth/2 + safeZoneX/2;

	[_xCoordinate,_singleWidth]

};
