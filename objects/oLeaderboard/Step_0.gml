/// @desc
with(oText_marker) {
	if(type == "leaderboard") {
		if(!is_undefined(other.leadmap[? n])) {
			my_map = other.leadmap[? n]
			name = my_map[? "name"]
			time = my_map[? "time"]
			time = msecs_to_datetime(time)
			version = "v"+my_map[? "version"]
			text = name+"  "+time+"  "+version
		}
	}
}