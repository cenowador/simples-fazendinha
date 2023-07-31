/// @description error variable

/* content of error struct of a try/catch block

{
// a string that is a short message for this exception
message : "",

// a string that is a longer message for this exception
longMessage : "",

// a string that describes where the exception came from
script : "",

// an array of strings that is the stack frame the exception was generated
stacktrace : [ "", "" ],
}

*/
errorStruct = noone;
//header message
crashDefault = "";
//short error message
error_shortMessage = "";
//detailed error message
error_longMessage = "";
//script were the error occurred
error_script = "";
//stack trace of errors
error_stackTrace = "";

//destroys everyone to avoid more errors
with(all){
	if(id != other.id){
		instance_destroy();	
	}
}

//defines messages
alarm[0] = true;