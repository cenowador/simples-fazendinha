/// @description get inputs

try{
	if(input_check_pressed(INPUTS.CANCEL)){
		CloseOverlay(false);
		exit;
	}
	
	var _accept = input_check_pressed(INPUTS.ACCEPT);
	
	button_close_x = 1150;
	button_close_y = 665;
	button_close_s = 3;
	button_close_w = sprite_get_width(spr_ui_button_1)*button_close_s;
	button_close_h = sprite_get_height(spr_ui_button_1)*button_close_s;
	button_close_hover = false;
	button_close_s_draw = button_close_s;
	
	button_close_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_close_x-button_close_w/2,
		button_close_y-button_close_h/2,
		button_close_x+button_close_w/2,
		button_close_y+button_close_h/2
	);
	button_close_s_draw = lerp(button_close_s_draw, button_close_s+1*button_close_hover, 0.1);
	
	if(button_close_hover){
		fn_ui_set_cursor_state(CURSOR.HOVER);
		if(_accept){
			fn_play_sound(snd_button);
			CloseOverlay(false);
			exit;
		}
	}
	
	//get hover on items
	//var _bs = 3;
	//var _bw = sprite_get_width(spr_ui_item_bg)*_bs;
	//var _bh = sprite_get_height(spr_ui_item_bg)*_bs;
	//var _padding_x = 50;
	//var _inv_leng = array_length(store_inventory);
	//for(var _i = 0; _i < _inv_leng; ++_i){
	//	var _bx = GUI_W/2+(_bw+_padding_x)*_i-((_bw/2+_padding_x)*_inv_leng)/2-25;
	//	var _by = GUI_H/2-100;
	//	var _current = store_inventory[_i];
	//	var _item = _current.item;
	//	var _iw = sprite_get_width(_item.spr);
	//	var _ih = sprite_get_height(_item.spr);
	//	var _scale = (16/_iw)*_bs;
	//	var _x1 = _bx-(_iw*_scale)/2;
	//	var _y1 = _by-(_ih*_scale)/2;
	//	var _x2 = _bx+(_iw*_scale)/2;
	//	var _y2 = _by+(_ih*_scale)/2;
	//	if(point_in_rectangle(
	//		HOVER_X_GUI, HOVER_Y_GUI,
	//		_x1, _y1, _x2, _y2
	//	)){
	//		if(fn_toolbox_get_money() >= _item.price){
	//			fn_ui_set_cursor_state(CURSOR.HOVER);
	//			if(_accept){
	//				BuyItem(_item.name);
	//			}
	//		}
	//		else{
	//			fn_ui_set_cursor_state(CURSOR.FORBIDDEN);
	//		}
	//	}
	//}
}
catch(_err){
    fn_crash_handle(_err);
}
