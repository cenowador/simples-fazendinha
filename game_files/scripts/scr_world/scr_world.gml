function fn_world_save(){
	var _save = {
		money: 0,
		inventory: 0,
		time: 0,
		plots: [],
		decors: []
	}
	with(_obj_time){
		_save.time_current = time_current;	
	}
	with(obj_toolbox){
		_save.money = money;
		_save.inventory = inventory;
	}
	with(obj_world_decor){
		array_push(_save.decors, {
			_x: x,
			_y: y,
			_item: item
		});
	}
	with(obj_world_plot){
		var _plot = {
			_x: x,
			_y: y,
			_watered: watered,
			_sowed: sowed,
			_sowed_inst: noone
		}
		with(sowed_inst){
			_plot._sowed_inst = {
				_alive_time: alive_time,
				_stage: stage
			}
		}
		array_push(_save.plots, _plot);
	}
	var _f = file_text_open_write("save");
	file_text_write_string(_f, base64_encode(json_stringify(_save)));
	file_text_close(_f);
}

function fn_world_load(){
	if(!file_exists("save")){
		return;	
	}
	var _f = file_text_open_read("save");
	var _save = json_parse(base64_decode(file_text_read_string(_f)));
	with(_obj_time){
		time_current = _save.time_current;
	}
	with(obj_toolbox){
		money = _save.money;
		inventory = _save.inventory;
	}
	var _plot_leng = array_length(_save.plots);
	for(var _i = 0; _i < _plot_leng; ++_i){
		var _plot = _save.plots[_i];
		fn_instance_create_depth(_plot._x, _plot._y, 0, obj_world_plot, {
			watered: _plot._watered,	
			sowed: _plot._sowed,
			sowed_inst: _plot._sowed_inst
		});
	}
	var _decor_leng = array_length(_save.decors);
	for(var _i = 0; _i < _decor_leng; ++_i){
		var _decor = _save.decors[_i];
		fn_instance_create_depth(_decor._x, _decor._y, 0, obj_world_decor, {
			item: _decor._item
		});
	}
	file_text_close(_f);
	global.loading_game = false;
}

function fn_world_get_coord(_x, _y){
	with(obj_world_control){
		return PosToCoord(_x, _y);
	}
}

function fn_world_use_cell(){
	var _x = x;
	var _y = y;
	with(obj_world_control){
		var _coord = PosToCoord(_x, _y);
		UseCell(_coord.px, _coord.py, other.id);
	}
}

function fn_world_free_cell(){
	var _x = x;
	var _y = y;
	with(obj_world_control){
		var _coord = PosToCoord(_x, _y);
		FreeCell(_coord.px, _coord.py);
	}
}

function fn_world_cell_is_free(_x, _y){
	with(obj_world_control){
		var _coord = PosToCoord(_x, _y);
		return CellIsFree(_coord.px, _coord.py);
	}
	return true;
}
