/// @description config

try{
	event_inherited();
	
	fn_play_sound(snd_shop);
	
	white_overlay = true;
	AddDeactivationException(obj_toolbox);
	AddDeactivationException(obj_world_control);
	AddDeactivationException(_obj_time);
	AddDeactivationException(obj_world_crop);
	AddDeactivationException(obj_world_day);
	AddDeactivationException(obj_world_plot);
	AddDeactivationException(_obj_ui);
	AddDeactivationException(obj_world_shop_item);
	
	button_close_x = x;
	button_close_y = y;
	button_close_s = 3;
	button_close_w = sprite_get_width(spr_ui_cancel)*button_close_s;
	button_close_h = sprite_get_height(spr_ui_cancel)*button_close_s;
	button_close_hover = false;
	button_close_s_draw = button_close_s;
	
	__AfterClosing = function(_args){
		with(obj_world_shop_item){
			instance_destroy();	
		}
	}
	
	#region items on sale
	var _bs = 3;
	var _bw = sprite_get_width(spr_ui_item_bg)*_bs;
	var _bh = sprite_get_height(spr_ui_item_bg)*_bs;
	var _bx = GUI_W/2;
	var _by = GUI_H/2-140;
	var _padding_x = 40;
	var _padding_y = 50;
	store_inventory = [
		{item: fn_toolbox_get_item("pumpkin_seed"), px: _bx-2*(_bw+_padding_x), py:_by},
		{item: fn_toolbox_get_item("potato_seed"), px: _bx-1*(_bw+_padding_x), py: _by},
		{item: fn_toolbox_get_item("tomato_seed"), px: _bx, py: _by},
		{item: fn_toolbox_get_item("carrot_seed"), px: _bx+1*(_bw+_padding_x), py: _by},
		{item: fn_toolbox_get_item("pod_seed"), px: _bx+2*(_bw+_padding_x), py: _by},
		
		{item: fn_toolbox_get_item("flower_1"), px: _bx-2*(_bw+_padding_x), py: _by+_bh+_padding_y},
		{item: fn_toolbox_get_item("flower_2"), px: _bx-1*(_bw+_padding_x), py: _by+_bh+_padding_y},
		{item: fn_toolbox_get_item("flower_3"), px: _bx, py: _by+_bh+_padding_y},
		{item: fn_toolbox_get_item("fence_corner_left"), px: _bx+1*(_bw+_padding_x), py: _by+_bh+_padding_y},
		{item: fn_toolbox_get_item("fence_corner_right"), px: _bx+2*(_bw+_padding_x), py: _by+_bh+_padding_y},
		
		{item: fn_toolbox_get_item("fence_left"), px: _bx-2*(_bw+_padding_x)-35, py: _by+2*(_bh+_padding_y)},
		{item: fn_toolbox_get_item("fence_right"), px: _bx-1*(_bw+_padding_x)-35, py: _by+2*(_bh+_padding_y)},
		{item: fn_toolbox_get_item("fence_middle_left"), px: _bx-35, py: _by+2*(_bh+_padding_y)},
		{item: fn_toolbox_get_item("fence_middle_right"), px: _bx+1*(_bw+_padding_x)-35, py: _by+2*(_bh+_padding_y)},
		{item: fn_toolbox_get_item("fence_up_left"), px: _bx+2*(_bw+_padding_x)-35, py: _by+2*(_bh+_padding_y)},
		{item: fn_toolbox_get_item("fence_up_right"), px: _bx+2*(_bw+_padding_x)+50, py: _by+2*(_bh+_padding_y)},
	];
	BuyItem = function(_item){
		with(obj_toolbox){
			BuyItem(_item);
		}
	}
	var _leng = array_length(store_inventory);
	for(var _i = 0; _i < _leng; ++_i){
		var _current = store_inventory[_i];
		fn_instance_create_depth(_current.px, _current.py, depth, obj_world_shop_item, {
			item_name: _current.item.name
		});
	}
	#endregion
	
	OpenOverlay();
}
catch(_err){
    fn_crash_handle(_err);
}












