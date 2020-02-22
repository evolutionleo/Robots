/// @desc
global.security = "xd{\zXWA-Vj5RNt*5Z[y9w5@h'0pq"
//levellist = ds_list_create()
filelist = ds_list_create()

var json = LoadJSONfromFile("Levellist.txt")
show_message(json)
if(is_undefined(json))
	exit

var list = ds_list_create()
var map = ds_map_create()
map = json_decode(json)
list = map[? "default"]

if(!is_undefined(list)) {
	for(var i = 0; i < ds_list_size(list); i++) {
		ds_list_add(filelist,list[| i])
	}
}