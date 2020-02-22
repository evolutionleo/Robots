var varname = string(argument0)
var obj = argument1
///@arg variable_name
///@arg object

var max_ = -9999999
with(obj) {
	var val = variable_instance_get(id,varname)
	if(val > max_)
		max_ = val
}

return max_