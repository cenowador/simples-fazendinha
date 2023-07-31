/// @description Insert description here

try{
	time_counting = true;
	time_current = 7*60*60; // starts at 7am
	time_hour_length = 1;
	time_factor_original = 5;
	time_factor = time_factor_original;
	time_second_length = (time_hour_length/60);
	
	GetTime = function(_asString){
		var _df = 24*60*60;
		var _hf = 60*60;
		var _left = time_current;
		var _day = floor(_left/_df);
		_left -= _day*_df;
		var _hour = floor(_left/_hf);
		_left -= _hour*_hf;
		var _minutes = floor(_left/60);
		if(_asString){
			var _pd = fn_string_pad_start(string(_day), 2, "0");
			var _ph = fn_string_pad_start(string(_hour), 2, "0");
			var _pm = fn_string_pad_start(string(_minutes), 2, "0");
			return {day: _pd, hour: _ph, minute: _pm}
		}
		return {day: _day, hour: _hour, minute: _minutes}
	}
	
	day_current = 0;
	AdvanceDay = function(){
		with(obj_world_plot){
			AdvanceDay();	
		}
		day_current += 1;
	}
	SetTimeFactor = function(_factor){
		time_factor = _factor;
	}
	ResetTimeFactor = function(){
		time_factor = time_factor_original;
	}
	
	alarm[0] = 1;
}
catch(_err){
    fn_crash_handle(_err);
}












