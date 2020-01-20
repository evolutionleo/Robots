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
else if(type == "online level select") {
	draw_text(x,y,lvl_name)
	draw_set_font(fCreator)
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	draw_text(bbox_right-10,bbox_bottom-10,"by: "+creator_name)
}
else if(type == "to menu" or type == "exit" or type == "level slide") {
	draw_text(x,y,"")
}
else {
	draw_text(x,y,type)
}