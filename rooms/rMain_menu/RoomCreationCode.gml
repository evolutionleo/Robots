//if(!variable_global_exists("flag")) {
//	global.flag = true
//	room_goto(rLogin)
//}
//else {
//}

if(variable_global_exists("toggle_light")) {
	if(!global.toggle_light)
		instance_destroy(obj_light_renderer)
}
if(!variable_global_exists("toggle_timer")) {
	global.toggle_timer = true
}
if(!variable_global_exists("verified")) {
	global.verified = false
}
if(!variable_global_exists("Player_name")) {
	global.Player_name = "PlayerName"
}

global.locallevel = false
global.run_invalid = false

//ini_open("Verify.ini")
//global.verified = ini_read_real("Verified","Level Verified",false)
//ini_close()