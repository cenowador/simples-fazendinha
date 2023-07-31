/// @description Insert description here


#macro GRID_W 16
#macro GRID_H 16
#macro HOVER_X global.grid_hovering_x
#macro HOVER_Y global.grid_hovering_y
#macro HOVER_X_REAL global.grid_hovering_x_real
#macro HOVER_Y_REAL global.grid_hovering_y_real
#macro HOVER_X_GUI device_mouse_x_to_gui(0)
#macro HOVER_Y_GUI device_mouse_y_to_gui(0)

try{
	//must have only one of this object
	if(instance_number(object_index) > 1){
		instance_destroy();
		exit;
	}
	
	if(global.loading_game){
		call_later(2, time_source_units_frames, fn_world_load);
	}
	
	autosave_time = 5*GAME_SPEED;
	alarm[0] = autosave_time;
	
	world_grid = ds_grid_create(room_width/GRID_W, room_height/GRID_H);
	ds_grid_clear(world_grid, noone);
	
	global.grid_hovering_x = 0;
	global.grid_hovering_y = 0;
	global.grid_hovering_x_real = 0;
	global.grid_hovering_y_real = 0;
	
	PosToCoord = function(_x, _y){
		return {px: floor(_x/GRID_W), py: floor(_y/GRID_H)}
	}
	UseCell = function(_x, _y, _obj){
		world_grid[# _x, _y] = _obj;
	}
	GetCell = function(_x, _y){
		return world_grid[# _x, _y];
	}
	FreeCell = function(_x, _y){
		world_grid[# _x, _y] = noone;
	}
	CellIsFree = function(_x, _y){
		if(world_grid[# _x, _y] == noone){
			return true;
		}
		return false;
	}
	
	#region tools
	__UseHoe = function(){
		var _decor = collision_point(HOVER_X*GRID_W, HOVER_Y*GRID_H, obj_world_decor, false, true); 
		if(_decor != noone){
			with(_decor){
				RemoveDecor();
			}
		}
		else{
			if(!CellIsFree(HOVER_X, HOVER_Y)){
				return;
			}
			if(collision_point(HOVER_X_REAL, HOVER_Y_REAL, obj_world_unplottable, false, true) ||
			collision_point(HOVER_X_REAL, HOVER_Y_REAL, obj_abs_solid, false, true)){
				return;	
			}
			with(instance_create_depth(HOVER_X_REAL, HOVER_Y_REAL, depth, obj_world_plot)){
				ShowHoeAnimation();	
			}
			fn_play_sound(snd_hoe);
		}
	}
	__UseCan = function(){
		var _plot = GetCell(HOVER_X, HOVER_Y);
		if(_plot == noone){
			return;
		}
		with(_plot){
			if(object_index != obj_world_plot){
				return;	
			}
			WaterPlot();
		}
	}
	__UseScythe = function(){
		var _plot = GetCell(HOVER_X, HOVER_Y);
		if(_plot == noone){
			return;
		}
		with(_plot){
			if(object_index != obj_world_plot){
				return;	
			}
			ReapPlot();
		}
	}
	__UseSeed = function(_seed){
		var _plot = GetCell(HOVER_X, HOVER_Y);
		if(_plot == noone){
			return false;
		}
		with(_plot){
			if(object_index != obj_world_plot){
				return false;	
			}
			return SowPlot(_seed);
		}
	}
	__UseDecor = function(_item){
		if(!CellIsFree(HOVER_X, HOVER_Y)){
			return false;
		}
		if(collision_point(HOVER_X_REAL, HOVER_Y_REAL, obj_world_decor, false, true) ||
		collision_point(HOVER_X_REAL, HOVER_Y_REAL, obj_abs_solid, false, true)){
			return false;	
		}
		fn_instance_create_depth(HOVER_X_REAL, HOVER_Y_REAL, depth, obj_world_decor, {
			item: _item
		})
		fn_play_sound(snd_pop);
		return true;
	}
	#endregion
}
catch(_err){
    fn_crash_handle(_err);
}
