/// @description Insert description here

try{
	if(!global.sleeping){
		var _accept = input_check_pressed(INPUTS.ACCEPT);
		//if player is near and clicked me
		var _at_door = collision_rectangle(
			x-sprite_width/2, y-GRID_H, x+sprite_width/2, y+GRID_H, obj_actor_player, false, true
		);
		var _on_house = point_in_rectangle(
			HOVER_X_REAL, HOVER_Y_REAL,
			x-sprite_width/2-GRID_W, y-sprite_height-GRID_H,
			x+sprite_width/2+GRID_W, y
		)
		if(_at_door && _on_house){
			fn_ui_set_cursor_state(CURSOR.HOVER);
			if(_accept){
				SleepConfirm();
			}
		}
	}
	//animate player entering house, sleeping then coming out
	else{
		var _sleep_day = sleep_day;
		var _slept = slept;
		with(obj_actor_player){
			physics_speed_x = 0;
			physics_speed_x_fraction = 0;
			physics_speed_y = 0;
			physics_speed_y_fraction = 0;
			sprite_index = spr_actor_player_walking;
			//centers with door
			if(x != other.x){
				var _dir = sign(other.x-x);
				x += _dir;
				if(abs(other.x-x) < 1){
					x = other.x;
					other.image_index = 1;
					fn_play_sound(snd_door);
				}
			}
			else{
				//enters house and starts sleeping
				var _dest = other.y-GRID_H;
				if(y > _dest && !_slept){
					y -= 1;
					other.image_index = 1;
					if(abs(_dest-y) < 1){
						y = _dest;
						visible = false;
						other.image_index = 0;
						with(_obj_time){
							SetTimeFactor(100);
						}
					}
				}
				//end of sleep
				else{
					with(_obj_time){
						var _time = GetTime();
						if(_time.hour >= 7 && day_current != _sleep_day){
							SetTimeFactor(1);
							_slept = true;
						}
					}
					if(other.slept != _slept){
						other.slept = _slept;
					}
					_dest = other.y+GRID_H;
					if(y < _dest && _slept){
						y += 1;
						if(y > other.y){
							other.image_index = 0;	
						}
						else{
							other.image_index = 1;	
						}
						if(abs(_dest-y) < 1){
							y = _dest;
							visible = true;
							with(_obj_time){
								ResetTimeFactor();
							}
							other.WakeUp();
						}
					}
				}
			}
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












