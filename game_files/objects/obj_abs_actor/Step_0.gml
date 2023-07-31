/// @description run state machine

try{
	if(global.sleeping){
		exit;	
	}
	state_machine.Update();
}
catch(_err){
    fn_crash_handle(_err);
}

