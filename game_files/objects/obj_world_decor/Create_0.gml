/// @description Insert description here

try{
	// Inherit the parent event
	event_inherited();
	
	item = fn_init_instance_variable("item")??noone;
	if(item == noone){
		instance_destroy();
	}
	sprite_index = fn_toolbox_get_item(item).spr;
	
	has_solid = noone;
	CreateSolid = function(){
		var _w = sprite_get_width(spr_solid);
		var _h = sprite_get_height(spr_solid);
		var _xs = (16/_w);
		var _ys = (16/_h);
		
		if(collision_rectangle(
			x, y,
			x+_w*_xs, y+_h*_ys,
			obj_actor_player, false, true
		)){
			alarm[1] = 1;
		}
		else{
			has_solid = fn_instance_create_depth(x, y, depth, obj_abs_solid, {
				xscale: _xs,
				yscale: _ys,
			});
		}
	}
	
	if(string_count("fence", item) > 0 &&
	sprite_index != spr_world_decor_fence_middle_left &&
	sprite_index != spr_world_decor_fence_middle_right){
		CreateSolid();
	}
	
	RemoveDecor = function(){
		if(fn_toolbox_add_item(item, 1)){
			fn_world_free_cell();
			fn_play_sound(snd_scythe);
			instance_destroy();
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}
