/// @description counts time

try{
	if(time_counting){
		time_current += time_hour_length*time_factor;
		var _time = GetTime();
		if(_time.day != day_current && _time.hour >= 0){
			AdvanceDay();
		}
	}
	
	alarm[0] = 1;
}
catch(_err){
    fn_crash_handle(_err);
}
