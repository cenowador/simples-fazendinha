/// @description Insert description here

try{
	if(keyboard_check_pressed(vk_add) && debug_mode){
		time_current += 60*60;
	}
	if(keyboard_check_pressed(vk_multiply) && debug_mode){
		AdvanceDay();
	}
}
catch(_err){
    fn_crash_handle(_err);
}
