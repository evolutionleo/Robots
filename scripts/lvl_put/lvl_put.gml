///@arg content

var content = argument0 // Ds_list
global.description = ""
if(!variable_global_exists("Level_name"))
	global.Level_name = "Level by "+global.Player_name

var prepared_map = ds_map_create()
ds_map_add_list(prepared_map,"ROOT",content)

var json = json_encode(prepared_map)
content = json_optimize(json)

return http_post_string("http://62.113.112.109/robots.php?security="+global.security,"action=lvl_put&level_name="+global.Level_name+"&creator_name="+global.Player_name+"&content="+content+"&description="+global.description)

ds_map_destroy(prepared_map)