/// @description defining messages

crashDefault = "Game Crashed!";
error_shortMessage = errorStruct.message;
error_longMessage = errorStruct.longMessage;
error_script = errorStruct.script;
error_stackTrace = errorStruct.stacktrace;

//error string
errorString = "Brief Message: " + error_shortMessage +
"\n\n Long Message: " + error_longMessage +
"\n\n Script: " + error_script +
"\n\n Stack Trace: ";
for(var i = 0; i < array_length(error_stackTrace); ++i)
	errorString += "\n" + error_stackTrace[i];

//sends error to console, for information persistance
show_debug_message("\n\n\n\n**********************************");
show_debug_message(errorString);
show_debug_message("**********************************\n\n\n\n");

alarm[0] = false;