_array = _this select 0;

 if (count _array > 1) then {
  _first = _array select 0;
  _next = _array select 1;
  _last = _array select (count _array -1);

  {
   if (_foreachindex < (count _array) -1) then {
    _array set [_foreachindex,_array select (_foreachindex + 1)]
   };
  } forEach _array;
  _array set [(count _array) - 1,_first];
 };

 _array