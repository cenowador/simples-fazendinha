/// @description Insert description here

try{
	global.ui_surface = noone;
	CreateUiSurface = function(){
		if(!surface_exists(global.ui_surface)){
			global.ui_surface = surface_create(GUI_W, GUI_H);
			draw_clear_alpha(c_white, 1);
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












