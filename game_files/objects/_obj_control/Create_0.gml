/// @description Insert description here


#macro GAME_SPEED global.game_speed
#macro INPUTS global.inputs
#macro FONT global.fonts

try{
	xrandomize();
	
	global.loading_game = false;
	global.sound_enabled = true;
	global.game_speed = game_get_speed(gamespeed_fps);
	global.instance_init = {};
	global.camera = instance_create_depth(0, 0, 0, _obj_camera);
	global.animating = false;
	global.inputs = {
		UP: "up",
        DOWN: "down",
        LEFT: "left",
        RIGHT: "right",
		ACCEPT: "accept",
        CANCEL: "cancel",
        PAUSE: "pause",
	}
	global.fonts = {
		CLOCK: "fnt_ui_32_out",
		DIALOG: "fnt_ui_32_out",
		MONEY: "fnt_ui_26_out",
		MENU: "fnt_ui_42_out",
		PAUSE: "fnt_ui_26_out",
		SHOP: "fnt_ui_silver_32_out",
		SHOP_SELL: "fnt_ui_24_out",
		TOOLBOX_AMT: "fnt_ui_24_out"
	}
	
	var _c = make_color_rgb(38, 22, 18);
	scribble_font_bake_outline_8dir_2px("fnt_ui_24", "fnt_ui_24_out", _c, false);
	scribble_font_bake_outline_8dir_2px("fnt_ui_26", "fnt_ui_26_out", _c, false);
	scribble_font_bake_outline_8dir_2px("fnt_ui_32", "fnt_ui_32_out", _c, false);
	scribble_font_bake_outline_8dir_2px("fnt_ui_silver_32", "fnt_ui_silver_32_out", _c, false);
	scribble_font_bake_outline_8dir_2px("fnt_ui_72", "fnt_ui_72_out", _c, false);
	scribble_font_bake_outline_8dir_2px("fnt_ui_42", "fnt_ui_42_out", _c, false);
	
	fn_room_goto(rm_menu);
}
catch(_err){
	fn_crash_handle(_err);
}
