/// @description hover and click

try{
	hovering = point_in_rectangle(
		HOVER_X_GUI, HOVER_Y_GUI,
		x-width/2, y-height/2,
		x+width/2, y+height/2
	);
	
	if(hovering){
		if(fn_toolbox_get_money() >= item.price){
			fn_ui_set_cursor_state(CURSOR.HOVER);
			if(input_check_pressed(INPUTS.ACCEPT)){
				with(obj_world_shop_inside){
					BuyItem(other.item.name);
				}
			}
		}
		else{
			fn_ui_set_cursor_state(CURSOR.FORBIDDEN);
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












