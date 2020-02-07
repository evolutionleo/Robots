///@arg map
///@arg in_console*
var map = argument0

if(argument_count > 1)
	var onscreen = !argument[1]
else
	onscreen = false

var json = json_encode(map)
json = json_optimize(json)

if(onscreen)
	show_message(json)
else
	show_debug_message(json)