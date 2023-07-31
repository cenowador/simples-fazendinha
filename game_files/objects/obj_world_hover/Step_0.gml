/// @description updates position

try{
	with(obj_world_control){
		other.x = HOVER_X_REAL;	
		other.y = HOVER_Y_REAL;	
	}
}
catch(_err){
    fn_crash_handle(_err);
}












