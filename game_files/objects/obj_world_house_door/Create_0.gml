/// @description Insert description here

try{
	// Inherit the parent event
	event_inherited();
	
	global.sleeping = false;
	slept = false;
	sleep_day = 0;
	SleepConfirm = function(){
		var _w = 500;
		var _h = 300;
		fn_instance_create_depth(GUI_W/2-_w/2, GUI_H/2-_h/2, 0, obj_modal_dialog, {
			text: "Tem certeza de que quer dormir até o outro dia?",
			parent: id,
			width: _w,
			height: _h,
			confirm_handler: Sleep
		});
	}
	Sleep = function(){
		global.sleeping = true;
		global.animating = true;
		with(_obj_time){
			other.sleep_day = day_current;	
		}
	}
	WakeUp = function(){
		global.sleeping = false;
		global.animating = false;
		slept = false;
	}
}
catch(_err){
    fn_crash_handle(_err);
}
