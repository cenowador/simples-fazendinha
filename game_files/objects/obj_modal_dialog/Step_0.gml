/// @description get inputs

try{
	//if hovering buttons
	if(button_cancel){
		button_cancel_hover = point_in_rectangle(
			HOVER_X_GUI, HOVER_Y_GUI,
			button_cancel_x-button_cancel_w/2,
			button_cancel_y-button_cancel_h/2,
			button_cancel_x+button_cancel_w/2,
			button_cancel_y+button_cancel_h/2
		)
	}
	button_cancel_s_draw = lerp(button_cancel_s_draw, button_cancel_s+1*button_cancel_hover, 0.1);
	
	if(button_confirm){
		button_confirm_hover = point_in_rectangle(
			HOVER_X_GUI, HOVER_Y_GUI,
			button_confirm_x-button_confirm_w/2,
			button_confirm_y-button_confirm_h/2,
			button_confirm_x+button_confirm_w/2,
			button_confirm_y+button_confirm_h/2
		)
	}
	button_confirm_s_draw = lerp(button_confirm_s_draw, button_confirm_s+1*button_confirm_hover, 0.1);
	
	if(input_check_pressed(INPUTS.CANCEL)){
		CloseOverlay(false);
		exit;	
	}
	else if(input_check_pressed(INPUTS.ACCEPT)){
		if(button_cancel_hover){
			fn_play_sound(snd_button);
			CloseOverlay(false);
		}
		else if(button_confirm_hover){
			fn_play_sound(snd_button);
			CloseOverlay(true);
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












