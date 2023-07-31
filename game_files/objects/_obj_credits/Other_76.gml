/// @description capture animations end

try{
	var _message = event_data[? "message"];
	if(_message == "creditsAnimationEnd"){
		fn_room_goto(rm_menu);
	}
}
catch(_err){
    fn_crash_handle(_err);
}












