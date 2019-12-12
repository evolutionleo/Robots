/// @desc
if(type == "level select" and active) {
	room_goto(r1)
	room_goto(level)
}
else if(type == "level slide" and active) {
	with(oInterface_button) {
		if(type == "level select") {
			level += other.slide_amount
			if(level > room_last or level < 1) {
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
