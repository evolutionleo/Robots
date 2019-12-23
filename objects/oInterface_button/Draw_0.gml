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
else if(type == "custom level select" and visible) {
	draw_text(x,y,"Custom level #"+string(level-rEmpty+1))
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
	draw_text(x,y,"Options")
}
else if(type == "editor") {
	draw_text(x,y,"Editor (beta)")
}
else if(type == "leaderboard") {
	draw_text(x,y,"Leaderboards")
}
else if(type == "bind") {
	draw_text(x,y,key_to_string(bind_value))
}
else if(type == "delete") {
	draw_text(x,y,"Delete ALL saves")
}
else if(type == "editor edit") {
	draw_text(x,y,"Create/edit")
}
else if(type == "editor play") {
	draw_text(x,y,"Play!")
}
else if(type == "clear all") {
	draw_text(x,y,"Delete all")
}