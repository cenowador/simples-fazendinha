/// @description set view size

try{
	if(room == rm_credits){
		surface_resize(application_surface, GUI_W, GUI_H);
		exit;	
	}
	surface_resize(application_surface, IDEAL_WIDTH, IDEAL_HEIGHT);
	camera_set_view_size(view_camera[0], IDEAL_WIDTH, IDEAL_HEIGHT);
	display_set_gui_size(GUI_W, GUI_H);
}
catch(_err){
    fn_crash_handle(_err);
}
