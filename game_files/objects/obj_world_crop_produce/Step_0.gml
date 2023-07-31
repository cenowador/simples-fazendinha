/// @description time

try{
	spawn_time += 0.5/GAME_SPEED;
	if(spawn_time < 1){
		x += animcurve_channel_evaluate(curve_spawn, spawn_time)*(target_x-x);
		y += animcurve_channel_evaluate(curve_spawn, spawn_time)*(target_y-y);
	}
	else{
		float_time += 0.5/GAME_SPEED;
		if(float_time > 1){
			float_time = 0;	
		}
		
		//moves towards player
		var _sight = GRID_W*3;
		if(instance_exists(obj_actor_player)){
			var _px, _py;
			var _accel = 0.1;
			with(obj_actor_player){
				_px = x;
				_py = y;
			}
			var _dist = point_distance(x, y, _px, _py);
			if(_dist <= _sight){
				x = lerp(x, _px, _accel);
				y = lerp(y, _py, _accel);
			}
		}
		
		//being collected
		if(place_meeting(x, y, obj_actor_player)){
			if(fn_toolbox_add_item(produce, 1)){
				fn_play_sound(snd_pop);
				audio_sound_pitch(snd_pop, xrandom_range(-0.8, 1.2))
				instance_destroy();
			}
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












