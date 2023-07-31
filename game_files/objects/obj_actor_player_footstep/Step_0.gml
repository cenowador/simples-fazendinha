/// @description Insert description here

try{
	var _scale = 0.02;
	image_alpha -= 0.2;
	image_xscale += _scale;
	image_yscale += _scale;
	with(obj_actor_player){
		other.depth = depth+1;	
	}
	if(image_alpha <= 0){
		instance_destroy();
		with(obj_actor_player){
			particle_footstep_count -= 1;	
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












