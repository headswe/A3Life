_what = _this select 0;
hint format["%1",_this];
if(_what == 1) then
{
	_stringNum = parseNumber (ctrlText 2400);
	_stringNum = round _stringNum;
	if(_stringNum > 0) then
	{
		if(_stringNum call he_money_BankCharge) then
		{
			_stringNum call he_money_WalletAdd;
			player sidechat "I removed money from the bank";
		}
		else
		{
			player sidechat "Don't have enough cash on the account";
		};
	};
}	
else
{
	_stringNum = parseNumber (ctrlText 2400);
	_stringNum = round _stringNum;
	if(_stringNum > 0) then
	{
		if(_stringNum call he_money_WalletCharge) then
		{
			_stringNum call he_money_BankAdd;
			player sidechat "I added money to the bank";
		}
		else
		{
		player sidechat "Don't have enough cash in my wallet.";
		};
	};	
};