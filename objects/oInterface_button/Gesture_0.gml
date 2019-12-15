/// @desc

if(active) {
	
	
if(type == "level select") {
	room_goto(level + r1 - 1)
}
else if(type == "level slide") {
	with(oInterface_button) {
		if(type == "level select") {
			level += other.slide_amount
			if(level + r1 - 1 > rlast or level < 1) {
				visible = false
				active = false
			}
			else {
				visible = true
				active = true
			}
		}
	}
}
else if(type == "exit") {
	game_end()
}
else if(type == "select") {
	room_goto(rLevel_select)
}
else if(type == "new game") {
	room_goto(r1)
}
else if(type == "to menu") {
	room_goto(rMain_menu)
}
else if(type == "leaderboard") {
	room_goto(rLeaderboard)
}
else if(type == "options") {
	room_goto(rSettings)
}

}
else if(type == "bind") {
	if(!any_bindkey_activated())
		active = true
}