/// @description destroys dialog

try{
	__AfterClosing(closing_arg);
	instance_destroy();
}
catch(_err){
    fn_crash_handle(_err);
}












