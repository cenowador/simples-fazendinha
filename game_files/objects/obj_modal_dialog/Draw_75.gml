/// @description shows dialog

try{
	// Inherit the parent event
	event_inherited();

	draw_sprite_stretched(spr_ui_base_1, 2, x, y, width, height);
	scribble(text)
	.starting_format(FONT.DIALOG)
	.align(fa_center)
	.wrap(width)
	.draw(x+width/2, y+30, typist);
	if(button_cancel){
		draw_sprite_ext(spr_ui_cancel, 0, button_cancel_x, button_cancel_y,
		button_cancel_s_draw, button_cancel_s_draw, 0, c_white, 1);
	}
	if(button_confirm){
		draw_sprite_ext(spr_ui_confirm, 0, button_confirm_x, button_confirm_y,
		button_confirm_s_draw, button_confirm_s_draw, 0, c_white, 1);
	}
	
	fn_ui_draw_cursor();
}
catch(_err){
    fn_crash_handle(_err);
}
