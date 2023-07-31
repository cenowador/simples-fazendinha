/// @description config

try{
	disabled = false;
	text = "";
	xscale = 1;
	yscale = 1;
	scale = 1;
	CalculateSize = function(){
		width = sprite_get_width(sprite_index)*xscale;
		height = sprite_get_height(sprite_index)*yscale;
	}
	
	hovering = false;
	Clicked = function(){}
}
catch(_err){
    fn_crash_handle(_err);
}












