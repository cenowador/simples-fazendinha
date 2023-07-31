/// @description Insert description here

try{
	global.grid_hovering_x = floor(mouse_x/GRID_W);
	global.grid_hovering_y = floor(mouse_y/GRID_H);
	global.grid_hovering_x_real = global.grid_hovering_x*GRID_W;
	global.grid_hovering_y_real = global.grid_hovering_y*GRID_H;
}
catch(_err){
    fn_crash_handle(_err);
}












