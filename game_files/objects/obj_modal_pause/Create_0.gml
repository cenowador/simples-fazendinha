/// @description config

try{
	event_inherited();
	
	width = 500;
	height = 500;
	x = GUI_W/2-width/2;
	y = GUI_H/2-height/2-50;
	
	button_return_x = x+width/2;
	//button_return_y = y+height/2+165;
	button_return_y = y+height/2+145;
	button_return_s_x = 6;
	button_return_s_y = 3;
	button_return_w = sprite_get_width(spr_ui_button_1)*button_return_s_x;
	button_return_h = sprite_get_height(spr_ui_button_1)*button_return_s_y;
	button_return_hover = false;
	button_return_s_x_draw = button_return_s_x;
	button_return_s_y_draw = button_return_s_y;
	
	button_exit_x = x+width/2;
	//button_exit_y = y+height/2+75;
	button_exit_y = y+height/2+55;
	button_exit_s_x = 6;
	button_exit_s_y = 3;
	button_exit_w = sprite_get_width(spr_ui_button_1)*button_exit_s_x;
	button_exit_h = sprite_get_height(spr_ui_button_1)*button_exit_s_y;
	button_exit_hover = false;
	button_exit_s_x_draw = button_exit_s_x;
	button_exit_s_y_draw = button_exit_s_y;
	
	button_menu_x = x+width/2;
	button_menu_y = y+height/2-15;
	button_menu_s_x = 6;
	button_menu_s_y = 3;
	button_menu_w = sprite_get_width(spr_ui_button_1)*button_exit_s_x;
	button_menu_h = sprite_get_height(spr_ui_button_1)*button_exit_s_y;
	button_menu_hover = false;
	button_menu_s_x_draw = button_menu_s_x;
	button_menu_s_y_draw = button_menu_s_y;
	
	button_fullscreen_x = x+width/2-100;
	//button_fullscreen_y = y+height/2-160;
	button_fullscreen_y = y+height/2-120;
	button_fullscreen_s = 1.25;
	button_fullscreen_pad = -35;
	button_fullscreen_text = "fullscreen";
	draw_set_font(fnt_ui_silver_32);
	button_fullscreen_w = (sprite_get_width(spr_ui_button_1)+string_width(button_fullscreen_text)+button_fullscreen_pad)*button_fullscreen_s;
	button_fullscreen_h = sprite_get_height(spr_ui_button_1)*button_fullscreen_s;
	button_fullscreen_hover = false;
	button_sound_x = x+width/2-100;
	//button_sound_y = y+height/2-110;
	button_sound_y = y+height/2-70;
	button_sound_s = 1.25;
	button_sound_pad = -55;
	button_sound_text = "sons e música";
	draw_set_font(fnt_ui_silver_32);
	button_sound_w = (sprite_get_width(spr_ui_button_1)+string_width(button_sound_text)+button_sound_pad)*button_sound_s;
	button_sound_h = sprite_get_height(spr_ui_button_1)*button_sound_s;
	button_sound_hover = false;

	GoToMenu = function(){
		fn_room_goto(rm_menu);
	}
	ExitGameConfirm = function(){
		var _w = 500;
		var _h = 300;
		fn_instance_create_depth(GUI_W/2-_w/2, GUI_H/2-_h/2, 0, obj_modal_dialog, {
			text: "Tem certeza de que\nquer sair?",
			parent: id,
			width: _w,
			height: _h,
			confirm_handler: ExitGame,
			surf_buff: surf_buff
		});
	}
	ExitGame = function(){
		game_end();	
	}
	CancelPause = function(){
		CloseOverlay(noone);	
	}
	ToggleFullscreen = function(){
		window_set_fullscreen(!window_get_fullscreen());	
	}
	ToggleSound = function(){
		if(global.sound_enabled){
			global.sound_enabled = false;
			audio_stop_all();
		}
		else{
			global.sound_enabled = true;
			fn_play_music(snd_bgm);
		}
	}
	
	OpenOverlay();
}
catch(_err){
    fn_crash_handle(_err);
}












