/// @desc
if(keyboard_check_pressed(oInput.binds[? "switch"])) {
//if(keyboard_check_pressed(ord("Q"))) {
	current += 1
	if(current == max_) current = 0
}