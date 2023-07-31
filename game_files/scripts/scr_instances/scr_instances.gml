function fn_init_instance_variable(_name){
	if(variable_struct_exists(global.instance_init, _name))
		return variable_struct_get(global.instance_init, _name);
	
	return undefined;
}

function fn_instance_create_depth(_x, _y, _depth, _obj, _vars_struct={}){
	global.instance_init = _vars_struct;
	
	var _inst = instance_create_depth(_x, _y, _depth, _obj);
	
	global.instance_init = {};
	
	return _inst;
}

function fn_instance_deactivate_all(_excepts=[]){
	var _deactivated = [];
	array_push(_excepts, id);
	array_push(_excepts, _obj_crashHandler);
	with(all){
		if(!array_contains(_excepts, id) && !array_contains(_excepts, object_index) &&
		!array_contains(_excepts, object_get_parent(object_index))){
			array_push(_deactivated, id);
			instance_deactivate_object(id);
		}
	}

	return _deactivated;
}

function fn_instance_activate_all(_insts){
	var _amt = array_length(_insts);
	for(var _j = 0; _j < _amt; ++_j){
		instance_activate_object(_insts[_j]);
	}
}
