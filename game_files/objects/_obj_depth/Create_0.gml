/// @description Insert description here


#macro TAG_DEPTH "depth"

try{
	asset_add_tags(obj_abs_actor, TAG_DEPTH, asset_object);
	asset_add_tags(obj_abs_scenery, TAG_DEPTH, asset_object);
	
	Init = function(){
		depth_grid = ds_grid_create(2, 0);
		depth_array = tag_get_asset_ids(TAG_DEPTH, asset_object);
	
		var _len = array_length(depth_array);
		for(var _i = 0; _i < _len; ++_i){
			var _obj = depth_array[_i];
			with(_obj){
				visible = false;	
			}
			object_set_visible(_obj, false);
		}
	}
	Init();
	
	Flush = function(){
		ds_grid_destroy(depth_grid);
		array_delete(depth_array, 0, array_length(depth_array));
	}

	Sort = function() {
		//resizes grid
		var _len = array_length(depth_array);
		var _inst_count = 0;
		for(var _i = 0; _i < _len; ++_i){
			_inst_count += instance_number(depth_array[_i]);
		}
		ds_grid_resize(depth_grid, 2, _inst_count);

		//sort grid
		var _grid_pos = 0;
		for(var _i = 0; _i < _len; ++_i){
			for(var _j = 0; _j < instance_number(depth_array[_i]); ++_j){
				var _inst = instance_find(depth_array[_i], _j);
				if(variable_instance_exists(_inst, "ignore_depth")){
					if(_inst.ignore_depth){
						continue;
					}
				}
				depth_grid[# 0, _grid_pos] = _inst.id;
				depth_grid[# 1, _grid_pos] = _inst.y;
				if(_inst.object_index == obj_world_hover){
					depth_grid[# 1, _grid_pos] -= 1;	
				}
				_grid_pos++;
			}
		}
		ds_grid_sort(depth_grid, 1, true);
		
		//draw sprites
		for(var _i = 0; _i < ds_grid_height(depth_grid); ++_i){
			var _inst = depth_grid[# 0, _i]
			with(_inst){
				called_draw = false;
				event_perform(ev_draw, 0);
			}
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












