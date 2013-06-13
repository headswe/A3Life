he_actions_initCiv = 
{
he_action_status = player addAction ["status", "he_actions\status.sqf","",0,false,false,"","_target == _this"];
};
he_actions_init = 
{
	[] call he_actions_initCiv;
};
