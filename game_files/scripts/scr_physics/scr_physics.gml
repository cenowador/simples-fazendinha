///@desc moves _inst on X axis with _vel
function fn_physics_move_x(_vel, _inst){
	var _dir = sign(_vel);
	if(_dir != 0){
		if(!global.animating){
			image_xscale = _dir;
		}
	}
	with(_inst){
		repeat(abs(_vel)){
			if(!global.animating){
				if(place_meeting(x+_dir, y, obj_abs_solid)){
					return false;
				}
			}
			x += _dir;
		}
	}
	return true;
}

///@desc moves _inst on Y axis with _vel
function fn_physics_move_y(_vel, _inst){
	var _dir = sign(_vel);
	with(_inst){
		repeat(abs(_vel)){
			if(!global.animating){
			    if(place_meeting(x, y+_dir, obj_abs_solid)){
					return false;
				}
			}
			y += _dir;
		}
	}
	return true;
}


///@desc Round the physics_speed_x/physics_speed_y while keeping track of fractions
function fn_physics_round_velocity(){
	
	physics_speed_x_fraction += physics_speed_x;
	physics_speed_x = round(physics_speed_x_fraction);
	physics_speed_x_fraction -= physics_speed_x;
	
	physics_speed_y_fraction += physics_speed_y;
	physics_speed_y = round(physics_speed_y_fraction);
	physics_speed_y_fraction -= physics_speed_y;
}
