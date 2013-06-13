_unit = _this select 0;
_classnames = _this select 1;
_stock = _this select 2;
_price = _this select 3;
_canKill = _this select 4;
// [this,["cake"],[1],[20],false]
_unit setVariable ["classnames",_classnames,true];
_unit setVariable ["stock",_stock,true];
_unit setVariable ["price",_price,true];

_unit addAction ["Shop","he_actions\shop.sqf","_this",3,false,false,"","(_target distance _this) < 10"]; 



