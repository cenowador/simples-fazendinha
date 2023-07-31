//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    
    keyboard_and_mouse:
    {
        up: [input_binding_key(vk_up), input_binding_key("W")],
        down: [input_binding_key(vk_down), input_binding_key("S")],
        left: [input_binding_key(vk_left), input_binding_key("A")],
        right: [input_binding_key(vk_right), input_binding_key("D")],
        
		accept:  [input_binding_mouse_button(mb_left), input_binding_key(vk_enter)],
        cancel:  [input_binding_key(vk_backspace), input_binding_key(vk_escape)],
        
        pause: input_binding_key(vk_escape),
    },
    
    gamepad:
    {
        up: [input_binding_gamepad_axis(gp_axislv, true), input_binding_gamepad_button(gp_padu)],
        down: [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left: [input_binding_gamepad_axis(gp_axislh, true), input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
        
        accept: input_binding_gamepad_button(gp_face1),
        cancel: input_binding_gamepad_button(gp_face2),
        
        pause: input_binding_gamepad_button(gp_start),
    },
};

//Defines which verbs should collide with which other verbs when using input_binding_get_collisions()
//and input_binding_set_safe(). A verb that is not present in a group will collide with all other verbs
INPUT_VERB_GROUPS = {
    //Fill me up!
};