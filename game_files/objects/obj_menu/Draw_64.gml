/// @description draw logo

try{
	scribble("simples")
	.starting_format(FONT.MENU)
	.align(fa_left, fa_top)
	.draw(580, 220);
	scribble("fazendinha")
	.starting_format(FONT.MENU)
	.align(fa_left, fa_top)
	.draw(580, 260);
}
catch(_err){
    fn_crash_handle(_err);
}












