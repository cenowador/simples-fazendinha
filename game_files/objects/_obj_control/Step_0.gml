/// @description debug tools

try{
    if(debug_mode){
		if(keyboard_check_pressed(ord("R"))){
			game_restart();
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}

