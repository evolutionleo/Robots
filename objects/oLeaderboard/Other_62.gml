/// @desc

var json = async_load[? "result"]
var list = ds_list_create()
var map = ds_map_create()
map = json_decode(json)
var k = ds_map_find_first(map)
list = map[? k]

//show_debug_message(json)
if(!is_undefined(list)) {
	
	
for(var i = 0; i < ds_list_size(list); i++) {
	leadmap[? i] = list[| i]
}

with(oText_marker) {
	if(type == "leaderboard") {
		if(!is_undefined(other.leadmap[? n]))
			text = other.leadmap[? n]
		//show_debug_message(text)
	}

}
}