/// @description set camera

try{
	surface_resize(application_surface, IDEAL_WIDTH, IDEAL_HEIGHT);
	camera_set_view_size(view_camera[0], IDEAL_WIDTH, IDEAL_HEIGHT);
	display_set_gui_size(IDEAL_WIDTH, IDEAL_HEIGHT);
}
catch(_err){
    fn_crash_handle(_err);
}
