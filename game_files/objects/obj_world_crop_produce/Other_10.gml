/// @description Insert description here

try{
	var _y = y;
	if(spawn_time >= 1){
		_y += animcurve_channel_evaluate(curve_float, float_time)*GRID_H/4;
	}
	draw_sprite_ext(sprite_index, image_number-1, x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
catch(_err){
    fn_crash_handle(_err);
}
