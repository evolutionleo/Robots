/// @desc
if(room < r1 or instance_number(oTimer) > 1) {
	instance_destroy()
}

if(!global.logged_in) {
	global.run_invalid = true
}