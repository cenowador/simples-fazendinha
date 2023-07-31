/// @description error handling

#region drawing the error screen

//draws dark blue bg
draw_set_color(make_color_rgb(20,35,60));
draw_rectangle(0, 0, VIEW_W, VIEW_H, false);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(20, 30, crashDefault);

//draws all the error codes
draw_text_ext(20, 30+floor(string_height(crashDefault))+20, errorString, -1, room_width-50);

draw_text_ext(20, 30+string_height(errorString)+20, "Press Enter to continue", -1, room_width-50);
#endregion
