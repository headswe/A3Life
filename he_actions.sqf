// Includes functions for civilians.
// Credits : Head


he_actions_initCiv = 
{
he_action_status = player addAction ["status", "he_actions\status.sqf","",0,false,false,"","_target == _this"];
};

// this is called from init.sqf
he_actions_init = 
{
	[] call he_actions_initCiv;
};
