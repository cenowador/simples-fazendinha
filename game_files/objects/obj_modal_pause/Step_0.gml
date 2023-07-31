/// @description get inputs

try{
	if(input_check_pressed(INPUTS.PAUSE) || input_check_pressed(INPUTS.CANCEL)){
		CancelPause();
		exit;
	}

	//if hovering buttons
	button_return_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_return_x-button_return_w/2,
		button_return_y-button_return_h/2,
		button_return_x+button_return_w/2,
		button_return_y+button_return_h/2
	)
	button_return_s_x_draw = lerp(button_return_s_x_draw, button_return_s_x+0.5*button_return_hover, 0.1);
	
	button_exit_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_exit_x-button_exit_w/2,
		button_exit_y-button_exit_h/2,
		button_exit_x+button_exit_w/2,
		button_exit_y+button_exit_h/2
	)
	button_exit_s_x_draw = lerp(button_exit_s_x_draw, button_exit_s_x+0.5*button_exit_hover, 0.1);
	
	button_menu_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_menu_x-button_menu_w/2,
		button_menu_y-button_menu_h/2,
		button_menu_x+button_menu_w/2,
		button_menu_y+button_menu_h/2
	)
	button_menu_s_x_draw = lerp(button_menu_s_x_draw, button_menu_s_x+0.5*button_menu_hover, 0.1);
	
	button_fullscreen_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_fullscreen_x,
		button_fullscreen_y,
		button_fullscreen_x+button_fullscreen_w,
		button_fullscreen_y+button_fullscreen_h
	)
	
	button_sound_hover = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		button_sound_x,
		button_sound_y,
		button_sound_x+button_sound_w,
		button_sound_y+button_sound_h
	)
	
	if(input_check_pressed(INPUTS.ACCEPT)){
		if(button_return_hover){
			fn_play_sound(snd_button);
			CancelPause();
		}
		else if(button_exit_hover){
			ExitGameConfirm();
		}
		else if(button_menu_hover){
			fn_play_sound(snd_button);
			GoToMenu();
		}
		else if(button_fullscreen_hover){
			fn_play_sound(snd_button);
			ToggleFullscreen();
		}
		else if(button_sound_hover){
			fn_play_sound(snd_button);
			ToggleSound();
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












