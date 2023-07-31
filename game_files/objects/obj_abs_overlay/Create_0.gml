/// @description variables

try{
	white_overlay = false;
	draw_ui = true;
	
	surf_bg = noone;
	var _sb = fn_init_instance_variable("surf_buff")??noone;
	if(buffer_exists(_sb)){
		var _s = GUI_W*GUI_H*4;
		var _b = buffer_create(_s, buffer_fast, 1);
		buffer_copy(_sb, 0, _s, _b, 0);
	}
	surf_buff = _sb;
	ui_buff = noone;
	if(surface_exists(global.ui_surface)){
		ui_buff = buffer_create(GUI_W*GUI_H*4, buffer_fast, 1);
		buffer_get_surface(ui_buff, global.ui_surface, 0);	
	}
	
	deactivated_instances = [];
	deactivating_exceptions = [_obj_cursor];
	AddDeactivationException = function(_exc){
		array_push(deactivating_exceptions, _exc);	
	}
	OpenOverlay = function(){
		alarm[1] = 1;
	}
	__AfterClosing = function(_args){}
	closing_arg = noone;
	CloseOverlay = function(_arg){
		closing_arg = _arg;
		fn_instance_activate_all(deactivated_instances);
		alarm[0] = 1;
	}
	
	AddDeactivationException(obj_world_day);
	AddDeactivationException(_obj_time);
	with(_obj_time){
		time_counting = false;	
	}
}
catch(_err){
    fn_crash_handle(_err);
}
