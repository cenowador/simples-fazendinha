/// @description shows dialog

try{
	// Inherit the parent event
	event_inherited();

	draw_sprite_stretched(spr_ui_base_1, 2, x, y, width, height);
	scribble("[wave]JOGO PAUSADO")
	.starting_format(FONT.SHOP)
	.align(fa_center)
	.draw(x+width/2, y+30);
	
	draw_sprite_ext(spr_ui_checkbox, window_get_fullscreen(),
		button_fullscreen_x, button_fullscreen_y,
		button_fullscreen_s, button_fullscreen_s, 0, c_white, 1);
	scribble(button_fullscreen_text)
	.starting_format(FONT.PAUSE)
	.align(fa_left, fa_middle)
	.draw(button_fullscreen_x+button_fullscreen_w/2+button_fullscreen_pad,
		button_fullscreen_y+button_fullscreen_h/2+9);
		
	draw_sprite_ext(spr_ui_checkbox, global.sound_enabled,
		button_sound_x, button_sound_y,
		button_sound_s, button_sound_s, 0, c_white, 1);
	scribble(button_sound_text)
	.starting_format(FONT.PAUSE)
	.align(fa_left, fa_middle)
	.draw(button_sound_x+button_sound_w/2+button_sound_pad,
		button_sound_y+button_sound_h/2+7);
		
	//draw_sprite_ext(spr_ui_button_1, 0, button_menu_x, button_menu_y,
	//	button_menu_s_x_draw, button_menu_s_y_draw, 0, c_white, 1);
	//scribble("menu principal")
	//.starting_format(FONT.PAUSE)
	//.align(fa_center, fa_middle)
	//.draw(button_menu_x, button_menu_y+5);
	
	draw_sprite_ext(spr_ui_button_1, 0, button_exit_x, button_exit_y,
		button_exit_s_x_draw, button_exit_s_y_draw, 0, c_white, 1);
	scribble("sair do jogo")
	.starting_format(FONT.PAUSE)
	.align(fa_center, fa_middle)
	.draw(button_exit_x, button_exit_y+5);
		
	draw_sprite_ext(spr_ui_button_1, 0, button_return_x, button_return_y,
		button_return_s_x_draw, button_return_s_y_draw, 0, c_white, 1);
	scribble("voltar")
	.starting_format(FONT.PAUSE)
	.align(fa_center, fa_middle)
	.draw(button_return_x, button_return_y+5);
	
	fn_ui_draw_cursor();
}
catch(_err){
    fn_crash_handle(_err);
}
