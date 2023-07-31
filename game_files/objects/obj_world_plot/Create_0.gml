/// @description Insert description here

try{
	event_inherited();
	
	//show hoe animation
	hoe_sqc = noone;
	can_sqc = noone;
	scythe_sqc = noone;
	pumpkin_sqc = noone;
	tomato_sqc = noone;
	potato_sqc = noone;
	carrot_sqc = noone;
	pod_sqc = noone;
	
	ShowHoeAnimation = function(){
		hoe_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_hoe);
	}
	
	AdvanceDay = function(){
		with(sowed_inst){
			AdvanceDay();	
		}
		watered = false;
	}
	
	watered = fn_init_instance_variable("watered")??false;
	WaterPlot = function(){
		if(!watered){
			can_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_can);
			fn_play_sound(snd_watering);
		}
		watered = true;
	}
	
	ReapPlot = function(){
		if(sowed == noone){
			return false;	
		}
		with(sowed_inst){
			if(stage < stage_max){
				return false;
			}
			var _amt = xirandom_range(1, 3);
			repeat(_amt){
				var _x = x+xirandom_range(-GRID_W/2, GRID_W/2);
				var _y = y+xirandom_range(-GRID_H/2, GRID_H/2);
				fn_instance_create_depth(x, y, depth-1, obj_world_crop_produce, {seed: other.sowed, target_x: _x, target_y: _y});
			}
			Wither();
			fn_play_sound(snd_scythe);
		}
		return true;
	}
	
	sowed = fn_init_instance_variable("sowed")??noone;
	sowed_inst = fn_init_instance_variable("sowed_inst")??noone;
	if(sowed_inst != noone){
		//initialize crop
		sowed_inst = fn_instance_create_depth(x+GRID_W/2, y+GRID_H/2, y-1, obj_world_crop, {
			seed: sowed,
			parent: id,
			alive_time: sowed_inst._alive_time,
			stage: sowed_inst._stage
		});
	}
	SowPlot = function(_seed){
		if(sowed != noone){
			return false;	
		}
		sowed = _seed;
		if(_seed == ITEMS_LIST.PUMPKIN_SEED){
			pumpkin_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_pumpkin);	
		}
		else if(_seed == ITEMS_LIST.TOMATO_SEED){
			tomato_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_tomato);	
		}
		else if(_seed == ITEMS_LIST.POTATO_SEED){
			potato_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_potato);	
		}
		else if(_seed == ITEMS_LIST.POD_SEED){
			pod_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_pod);	
		}
		else if(_seed == ITEMS_LIST.CARROT_SEED){
			carrot_sqc = layer_sequence_create(layer_create(-14000), x+GRID_W/2, y-GRID_H, sqc_carrot);	
		}
		sowed_inst = fn_instance_create_depth(x+GRID_W/2, y+GRID_H/2, y-1, obj_world_crop, {seed: _seed, parent: id});
		fn_play_sound(snd_seed);
		return true;
	}
}
catch(_err){
    fn_crash_handle(_err);
}












