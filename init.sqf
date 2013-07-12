// Init stuff.
// Credits : Head


_config = [] execVM "he_config.sqf";
_money = [] execVM "he_money.sqf";
_action = [] execVM "he_actions.sqf";
_jobs = [] execVM "he_jobs.sqf";
_inv = [] execVM "he_inventory.sqf";
waitUntil {scriptDone _action && scriptDone _money && scriptDone _jobs && scriptDone _inv };
call he_money_init;
call he_actions_init;
call he_jobs_init;
call he_inventory_init;
