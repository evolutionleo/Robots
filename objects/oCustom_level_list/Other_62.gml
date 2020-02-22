/// @desc
var json = async_load[? "result"]
//show_message(json)

if(is_undefined(json))
	exit

var map = json_decode(json)

var list = map[? "default"]

if !is_real(list)
	exit

ds_list_clear(levellist)

if(!is_undefined(list)) {
	for(var i = 0; i < ds_list_size(list); i++) {
		ds_list_add(levellist,list[| i])
		ds_list_mark_as_map(levellist,ds_list_size(levellist)-1)
	}
	with(oText_marker) {
		update_textmarker()
	}
	with(oInterface_button) {
		update_button(type)
	}
}