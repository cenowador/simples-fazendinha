/// @description config

try{
	// Inherit the parent event
	event_inherited();
	
	disabled = (!file_exists("save"));
	text = "CONTINUAR"
	xscale = 5;
	yscale = 3;
	CalculateSize();
	Clicked = function(){
		global.loading_game = true;
		fn_room_goto(rm_world);	
	}
}
catch(_err){
    fn_crash_handle(_err);
}
