/// @description config

try{
	// Inherit the parent event
	event_inherited();
	
	text = "CRÉDITOS"
	xscale = 5;
	yscale = 3;
	CalculateSize();
	Clicked = function(){
		fn_room_goto(rm_credits);	
	}
}
catch(_err){
    fn_crash_handle(_err);
}
