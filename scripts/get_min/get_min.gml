var varname = string(argument0)
var obj = argument1
///@arg variable_name
///@arg object

var min_ = 9999999
with(obj) {
	var val = variable_instance_get(id,varname)
	if(val < min_)
		min_ = val
}

return min_