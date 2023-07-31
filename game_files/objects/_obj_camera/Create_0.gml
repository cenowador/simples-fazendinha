/// @description variables

//camera target
target = noone;

//view
camera = view_camera[0];

//smooth amount
camera_property_smooth = 0.3;

//boundaries
camera_property_boundary_x_default = 0;
camera_property_boundary_y_default = 0;
camera_property_boundary_x = camera_property_boundary_x_default;
camera_property_boundary_y = camera_property_boundary_y_default;

screenshaking_str = 0;
ScreenShake = function(_str, _time){
	screenshaking_str = _str;
	call_later(_time, time_source_units_frames, function(){
		screenshaking_str = 0;
	});
}
	