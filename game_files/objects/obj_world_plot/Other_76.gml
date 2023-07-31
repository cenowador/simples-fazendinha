/// @description capture animations end

try{
	var _message = event_data[? "message"];
	if(_message == "hoeAnimationEnd"){
		if(sequence_exists(hoe_sqc)){
			sequence_destroy(hoe_sqc);
		}
	}
	else if(_message == "canAnimationEnd"){
		if(sequence_exists(can_sqc)){
			sequence_destroy(can_sqc);
			can_sqc = noone;
		}
	}
	else if(_message == "scytheAnimationEnd"){
		if(sequence_exists(scythe_sqc)){
			sequence_destroy(scythe_sqc);
			scythe_sqc = noone;
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}












