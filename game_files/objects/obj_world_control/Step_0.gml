/// @description pause game

try{
	if(global.loading_game){
		exit;	
	}
	if(input_check_pressed(INPUTS.PAUSE)){
		if(!instance_exists(obj_modal_pause) &&
		!instance_exists(obj_world_shop_inside)){
			instance_create_depth(0, 0, 0, obj_modal_pause);	
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












