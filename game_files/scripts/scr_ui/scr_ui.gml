function fn_ui_set_cursor_state(_state){
	with(_obj_cursor){
		SetCursor(_state);
	}
}

function fn_ui_draw_cursor(){
	with(_obj_cursor){
		DrawCursor();
	}
}
