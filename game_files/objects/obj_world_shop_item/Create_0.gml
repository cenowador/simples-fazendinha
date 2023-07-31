/// @description config

try{
	hovering = false;
	item_name = fn_init_instance_variable("item_name");
	item = fn_toolbox_get_item(item_name);
	
	box_scale = 3;
	width = sprite_get_width(spr_ui_item_bg)*box_scale;
	height = sprite_get_height(spr_ui_item_bg)*box_scale;
	
	DrawItself = function(){
		draw_sprite_ext(spr_ui_item_bg, 0, x, y, box_scale, box_scale, 0, c_white, 1);
		var _iw = sprite_get_width(item.spr);
		var _ih = sprite_get_height(item.spr);
		var _scale = (16/_iw)*box_scale;
		draw_sprite_ext(item.thumbnail, 0, x, y, _scale, _scale, 0, c_white, 1);
		if(fn_toolbox_get_money() < item.price){
			_scale = (16/sprite_get_width(spr_ui_black_overlay))*box_scale;
			draw_sprite_ext(spr_ui_black_overlay, 0, x, y, _scale, _scale, 0, c_white, 1);
		}
		
		draw_sprite_ext(spr_toolbox_money, 0, x-25, y+50, 1, 1, 0, c_white, 1);
		scribble(string(item.price))
		.starting_format(FONT.SHOP_SELL)
		.align(fa_left, fa_middle)
		.draw(x, y+60)
	}
}
catch(_err){
    fn_crash_handle(_err);
}












