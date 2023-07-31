function fn_room_goto(_rm){
	room_goto(_rm);
}

function fn_room_camera_set_target(_target){
	with(global.camera){
		target = _target;
		
		var _cam_x = camera_get_view_x(camera);
		var _cam_y = camera_get_view_y(camera);
		var _cam_w = camera_get_view_width(camera);
		var _cam_h = camera_get_view_height(camera);

		//set target camera position
		var _target_x = target.x - _cam_w/2 + camera_property_boundary_x;
		var _target_y = target.y - _cam_h/2 + camera_property_boundary_y;
	
		// Clamp the target to room bounds
		_target_x = clamp(_target_x, 0, room_width - _cam_w);
		_target_y = clamp(_target_y, 0, room_height - _cam_h);

		// Smoothly move the camera to the target position
		camera_set_view_pos(camera, _target_x, _target_y);
	}
}
