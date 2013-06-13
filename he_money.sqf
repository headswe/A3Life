he_money_init = {
_bankMon = player getVariable "bank_money";
_walletMon = player getVariable "wallet_money";
if(isnil "_bankMon" && isnil "_walletMon") then
{
	player setVariable ["bank_money",15000,true];
	player setVariable ["wallet_money",0,true];
	player globalChat "money inited";
};
};
////////// WALLET


/// Add
he_money_WalletAdd = {
_curMon = player getVariable "wallet_money";
if(!isnil "_curMon") then
{
	player setVariable ["wallet_money",_curMon + _this,true];
};
};

/// Remove\\\\\\\\\\\\\
he_money_WalletRemove = {
_curMon = player getVariable "wallet_money";
if(!isnil "_curMon") then
{
	player setVariable ["wallet_money",_curMon - _this,true];
};
};
he_money_WalletCharge = {
_value = true;
_curMon = player getVariable "wallet_money";
if(!isnil "_curMon") then
{
	if(_curMon - _this < 0) then
	{
		_value = false;
	}
	else
	{
		player setVariable ["wallet_money",_curMon - _this,true];
	};
};
_value
};
////////// BANK \\\\\\\\\\\\\\\\\\\\\\\\
he_money_BankAdd = {
_curMon = player getVariable "bank_money";
if(!isnil "_curMon") then
{
	player setVariable ["bank_money",_curMon + _this,true];
};
};
/// Remove
he_money_BankRemove = {
_curMon = player getVariable "bank_money";
if(!isnil "_curMon") then
{
	player setVariable ["bank_money",_curMon - _this,true];
};
};
he_money_BankCharge = {
_value = true;
_curMon = player getVariable "bank_money";
if(!isnil "_curMon") then
{
	if(_curMon - _this < 0) then
	{
		_value = false;
	}
	else
	{
		player setVariable ["bank_money",_curMon - _this,true];
	};
};
_value
};