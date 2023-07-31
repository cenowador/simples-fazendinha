///@desc handles game crashes
function fn_crash_handle(exceptionStruct){
	if(!debug_mode){
		var handler = instance_create_depth(0, 0, 0, _obj_crashHandler);
		handler.errorStruct = exceptionStruct;
		room_goto(rm_crash);
	}
	else{
		throw(exceptionStruct);
	}
}