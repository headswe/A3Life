// This handles the act of buying something from a shopkeeper, supports vehicles,items,magazines,weapons
// Credit: head

_listBox = 1500;
_shopUnit = player getVariable "currentShop";
_items = _shopUnit getVariable "classnames";
_prices = _shopUnit getVariable "price";
_index = lbCurSel _listBox;
if(_index > count _items) then
{
	player sidechat "Im broke go away";
	breakOut "asdasd";
	};
if( _index == -1) then
{
	player sidechat "Select something...";
	breakOut "asdasd";
};
_item = _items select _index;
_price = _prices select _index;
if(_price call he_money_WalletCharge) then
{
hint format["%1:%2",_item,_price];
if(_item isKindOf "AllVehicles") then
{
_item createVehicle (getpos player)
};
if(isClass (configFile >> "CfgWeapons" >> _item)) then
{
	player sidechat "Is type Weapon";
	_itemClass = format["%1",inheritsFrom (configFile >> "CfgWeapons" >> _item)];
	player sidechat _itemClass;
	_itemClass = [_itemClass,"/"] call BIS_fnc_splitString;
	//player sidechat _itemClass;
	_value = getNumber (configFile >> "CfgWeapons" >> _item >> "type");
	player sidechat format["%1",_value];
	if(_value == 2 || _value == 1 || "Launcher_Base_F" in _itemClass) then
	{
		player addweapon _item;
		player sidechat "Bought Weapon";
	};
	if("ItemCore" in _itemClass) then
	{
		player sidechat "Bought Item";
		player additem _item;
	};
};
if(isClass (configFile >> "CfgMagazines" >> _item)) then
{
	player addmagazine _item;
};
}
else
{
	player sidechat "Not enough cash to buy this item...";
};


