/// @description copies screen

try{
	if(!buffer_exists(surf_buff)){
		var _sw = surface_get_width(application_surface);
		var _sh = surface_get_height(application_surface);
		surf_buff = buffer_create(_sw*_sh*4, buffer_fast, 1);
		buffer_get_surface(surf_buff, application_surface, 0);
	}
	if(!surface_exists(surf_bg)){
		var _sw = surface_get_width(application_surface);
		var _sh = surface_get_height(application_surface);
		surf_bg = surface_create(_sw, _sh);
		buffer_set_surface(surf_buff, surf_bg, 0);
	}
	var _light = 0;
	with(obj_world_day){
		_light = GetLight();
	}
	shader_set(shd_day);
	shader_set_uniform_f(shader_get_uniform(shd_day, "time_of_day"), _light);
	gpu_set_blendenable(false);
	draw_surface_stretched(surf_bg, 0, 0, GUI_W, GUI_H);
	gpu_set_blendenable(true);
	shader_reset();
	
	if(white_overlay){
		draw_sprite_stretched(spr_ui_white_overlay, 0, 0, 0, GUI_W, GUI_H);
	}
	
	if(draw_ui){
		if(!surface_exists(global.ui_surface)){
			if(buffer_exists(ui_buff)){
				global.ui_surface = surface_create(GUI_W, GUI_H);
				buffer_set_surface(ui_buff, global.ui_surface, 0);
			}
		}
		draw_surface(global.ui_surface, 0, 0);
	}
}
catch(_err){
    fn_crash_handle(_err);
}












