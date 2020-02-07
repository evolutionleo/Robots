///@arg list
///@arg in_console*
var list = argument0
if(argument_count > 1)
	var onscreen = !argument[1]
else
	onscreen = false
	

var str = "["
str += list[| 0]

for(var i = 1; i < ds_list_size(list); i++) {
	str += ", " + list[| i]
}

str += "]"

if(onscreen)
	show_message(str)
else
	show_debug_message(str)