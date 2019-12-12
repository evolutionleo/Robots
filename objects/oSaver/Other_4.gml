/// @desc

ini_open("save.ini")
active = ini_read_real("Unlocked levels",room,false)
if(active) {
	sprite_index = SPortal_Activated
}
ini_close()