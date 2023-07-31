/// @description config

try{
	event_inherited();
	
	text = fn_init_instance_variable("text")??"";
	button_confirm = fn_init_instance_variable("confirm")??true;
	button_cancel = fn_init_instance_variable("cancel")??true;
	parent = fn_init_instance_variable("parent")??noone;
	width = fn_init_instance_variable("width")??1;
	height = fn_init_instance_variable("height")??1;
	
	EmptyFunc = function(){}
	
	var _confirm_handler = fn_init_instance_variable("confirm_handler")??EmptyFunc;
	var _cancel_handler = fn_init_instance_variable("cancel_handler")??EmptyFunc;
	
	on_confirm = method(parent, _confirm_handler);
	on_cancel = method(parent, _cancel_handler);
	
	typist = scribble_typist();
	typist.in(0.6, 0);
	
	button_cancel_x = x+width/2+60;
	button_cancel_y = y+height/2+70;
	button_cancel_s = 3;
	button_cancel_w = sprite_get_width(spr_ui_cancel)*button_cancel_s;
	button_cancel_h = sprite_get_height(spr_ui_cancel)*button_cancel_s;
	button_cancel_hover = false;
	button_cancel_s_draw = button_cancel_s;
	button_confirm_x = x+width/2-60;
	button_confirm_y = y+height/2+70;
	button_confirm_s = 3;
	button_confirm_w = sprite_get_width(spr_ui_confirm)*button_confirm_s;
	button_confirm_h = sprite_get_height(spr_ui_confirm)*button_confirm_s;
	button_confirm_hover = false;
	button_confirm_s_draw = button_confirm_s;
	
	__AfterClosing = function(_accepted){
		if(_accepted){
			method_call(on_confirm, []);	
		}
		else{
			method_call(on_cancel, []);	
		}
	}
	
	OpenOverlay();
}
catch(_err){
    fn_crash_handle(_err);
}












