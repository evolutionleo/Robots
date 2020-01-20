/// @desc
var json = async_load[? "result"]
//show_message(json)
var list = ds_list_create()
var map = ds_map_create()
map = json_decode(json)
//map = async_load[? "result"]
//var k = ds_map_find_first(map)
//list = map[? k]
list = map[? "default"]

//show_debug_message(json)
if(!is_undefined(list)) {

for(var i = 0; i < ds_list_size(list); i++) {
	leadmap[? i] = list[| i]
	//show_debug_message(list[| i])
}

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
		//show_debug_message(text)
	}

}
}