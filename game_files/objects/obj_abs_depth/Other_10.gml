/// @description Insert description here

try{
	if(global.loading_game){
		exit;	
	}
	draw_self();
}
catch(_err){
    fn_crash_handle(_err);
}












