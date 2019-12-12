/// @desc
draw_self()
image_index = active + start_index
if(type == "level select" and visible) {
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_font(fLevel_select)
	draw_text(x,y,string(level))
}
