/// @description draw ui

try{
	CreateUiSurface();
	
	surface_set_target(global.ui_surface);
	draw_clear_alpha(c_white, 0);
	
	if(room == rm_world){
		//draws current time
		var _time = {day: "", hour: "00", minute: "00"};
		with(_obj_time){
			_time = GetTime(true);	
		}
		var _time_text = string_concat("Dia ", _time.day, "\n", _time.hour, ":", _time.minute);
		draw_sprite_stretched(spr_ui_base_1, 0, 10, 10, 150, 100);
		scribble(_time_text)
		.starting_format(FONT.CLOCK)
		.align(fa_center)
		.draw(85, 15)
		
		//draws toolbox
		with(obj_toolbox){
			var _inv_leng = array_length(inventory);
			//var _box_limit = 10;
			//var _inv_amt = _inv_leng>_box_limit?2:1;
			//var _box_spr = spr_toolbox;
			//var _box_w = sprite_get_width(_box_spr);
			//var _box_h = sprite_get_height(_box_spr);
			//for(var _i = 0; _i < _inv_amt; ++_i){
			//	var _ix = VIEW_W/2;
			//	var _pad_y = 18;
			//	var _iy = VIEW_H-_pad_y-(_pad_y+_box_h/2)*_i;
			//	draw_sprite(spr_toolbox, 0, _ix, _iy);
			//	//draw items
			//	for(var _j = _box_limit*_i; _j < _inv_leng; ++_j){
			//		if(_i == 0 && _j >= _box_limit){
			//			break;	
			//		}
			//		var _adjJ = _j-_box_limit*_i;
			//		var _current = inventory[_j];
			//		var _item = GetItem(_current.name);
			//		var _pad_x = 3;
			//		var _iw = sprite_get_width(_item.spr);
			//		var _scale = 16/_iw;
			//		_iw *= _scale;
			//		var _px = 4+_ix-_box_w/2+(_pad_x+_iw/2)+(_pad_x+_iw)*_adjJ;
			//		var _py = _iy;
			//		draw_sprite_ext(_item.spr, 0, _px, _py, _scale, _scale, 0, c_white, 1);
			//	}
			//}
			var _scale_box = 3;
			var _ix = GUI_W/2;
			var _pad_y = 18*_scale_box;
			var _iy = GUI_H-_pad_y;
			var _box_w = sprite_get_width(spr_toolbox)*_scale_box;
			draw_sprite_ext(spr_toolbox, 0, _ix, _iy, _scale_box, _scale_box, 0, c_white, 1);
			for(var _j = 0; _j < _inv_leng; ++_j){
				var _current = inventory[_j];
				var _item = GetItem(_current.name);
				var _iw = sprite_get_width(_item.spr);
				var _ih = sprite_get_height(_item.spr);
				var _scale = (16/_iw)*_scale_box;
				_iw *= _scale;
				_ih *= _scale;
				var _pad_x = 3*_scale_box;
				var _px = 4*_scale_box+_ix-_box_w/2+(_pad_x+_iw/2)+(_pad_x+_iw)*_j;
				var _py = _iy;
				draw_sprite_ext(_item.thumbnail, 0, _px, _py, _scale, _scale, 0, c_white, 1);
				if(_current.equiped){
					var _equip_w = sprite_get_width(spr_world_grid_hover)*_scale_box;
					var _equip_h = sprite_get_height(spr_world_grid_hover)*_scale_box;
					draw_sprite_ext(spr_world_grid_hover, 0, _px-_equip_h/2, _py-_equip_h/2, _scale_box, _scale_box, 0, c_white, 1);
				}
				if(_current.amt > 1){
					var _num = string(_current.amt);
					if(_current.amt >= 1000){
						_num = fn_string_shorten_value(_current.amt);	
					}
					else if(_current.amt < 10){
						_num = fn_string_pad_start(_current.amt, "2", "0");
					}
					scribble(_num)
					.starting_format(FONT.TOOLBOX_AMT)
					.align(fa_left, fa_top)
					.draw(_px+1, _py+3);
				}
			}
		
			//draw money
			var _money_base_x = 20;
			var _money_base_y = 115;
			var _money_base_w = 120;
			var _money_base_h = 60;
			var _money_text = string(money);
			if(money > 99999){
				_money_text = fn_string_shorten_value(money);
			}
			draw_sprite_stretched(spr_ui_base_1, 0, _money_base_x, _money_base_y, _money_base_w, _money_base_h);
			draw_sprite_ext(spr_toolbox_money, 0, _money_base_x+25, _money_base_y+28, 1, 1, 0, c_white, 1);
			scribble(_money_text)
			.starting_format(FONT.MONEY)
			.align(fa_center, fa_middle)
			.draw(_money_base_x+_money_base_w/2+10,
			_money_base_y+_money_base_h/2+8)
		}
	}
	
	surface_reset_target();
	
	draw_surface(global.ui_surface, 0, 0);
}
catch(_err){
    fn_crash_handle(_err);
}












