/// @desc
if(type == "level select") {
	ini_open("save.ini")
	active = ini_read_real("Unlocked levels",level,false)
	ini_close()
	if(level == 1)
		active = true
}