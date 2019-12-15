/// @desc
leadmap = ds_map_create()
ini_open("Leaderboard.ini")
for(var i = 0; i < 9; i++) {
	ds_map_add(leadmap,i,ini_read_string("Best times",i,"-"))
}
ini_close()
with(oText_marker) {
	if(type == "leaderboard") {
		text = other.leadmap[? n]
		show_debug_message(text)
	}
}