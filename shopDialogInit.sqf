_listBox = 1500;
_shopUnit = player getVariable "currentShop";
he_fnc_test = {
_text = "error";
if(_this isKindOf "AllVehicles") then
{
_text = getText (configFile >> "CfgVehicles" >> _this >> "displayname");
};
if(isClass (configFile >> "CfgWeapons" >> _this)) then
{
_text = getText (configFile >> "CfgWeapons" >> _this >> "displayname");
};
if(isClass (configFile >> "CfgMagazines" >> _this)) then
{
_text = getText (configFile >> "CfgMagazines" >> _this >> "displayname");
};
_text
};
_price = _shopUnit getVariable "price";
_items = _shopUnit getVariable "classnames";
{
_name = _x call he_fnc_test;
_priceNum = _price select _forEachIndex;
_stock = 1;
_name = format["%1 - %2 - %3",_name,_priceNum call he_money_sign,_stock];
lbAdd [_listBox,_name]
} foreach _items;

