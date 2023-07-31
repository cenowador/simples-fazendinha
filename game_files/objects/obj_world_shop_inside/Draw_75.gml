/// @description shows store

try{
	// Inherit the parent event
	event_inherited();
	
	//sell button
	with(obj_toolbox){
		if(hovering_item != noone){
			var _current = inventory[hovering_item];
			var _item = fn_toolbox_get_item(_current.name);
			if(!_item.sellable){
				continue;
			}
			var _scale_box = 3;
			var _ix = GUI_W/2;
			var _pad_y = 18*_scale_box;
			var _iy = GUI_H-_pad_y;
			var _box_w = sprite_get_width(spr_toolbox)*_scale_box;
			var _iw = sprite_get_width(_item.spr);
			var _ih = sprite_get_height(_item.spr);
			var _scale = (16/_iw)*_scale_box;
			_iw *= _scale;
			_ih *= _scale;
			var _pad_x = 3*_scale_box;
			var _px = 4*_scale_box+_ix-_box_w/2+(_pad_x+_iw/2)+(_pad_x+_iw)*hovering_item;
			var _py = _iy-30;
			draw_sprite_ext(spr_ui_button_sell, 0, _px, _py, 1, 1, 0, c_white, 1);
			//scribble("VENDER")
			//.starting_format(FONT.SHOP_SELL)
			//.align(fa_center, fa_middle)
			//.draw(_px, _py)
		}
	}
	
	//draw sign
	var _sign_w = 150;
	var _sign_h = 60;
	var _sign_x = GUI_W/2-_sign_w/2;
	var _sign_y = GUI_H/2-280;
	draw_sprite_stretched(spr_ui_base_2, 0, _sign_x, _sign_y, _sign_w, _sign_h);
	scribble("[wave]LOJA")
	.starting_format(FONT.SHOP)
	.align(fa_center, fa_middle)
	.draw(_sign_x+_sign_w/2, _sign_y+_sign_h/2+10);
	
	//draw items
	var _bg_w = 600;
	var _bg_h = 360;
	draw_sprite_stretched(spr_ui_base_2, 0, GUI_W/2-_bg_w/2, GUI_H/2-200, _bg_w, _bg_h);
	with(obj_world_shop_item){
		DrawItself();	
	}
	
	//var _bs = 3;
	//var _bw = sprite_get_width(spr_ui_item_bg)*_bs;
	//var _bh = sprite_get_height(spr_ui_item_bg)*_bs;
	//var _padding_x = 50;
	//var _inv_leng = array_length(store_inventory);
	//for(var _i = 0; _i < _inv_leng; ++_i){
	//	var _bx = GUI_W/2+(_bw+_padding_x)*_i-((_bw/2+_padding_x)*_inv_leng)/2-25;
	//	var _by = GUI_H/2-100;
	//	draw_sprite_ext(spr_ui_item_bg, 0, _bx, _by, _bs, _bs, 0, c_white, 1);
		
	//	var _current = store_inventory[_i];
	//	var _item = _current.item;
	//	var _iw = sprite_get_width(_item.spr);
	//	var _ih = sprite_get_height(_item.spr);
	//	var _scale = (16/_iw)*_bs;
	//	draw_sprite_ext(_item.spr, 0, _bx, _by, _scale, _scale, 0, c_white, 1);
	//	if(fn_toolbox_get_money() < _item.price){
	//		draw_sprite_ext(spr_ui_black_overlay, 0, _bx, _by, _scale, _scale, 0, c_white, 1);
	//	}
		
	//	draw_sprite_ext(spr_toolbox_money, 0, _bx-25, _by+50, 1, 1, 0, c_white, 1);
	//	scribble(string(_item.price))
	//	.starting_format(FONT.SHOP_SELL)
	//	.align(fa_left, fa_middle)
	//	.draw(_bx, _by+60)
	//}
	
	//close button
	draw_sprite_ext(spr_ui_button_1, 0, button_close_x, button_close_y, button_close_s_draw, button_close_s_draw, 0, c_white, 1);
	scribble("VOLTAR")
	.starting_format(FONT.DIALOG)
	.align(fa_center, fa_middle)
	//.scale(1+(button_close_s_draw-button_close_s), 1+(button_close_s_draw-button_close_s))
	.draw(button_close_x, button_close_y);
	
	fn_ui_draw_cursor();
}
catch(_err){
    fn_crash_handle(_err);
}