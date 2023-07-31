function fn_string_shorten_value(_val, _places=2){
	var _number_prefix = _val;
	var _number_suffix = "";
	if (_val >= 1000000000) {
		_number_prefix = _val/1000000000;
		_number_suffix = "KKK";
	}
	else if (_val >= 1000000) {
		_number_prefix = _val/1000000;
		_number_suffix = "KK";
	}
	else if (_val >= 1000) {
		_number_prefix = _val/1000;
		_number_suffix = "K";
	}
	var _str = string(_number_prefix);
	if(string_count(".", _str) > 0){
		var _last_char = string_char_at(_str, string_length(_str));
		if(_last_char == "0")
			_str = string_delete(_str, string_length(_str), 1);
	}
	return _str + _number_suffix;
}

function fn_string_pad_start(_string, _leng, _char){
	var _final = "";
	var _str = string(_string);
	var _clen = string_length(_str);
	var _amt = fn_clamp_min(_leng-_clen, 0);
	repeat(_amt){
		_final += _char;	
	}
	_final += _str;
	return _final;
}
