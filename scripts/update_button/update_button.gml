var type = argument0
///@arg type

if(type == "level select") {
	ini_open("save.ini")
	active = ini_read_real("Unlocked levels",level,false)
	ini_close()
	if(level == r1)
		active = true
}
else if(type == "editor play") {
	active = file_exists("File.txt")
}
else if(type == "level slide") {
	var min_level = room_last
	with(oInterface_button) {
		if(id.type == "level select") {
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
			if(id.type == "level select") {
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
else if(type == "custom slide") {	
	var max_level = 0
	with(oInterface_button) {
		if(id.type == "custom play") {
			if(n > max_level)
				max_level = n
		}
	}
	if(max_level + slide_amount < 1) {
		active = false
	}
	else {
		active = true
	}
}
else if(type == "share") {
	if(file_exists("File.txt")) {
		var verified = global.verified
		active = global.logged_in and verified and alarm[2] <= 0
	}
	else
		active = false
}
else if(type == "custom play") {
	default_map = oCustom_level_list.levellist[| n-1] // List is from "default" key, map is placed #n in the list
	if(is_undefined(default_map)) {
		active = false
		exit
	}

	content_map = json_decode(default_map[? "content"])
	// content_map is a map, that looks like that {"ROOT":{...}}
	if(is_undefined(content_map)) {
		active = false
		exit
	}
	
	content = content_map[? "ROOT"] // This map contains pure level content
	if(is_undefined(content)) {
		active = false
		exit
	}
	
	active = true
	global.content = content
}
else if(type == "rating+") {
	active = global.logged_in and !ds_map_exists(global.liked,my_id)
	if(is_undefined(oCustom_level_list.levellist[| n-1])) {
		active = false
		exit
	}
	my_map = oCustom_level_list.levellist[| n-1]
	my_id = real(my_map[? "id"])
}