/// @description Insert description here

try{
	var _accept = input_check_pressed(INPUTS.ACCEPT);
	//if player is near and clicked me
	var _on_front = collision_rectangle(
		x-sprite_width/2+15, y-GRID_H*2, x+sprite_width/2-7, y+GRID_H-10, obj_actor_player, false, true
	);
	var _on_cart = point_in_rectangle(
		HOVER_X_REAL, HOVER_Y_REAL,
		x-sprite_width/2, y-GRID_H*3-5, x+sprite_width/2, y+GRID_H-10
	)
	if(_on_front && _on_cart){
		fn_ui_set_cursor_state(CURSOR.HOVER);
		if(_accept){
			OpenShop();
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












