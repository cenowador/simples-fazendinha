/// @description config

try{
	// Inherit the parent event
	event_inherited();
	
	text = "SAIR"
	xscale = 5;
	yscale = 3;
	CalculateSize();
	Clicked = function(){
		ExitGameConfirm();
	}
	ExitGameConfirm = function(){
		var _w = 500;
		var _h = 300;
		fn_instance_create_depth(GUI_W/2-_w/2, GUI_H/2-_h/2, 0, obj_modal_dialog, {
			text: "Tem certeza de que\nquer sair?",
			parent: id,
			width: _w,
			height: _h,
			confirm_handler: ExitGame,
		});
	}
	ExitGame = function(){
		game_end();	
	}
}
catch(_err){
    fn_crash_handle(_err);
}
