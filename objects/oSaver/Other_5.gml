/// @desc
if(active) {
	ini_open("save.ini")
	for(var i = 0; i <= room; i++) {
		ini_write_real("Unlocked levels", i, true)
	}
	ini_close()
}