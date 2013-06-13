_can = _this select 0;
_item = _can getVariable "item";
_count = _can getVariable "itemCount";
if(!isnil "_item" && !isnil "_count") then
{
	deleteVehicle _can;
	[_item,_count] call he_inventory_add;
};