/// @description state machine

try{
	if(global.loading_game){
		exit;	
	}
	// Inherit the parent event
	event_inherited();

    //movement after all state calculations
	fn_physics_round_velocity();

	if(!fn_physics_move_x(physics_speed_x, self)){
		//could not move
		physics_speed_x = 0;
		physics_speed_x_fraction = 0;
	}

	if(!fn_physics_move_y(physics_speed_y, self)){
		//could not move
		physics_speed_y = 0;
		physics_speed_y_fraction = 0;
	}
	
	if(physics_speed_x != 0 || physics_speed_y != 0){
		repeat(1){
			if(particle_footstep_count >= particle_footstep_max){
				break;	
			}
			var _dir = -sign(image_xscale);
			instance_create_depth(x+xirandom(2)*_dir, y-2-xirandom(2), depth+1, obj_actor_player_footstep);
			particle_footstep_count += 1;
		}
	}
	//if not moving, xscale follows mouse
	else{
		image_xscale = mouse_x>x?1:-1;
	}
}
catch(_err){
    fn_crash_handle(_err);
}
