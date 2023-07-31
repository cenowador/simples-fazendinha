/// @description Insert description here

try{
	// Inherit the parent event
	event_inherited();
	
	OpenShop = function(){
		if(!instance_exists(obj_world_shop_inside)){
			instance_create_depth(0, 0, 0, obj_world_shop_inside);
		}
	}
}
catch(_err){
    fn_crash_handle(_err);
}
