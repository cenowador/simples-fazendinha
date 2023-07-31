/// @description moves camera

try{
	// Get current camera position
	var _cam_x = camera_get_view_x(camera);
	var _cam_y = camera_get_view_y(camera);
	var _cam_w = camera_get_view_width(camera);
	var _cam_h = camera_get_view_height(camera);

	// Set target camera position
	if(instance_exists(target)){
		var _target_x = target.x - _cam_w/2 + camera_property_boundary_x;
		var _target_y = target.y - _cam_h/2 + camera_property_boundary_y;
	
		// Clamp the target to room bounds
		_target_x = clamp(_target_x, 0, room_width - _cam_w);
		_target_y = clamp(_target_y, 0, room_height - _cam_h);

		// Smoothly move the camera to the target position
		_cam_x = lerp(_cam_x, _target_x, camera_property_smooth);
		_cam_y = lerp(_cam_y, _target_y, camera_property_smooth);
	}
	else{
		_cam_x = 0;
		_cam_y = 0;
	}
	
	var _disp_x = 0;
	var _disp_y = 0;
	if(screenshaking_str > 0){
		_disp_x = xirandom_range(-screenshaking_str, screenshaking_str);
		_disp_y = xirandom_range(-screenshaking_str, screenshaking_str);
	}
	camera_set_view_pos(camera, _cam_x+_disp_x, _cam_y+_disp_y);
}
catch(_err){
	fn_crash_handle(_err);
}
