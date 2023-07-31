/// @description object configuration

try{
	event_inherited();
	
	CreateStateMachine = function(_states, _animations=undefined){
		return new StateMachine(_states, _animations);
	}
	StateGetHandler = function(_name, _type){
		return method(id, asset_get_index("fn_state_machine_"+object_label+"_"+_name+"_"+_type));
	}
	StateGetAnimHandler = function(_name){
		return method(id, asset_get_index("fn_state_machine_"+object_label+"_"+_name+"_anim"));
	}
	
	//depth sorting
	ignore_depth = false;
	
	#region physics
	physics_speed_x = 0;
	physics_speed_y = 0;
	physics_speed_x_fraction = 0;
	physics_speed_y_fraction = 0;
	physics_speed_max = 3;
	physics_accel = 0.4;
	#endregion
	
	#region misc
	object_label = "";
	state_machine = CreateStateMachine([]);
	#endregion
}
catch(_err){
    fn_crash_handle(_err);
}
