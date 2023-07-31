/// @description get hover

try{
	hovering = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		x-width/2, y-height/2,
		x+width/2, y+height/2
	);
	if(!disabled)
		scale = lerp(scale, 1+0.075*hovering, 0.1);
	
	if(hovering){
		if(disabled){
			fn_ui_set_cursor_state(CURSOR.FORBIDDEN);
		}
		else{
			fn_ui_set_cursor_state(CURSOR.HOVER);
			if(input_check_pressed(INPUTS.ACCEPT)){
				Clicked();	
			}
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












