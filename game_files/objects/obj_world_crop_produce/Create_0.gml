/// @description Insert description here

try{
	// Inherit the parent event
	event_inherited();
	uses_cell = false;
	
	seed = fn_init_instance_variable("seed");
	target_x = fn_init_instance_variable("target_x");
	target_y = fn_init_instance_variable("target_y");
	produce = noone;
	
	if(seed == ITEMS_LIST.PUMPKIN_SEED){
		sprite_index = spr_world_crop_pumpkin;
		produce = ITEMS_LIST.PUMPKIN;
	}
	else if(seed == ITEMS_LIST.TOMATO_SEED){
		sprite_index = spr_world_crop_tomato;
		produce = ITEMS_LIST.TOMATO;
	}
	else if(seed == ITEMS_LIST.POTATO_SEED){
		sprite_index = spr_world_crop_potato;	
		produce = ITEMS_LIST.POTATO;
	}
	else if(seed == ITEMS_LIST.POD_SEED){
		sprite_index = spr_world_crop_pod;
		produce = ITEMS_LIST.POD;
	}
	else if(seed == ITEMS_LIST.CARROT_SEED){
		sprite_index = spr_world_crop_carrot;
		produce = ITEMS_LIST.CARROT;
	}
	
	curve_spawn = animcurve_get_channel(ac_produce, "spawn");
	curve_float = animcurve_get_channel(ac_produce, "float");
	float_time = 0;
	spawn_time = 0;
}
catch(_err){
    fn_crash_handle(_err);
}
