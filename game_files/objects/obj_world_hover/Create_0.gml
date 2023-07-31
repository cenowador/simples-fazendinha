/// @description resizes

try{
	image_xscale = GRID_W/sprite_width;
	image_yscale = GRID_H/sprite_height;
}
catch(_err){
    fn_crash_handle(_err);
}
