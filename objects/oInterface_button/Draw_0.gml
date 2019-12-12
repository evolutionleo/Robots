/// @desc
draw_self()
image_index = active + start_index
draw_set_color(c_white)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fLevel_select)

if(type == "level select" and visible) {
	draw_text(x,y,string(level))
}
else if(type == "exit") {
	draw_text(x,y,"")
}
else if(type == "select") {
	draw_text(x,y,"Select level")
}
else if(type == "new game") {
	draw_text(x,y,"New game")
}
else if(type == "options") {
	draw_text(x,y,"Options (soon)")
}
else if(type == "editor") {
	draw_text(x,y,"Editor (soon)")
}