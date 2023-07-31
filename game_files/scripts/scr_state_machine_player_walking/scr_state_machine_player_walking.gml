function fn_state_machine_player_walking_step(){
	//inputs
	var _right = input_check(INPUTS.RIGHT);
	var _left = input_check(INPUTS.LEFT);
	var _down = input_check(INPUTS.DOWN);
	var _up = input_check(INPUTS.UP);
	var _accept = input_check_pressed(INPUTS.ACCEPT);
	
	if(_right || _left || _down || _up){
		var _dir = point_direction(0, 0, (_right - _left), (_down - _up));
		physics_speed_x = lerp(physics_speed_x, lengthdir_x(physics_speed_max, _dir), physics_accel);
		physics_speed_y = lerp(physics_speed_y, lengthdir_y(physics_speed_max, _dir), physics_accel);
	}
	else{
		physics_speed_x = 0;
		physics_speed_y = 0;
	}
	
	if(_accept){
		UseTool();	
	}
	
	//handles animation
	if(physics_speed_x != 0 || physics_speed_y != 0){
		sprite_index = spr_actor_player_walking;
	}
	else{
		sprite_index = spr_actor_player_idle;
	}
}
