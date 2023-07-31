function fn_toolbox_get_item(_name){
	return global.ITEMS[? _name];	
}

function fn_toolbox_subt_item(_item, _amt){
	with(obj_toolbox){
		SubtItem(_item, _amt);	
	}
}

function fn_toolbox_add_item(_item, _amt){
	with(obj_toolbox){
		return AddItem(_item, _amt);	
	}
	return false;
}

function fn_toolbox_get_money(){
	with(obj_toolbox){
		return money;
	}
	return 0;	
}

function fn_toolbox_subt_money(_amt){
	with(obj_toolbox){
		SubtMoney(_amt);	
	}
}

function fn_toolbox_add_money(_amt){
	with(obj_toolbox){
		AddMoney(_amt);	
	}
}
