/// @description Insert description here

try{
	if(global.loading_game){
		draw_set_color(c_black);
		draw_rectangle(0, 0, GUI_W, GUI_H, false);
	}
}
catch(_err){
    fn_crash_handle(_err);
}












