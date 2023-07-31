/// @description resize rooms
//scaling everybody to be 1280x720
#macro IDEAL_WIDTH global.ideal_width
#macro IDEAL_HEIGHT global.ideal_height
#macro VIEW_X camera_get_view_x(view_camera[0])
#macro VIEW_Y camera_get_view_y(view_camera[0])
#macro VIEW_W camera_get_view_width(view_camera[0])
#macro VIEW_H camera_get_view_height(view_camera[0])
#macro GUI_W 1280
#macro GUI_H 720

global.ideal_width = 384;
global.ideal_height = 216;

//getting the aspect ratio of the monitor
var aspectRatio = display_get_width()/display_get_height();

//the game is designed to fit mainly 16:9 (720p, 1080p), but can fit 2:1 and 4:3
if(aspectRatio < 2) //if less than 2:1
	if(aspectRatio > 1.32 && aspectRatio < 1.7)
		aspectRatio = 1.333; // sets to 4:3
	else
		aspectRatio = 1.778; // sets to 16:9
else //if bigger than 16:9
	aspectRatio = 2; // sets to 2:1

//calculating the ideal width based on the aspect ratio
var newWidth = round(IDEAL_HEIGHT * aspectRatio);

//width cannot be odd since there is no monitor with odd pixel count
if(newWidth % 2 > 0) //if IDEAL_HEIGHT is odd
	newWidth+=1;
	
//applying the scale found to every room of the game
for(var i = 1; i <= room_last; ++i){//it starts from 1 because the _config_room is the 0, and it's useless to scale it
	if(room_exists(i)){
		room_set_view_enabled(i, true);
		room_set_viewport(i, 0, true, 0, 0, IDEAL_WIDTH, IDEAL_HEIGHT);
	}
}

//resizing the surface where things are drawn, the window, the camera and gui
surface_resize(application_surface, IDEAL_WIDTH, IDEAL_HEIGHT);
camera_set_view_size(view_camera[0], IDEAL_WIDTH, IDEAL_HEIGHT);
display_set_gui_size(IDEAL_WIDTH, IDEAL_HEIGHT);
window_set_size(IDEAL_WIDTH, IDEAL_HEIGHT);
if(debug_mode){
	window_set_size(1280, 720);
}

//center window and go to next room
alarm[0] = 1;
