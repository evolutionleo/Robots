/// @desc

if(active) {
	
	
if(type == "level select") {
	room_goto(level + 1)
}
else if(type == "level slide") {
	with(oInterface_button) {
		if(type == "level select") {
			level += other.slide_amount
			if(level > room_last - 1 or level < 1) {
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

}