/// @description Center screen if not in browser mode

window_center();
window_set_fullscreen(!debug_mode);
instance_destroy();

//go to the actual first room
room_goto_next();
