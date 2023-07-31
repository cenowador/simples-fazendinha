/// @description Insert description here

try{
	visible = debug_mode;
	image_xscale = fn_init_instance_variable("xscale")??image_xscale;
	image_yscale = fn_init_instance_variable("yscale")??image_yscale;
	
	fn_world_use_cell();
}
catch(_err){
    fn_crash_handle(_err);
}












