/// @description draws itself

try{
	draw_sprite_ext(sprite_index, disabled, x, y, xscale*scale, yscale, 0, c_white, 1);
	var _t = text;
	if(hovering && !disabled){
		_t = "[wave]"+text;	
	}
	scribble(_t)
	.starting_format(FONT.DIALOG)
	.align(fa_center, fa_middle)
	.draw(x, y);
}
catch(_err){
    fn_crash_handle(_err);
}












