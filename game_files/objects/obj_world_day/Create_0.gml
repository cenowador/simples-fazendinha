/// @description Insert description here

try{
	application_surface_draw_enable(false);
	
	light_curve = animcurve_get_channel(ac_day, "light");
	
	GetLight = function(){
		var _time = {day: 0, hour: 0, minute: 0};
		with(_obj_time){
			_time = GetTime();	
		}
		var _hour = _time.hour/24;
		var _light = animcurve_channel_evaluate(light_curve, _hour);
		return _light;
	}
}
catch(_err){
    fn_crash_handle(_err);
}












