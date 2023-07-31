/// @description draw app surface

try{
	shader_set(shd_day);
	shader_set_uniform_f(shader_get_uniform(shd_day, "time_of_day"), GetLight());
	gpu_set_blendenable(false);
	draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
	gpu_set_blendenable(true);
	shader_reset();
}
catch(_err){
    fn_crash_handle(_err);
}












