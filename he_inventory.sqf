he_inventory_init = {
private ["_inArr","_invArrCount","_arr"];
_inArr = player getVariable "invArr";
_invArrCount = player getVariable "invArrCount";
if(isnil "_inArr" && isnil "_invArrCount") then
{
	player setVariable ["invArr",he_inventory_items,true];
	_arr = [];
	{
		_arr = _arr + [1];
	} foreach he_inventory_items;
	player setVariable ["invArrCount",_arr,true];
	player globalChat "inventory inited";
};
};
he_inventory_check = {
private ["_value","_inArr","_invArrCount"];
_value = true;
_inArr = player getVariable "invArr";
_invArrCount = player getVariable "invArrCount";
if(isnil "_inArr" && isnil "_invArrCount") then
{
	_value = false;
};
_value
};
///// inventory add
/// example ["Iron",2] ... adds 2 to the players inventory.
/// return true or false
he_inventory_add = {
private ["_value","_inArr","_invArrCount","_count","_index"];
_value = false;
player sidechat format["%1",_this];
if(call he_inventory_check) then
{
	_inArr = player getVariable "invArr";
	_invArrCount = player getVariable "invArrCount";
	_index = _inArr find (_this select 0);
	if(_index >= 0) then
	{
		_count = _invArrCount select _index;
		player sidechat format["%1",(_this select 1)];
		_count = _count + (_this select 1);
		_invArrCount set [_index,_count];
		_value = true;
	};
};
_value
};
// adds action to take items from a container.
he_addAction_take = {
private ["_item","_count"];
if(isnil "_this") then
{
_item = _this getVariable "item";
_count = _this getVariable "itemCount";
_this addAction [format["Take x%2 %1",_item,_count],"he_actions\takeItem.sqf","_this",3,false,false,"","(_target distance _this) < 10"]; 
};
};
///// inventory remove
/// example ["Iron",2] ... remove 2 to the players inventory.
/// return true or false
he_inventory_remove = {
private ["_value","_inArr","_invArrCount","_count","_index"];
_value = false;
if(call he_inventory_check) then
{
	_inArr = player getVariable "invArr";
	_invArrCount = player getVariable "invArrCount";
	_index = _inArr find (_this select 0);
	if(_index >= 0) then
	{
		_count = _invArrCount select _index;
		_count = _count - (_this select 1);
		if(_count < 0) then
		{
			_count = 0;
		};
		_invArrCount set [_index,_count];
		_value = true;
	};
};
_value
};

he_inventory_get = {
private ["_inArr","_invArrCount","_index","_value"];
_value = -1;
if(call he_inventory_check) then
{
	_inArr = player getVariable "invArr";
	_invArrCount = player getVariable "invArrCount";
	_index = _inArr find _this;
	if(_index >= 0) then
	{
		_value = _invArrCount select _index;
	};
};
_value
};
he_inventory_drop = {
private ["_item","_count","_index","_can"];
_item = _this select 0;
_count = _this select 1;
[_item,_count] call he_inventory_remove;
_index = _inArr find _item;
player sidechat format["%1",_this];
_can = "Land_CanisterPlastic_F" CreateVehicle getpos player;
_can setVariable ["item",_item,true];
_can setVariable ["itemCount",_count,true];
[_can,he_addAction_take,true,false] spawn BIS_fnc_MP; // MPFIY THIS.
}; // [[_name,1],he_inventory_drop,true,false] spawn BIS_fnc_MP

he_inventory_guiDrop = {
private ["_index","_name"];
_index = lbCurSel 1500;
_name = lbData [1500,_index];
player sidechat _name;
[_name,1] call he_inventory_drop;
};
