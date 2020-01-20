var list = argument0
var check = argument1

if(in_list(list, check))
	return -1
else
	ds_list_add(list, check)
return 0