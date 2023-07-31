/// @description clear surface and return time

try{
	if(surface_exists(surf_bg)){
		surface_free(surf_bg);	
		surf_bg = noone;
	}
	if(buffer_exists(surf_buff)){
		buffer_delete(surf_buff);
		surf_buff = noone;
	}
	if(buffer_exists(ui_buff)){
		buffer_delete(ui_buff);
		ui_buff = noone;
	}
	
	with(_obj_time){
		time_counting = true;	
	}
}
catch(_err){
    fn_crash_handle(_err);
}












