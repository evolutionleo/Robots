/// @desc
if(type == "level slide") {
	var min_level = room_last
	with(oInterface_button) {
		if(type == "level select") {
			if(level < min_level)
				min_level = level
		}
	}
	if(min_level + slide_amount > rlast) {
		active = false
	}
	else {
		active = true
	}
	
	if(active) {
		var max_level = 0
		with(oInterface_button) {
			if(type == "level select") {
				if(level > max_level)
					max_level = level
			}
		}
		if(max_level + slide_amount < 1) {
			active = false
		}
		else {
			active = true
		}
	}
}