/// @description 
draw_set_font(fTimer)



//+ ":" + string(msecs)
draw_set_halign(fa_right)
draw_set_valign(fa_top)

//draw_set_color(c_
var vw = room_width
//var vh = display_get_gui_height()
//var vw = display_get_gui_width()
if(room != room_last) {
draw_text_transformed_color(vw - 20, 20, str, vw / 1024, vw / 1024, 0, c_orange, c_orange, c_red, c_red, 0.8)
}
else {
draw_text_transformed_color(vw - 20, 20, str, vw / 1024, vw / 1024, 0, c_blue, c_blue, c_aqua, c_aqua, 0.8)
}
//draw_text_color(vw - 20, 20, str, c_orange, c_orange, c_red, c_red, 0.8)