/// @description variables

try{
	// Inherit the parent event
	event_inherited();
	
	fn_room_camera_set_target(self);
	
	object_label = "player";
	
	#region particles
	particle_footstep_max = 15;
	particle_footstep_count = 0;
	#endregion

	#region state variables
	states = [
		new State("walking", StateGetHandler("walking", "step"))
	];
	state_machine = CreateStateMachine(states);
	state_machine.SetState("walking");
	#endregion
	
	#region tools
	__UseHoe = function(){
		with(obj_world_control){
			__UseHoe();
		}
	}
	__UseCan = function(){
		with(obj_world_control){
			__UseCan();
		}
	}
	__UseScythe = function(){
		with(obj_world_control){
			__UseScythe();
		}
	}
	__UseSeed = function(_seed){
		with(obj_world_control){
			if(__UseSeed(_seed)){
				fn_toolbox_subt_item(_seed, 1);
			}
		}
	}
	__UseDecor = function(_item){
		with(obj_world_control){
			if(__UseDecor(_item)){
				fn_toolbox_subt_item(_item, 1);
			}
		}
	}
	UseTool = function(){
		if(global.hovering_toolbox){
			return;
		}
		//must be hovering around player
		var _coord = fn_world_get_coord(x, y);
		var _around_x1 = (_coord.px-1)*GRID_W;
		var _around_x2 = (_coord.px+1)*GRID_W;
		var _around_y1 = (_coord.py-1)*GRID_H-GRID_H;
		var _around_y2 = (_coord.py+1)*GRID_H;
		if(!point_in_rectangle(HOVER_X_REAL, HOVER_Y_REAL, _around_x1, _around_y1, _around_x2, _around_y2)){
			return;
		}
		
		var _tool = noone;
		with(obj_toolbox){
			_tool = GetEquipedItem();	
		}
		
		if(_tool == ITEMS_LIST.HOE){
			__UseHoe();
			return;
		}
		else if(_tool == ITEMS_LIST.CAN){
			__UseCan();
			return;
		}
		else if(_tool == ITEMS_LIST.SCYTHE){
			__UseScythe();
			return;
		}
		else if(_tool == ITEMS_LIST.PUMPKIN_SEED ||
		_tool == ITEMS_LIST.TOMATO_SEED ||
		_tool == ITEMS_LIST.CARROT_SEED ||
		_tool == ITEMS_LIST.POTATO_SEED ||
		_tool == ITEMS_LIST.POD_SEED){
			__UseSeed(_tool);
			return;
		}
		else{
			var _item = fn_toolbox_get_item(_tool);
			if(!is_undefined(_item)){
				if(_item.decor){
					__UseDecor(_tool);
					return;
				}
			}
		}
	}
	#endregion
}
catch(_err){
    fn_crash_handle(_err);
}
