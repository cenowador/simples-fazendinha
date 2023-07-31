/// @description calls user ev 0

try{
	if(called_draw){
		exit;	
	}
	event_user(0);
	called_draw = true;
}
catch(_err){
    fn_crash_handle(_err);
}












