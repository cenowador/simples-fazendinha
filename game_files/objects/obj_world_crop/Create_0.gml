/// @description config

try{
	event_inherited();
	uses_cell = false;
	
	parent_plot = fn_init_instance_variable("parent");
	
	seed = fn_init_instance_variable("seed")??noone;
	if(seed == ITEMS_LIST.PUMPKIN_SEED){
		sprite_index = spr_world_crop_pumpkin;
	}
	else if(seed == ITEMS_LIST.TOMATO_SEED){
		sprite_index = spr_world_crop_tomato;
	}
	else if(seed == ITEMS_LIST.POTATO_SEED){
		sprite_index = spr_world_crop_potato;
	}
	else if(seed == ITEMS_LIST.POD_SEED){
		sprite_index = spr_world_crop_pod;
	}
	else if(seed == ITEMS_LIST.CARROT_SEED){
		sprite_index = spr_world_crop_carrot;
	}
	
	alive_time = fn_init_instance_variable("alive_time")??0;
	stage = fn_init_instance_variable("stage")??0;
	stage_max = 4
	Grow = function(){
		var _watered = false;
		with(parent_plot){
			_watered = watered;
		}
		if(_watered){
			stage = fn_clamp_max(stage+1, stage_max)
		}
		alive_time += 1;
		if(alive_time > stage_max+3){
			Wither();
		}
	}
	
	Wither = function(){
		with(parent_plot){
			sowed = noone;
			sowed_inst = noone;
		}
		instance_destroy();
	}
	
	AdvanceDay = function(){
		Grow();
	}
}
catch(_err){
    fn_crash_handle(_err);
}
