/// @description create other buttons

try{
	//starts music
	fn_play_music(snd_bgm);
	
	instance_create_depth(GUI_W/2, GUI_H/2+30, depth, obj_menu_new);
	instance_create_depth(GUI_W/2, GUI_H/2+125, depth, obj_menu_load);
	//instance_create_depth(GUI_W/2, GUI_H/2+220, depth, obj_menu_exit);
	instance_create_depth(GUI_W/2, GUI_H/2+220, depth, obj_menu_credits);
}
catch(_err){
    fn_crash_handle(_err);
}












