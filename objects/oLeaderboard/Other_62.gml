/// @desc
if(async_load[? "status"] == 0) {
	var json = async_load[? "result"]
	//show_message(json)
	var list = ds_list_create()
	var map = ds_map_create()
	map = json_decode(json)
	list = map[? "default"]

	if(!is_undefined(list)) {
		for(var i = 0; i < ds_list_size(list); i++) {
			leadmap[? i] = list[| i]
		}
	}
}