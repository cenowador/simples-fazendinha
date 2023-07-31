/// @description item selection

try{
	var _scale_box = 3;
	var _ix = GUI_W/2;
	var _pad_y = 18*_scale_box;
	var _iy = GUI_H-_pad_y;
	var _box_w = sprite_get_width(spr_toolbox)*_scale_box;
	var _box_h = sprite_get_height(spr_toolbox)*_scale_box;
	var _grid_w = 16*_scale_box;
	var _grid_h = 16*_scale_box;
	
	global.hovering_toolbox = (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		_ix-_box_w/2, _iy-_box_h/2, _ix+_box_w/2, _iy+_box_h/2));
	
	hovering_item = noone;
	if(room == rm_world){
		var _leng = min(inventory_limit, array_length(inventory));
		for(var _i = 0; _i < _leng; ++_i){
			var _pad_x = 3*_scale_box;
			var _x1 = 4*_scale_box+_ix-_box_w/2+(_pad_x+_grid_w/2)+(_pad_x+_grid_w)*_i-_grid_w/2;
			var _x2 = 4*_scale_box+_ix-_box_w/2+(_pad_x+_grid_w/2)+(_pad_x+_grid_w)*_i+_grid_w/2;
			var _y1 = _iy-_grid_h/2;
			var _y2 = _iy+_grid_h/2;
			if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
			_x1, _y1, _x2, _y2)){
				hovering_item = _i;
				var _item = GetItem(inventory[_i].name);
				if(instance_exists(obj_world_shop_inside)){
					if(_item.sellable){
						fn_ui_set_cursor_state(CURSOR.HOVER);
					}
					else{
						fn_ui_set_cursor_state(CURSOR.FORBIDDEN);	
					}
					if(input_check_pressed(INPUTS.ACCEPT)){
						SellCurrentItem();
						break;
					}
				}
				else{
					if(_item.equipable){
						fn_ui_set_cursor_state(CURSOR.HOVER);
					}
					else{
						fn_ui_set_cursor_state(CURSOR.FORBIDDEN);	
					}
					if(input_check_pressed(INPUTS.ACCEPT)){
						EquipItem(inventory[_i].name);
						break;
					}
					
				}
			}
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












