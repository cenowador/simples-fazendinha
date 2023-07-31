/// @description deactivate everyone

try{
	deactivated_instances = fn_instance_deactivate_all(deactivating_exceptions);
}
catch(_err){
    fn_crash_handle(_err);
}












