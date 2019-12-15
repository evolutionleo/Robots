/// @desc
if(type == "leaderboard") {
	font = fLeaderboard
}
//else {
	draw_set_font(font)
//}
if(visible_) {
	draw_self()
}
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(color)
draw_text(x+3,y,text)