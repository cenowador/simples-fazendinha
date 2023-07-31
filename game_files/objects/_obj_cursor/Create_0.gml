/// @description cursor


#macro CURSOR global.CURSOR_STATES

try{
	window_set_cursor(cr_none);
	sprite = 0;
	rotation = 0;
	cursor_set = false;
	
	global.CURSOR_STATES = {
		NORMAL: "NORMAL",
		HOVER: "HOVER",
		FORBIDDEN: "FORBIDDEN"
	}
	SetCursor = function(_state){
		if(cursor_set){
			return;	
		}
		if(_state == CURSOR.HOVER){
			sprite = 0;
			rotation = 30;
			cursor_set = true;
		}
		else if(_state == CURSOR.FORBIDDEN){
			sprite = 1;
			rotation = 0;
			cursor_set = true;
		}
		else{
			sprite = 0;
			rotation = 0;	
		}
	}
	DrawCursor = function(){
		draw_sprite_ext(spr_ui_cursor, sprite, HOVER_X_GUI, HOVER_Y_GUI, 2, 2, rotation, c_white, 1);
		cursor_set = false;
	}
}
catch(_err){
    fn_crash_handle(_err);
}












