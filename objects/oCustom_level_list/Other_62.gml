/// @desc
var json = async_load[? "result"]
show_message(json)
var list = ds_list_create()
var map = ds_map_create()
map = json_decode(json)
//var k = ds_map_find_first(map)
//list = map[? k]
list = map[? "default"]

//show_debug_message(json)
if(!is_undefined(list)) {
	
	
for(var i = 0; i < ds_list_size(list); i++) {
	levellist[| i] = list[| i]
}

with(oInterface_button) {
	if(type == "online level select") {
		if(!is_undefined(other.levellist[| n])) {
			my_map = other.levellist[| n]
			lvl_name = my_map[? "level_name"]
			creator_name = my_map[? "creator_name"]
			content = my_map[? "content"]
		}
	}
}

}