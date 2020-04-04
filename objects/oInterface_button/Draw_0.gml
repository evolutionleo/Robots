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
else if(type == "log in") {
	draw_text(x,y,"Login")
}
else if(type == "new game") {
	draw_text(x,y,"New game")
}
else if(type == "options") {
	draw_text(x,y,"Options")
}
else if(type == "editor") {
	if(active)
		draw_text(x,y,"Editor (beta)")
	else
		draw_text(x,y,"Editor (full only)")
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
else if(type == "custom select") {
	//draw_text(x,y,lvl_name)
	//draw_set_font(fCreator)
	//draw_set_halign(fa_right)
	//draw_set_valign(fa_bottom)
	//draw_text(bbox_right-10,bbox_bottom-10,"by: "+creator_name)
}
else if(image_index > 1 or type == "to menu" or type == "exit" or type == "level slide" or type == "help" or 
type == "custom play" or type == "custom slide" or type == "search") {
	draw_text(x,y,"")
}
else if(type == "login") {
	draw_text(x,y,"Login")
}
else if(type == "sign up") {
	draw_text(x,y,"Signup")
}
else if(type == "share") {
	draw_text(x,y,"Upload")
}
else if(type == "editor list") {
	draw_text(x,y,"Browse")
}
else {
	draw_text(x,y,type)
}