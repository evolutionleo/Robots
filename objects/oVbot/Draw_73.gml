/// @desc
#region Draw error message
if(alarm[1] > 0) {
	draw_set_font(fErr)
	draw_set_color(c_yellow)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_center)
	draw_text(x,y-200,"Not enough space!")
}
#endregion