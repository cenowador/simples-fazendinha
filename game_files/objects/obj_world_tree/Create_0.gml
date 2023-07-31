/// @description Insert description here

try{
	event_inherited();
	
	var _xs = 0.9;
	var _ys = 0.5;
	var _sw = sprite_get_width(spr_solid)*_xs;
	var _sh = sprite_get_width(spr_solid)*_ys;
	fn_instance_create_depth(x-_sw/2, y-_sh, depth, obj_abs_solid, {xscale: _xs, yscale: _ys})
}
catch(_err){
    fn_crash_handle(_err);
}












