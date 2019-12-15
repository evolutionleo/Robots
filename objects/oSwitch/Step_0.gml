/// @desc
with(oDarkness) {
	if(rob_id == other.current) {
		image_alpha -= 0.05
	}
	else {
		image_alpha += 0.05
		
	}
	image_alpha = clamp(image_alpha, .0, 1.0)
}

if(keyboard_check_pressed(oInput.binds[? "switch"])) {
//if(keyboard_check_pressed(ord("Q"))) {
	current += 1
	if(current == max_) current = 0
}