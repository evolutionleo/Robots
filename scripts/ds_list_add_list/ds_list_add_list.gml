var list1 = argument0
var list2 = argument1
//var count1 = ds_list_size(list1)
var count2 = ds_list_size(list2)
for(var i = 0; i < count2; i++) {
	ds_list_add(list1,list2[| i])
}

return list1