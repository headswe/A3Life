_listBox = 1500;
lbClear _listBox;
{
_name = _x;
_num = _x call he_inventory_get;
_name = format["%1 - x%2",_name,_num];
player sidechat _name;
if(_num > 0) then
{
lbAdd [_listBox,_name];
lbSetData [_listBox,lbSize _listBox-1,_x];
};
} foreach he_inventory_items;

