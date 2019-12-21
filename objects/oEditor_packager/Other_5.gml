/// @desc

if(room >= r1) {


if(file_exists("File.txt"))
	file_delete("File.txt")

var root_list = ds_list_create()

var map = ds_map_create()

#region Camera code
//var camera_map = ds_map_create()

//var camera_x = camera_get_view_x(view_camera[0])
//var camera_y = camera_get_view_y(view_camera[0])

//var camera_wid = camera_get_view_width(view_camera[0])
//var camera_hei = camera_get_view_height(view_camera[0])
//var camera_wid = room_width
//var camera_hei = room_height

//ds_map_add(camera_map,"cx",camera_x)
//ds_map_add(camera_map,"cy",camera_y)
//ds_map_add(camera_map,"cw",camera_wid)
//ds_map_add(camera_map,"ch",camera_hei)

////ds_map_add_map(map,"CAM",camera_map)

//ds_list_add(root_list,camera_map)
//ds_list_mark_as_map(root_list,ds_list_size(root_list)-1)
#endregion
#region Stupid code
with(oEditor_instrument) {
	if(variable_instance_exists(id,"saveme") and saveme) {
		
	var my_map = ds_map_create()
	ds_list_add(root_list,my_map)
	ds_list_mark_as_map(root_list,ds_list_size(root_list)-1)
	
	ds_map_add(my_map,"o",(obj))
	ds_map_add(my_map,"x",int64(x))
	ds_map_add(my_map,"y",int64(y))
	ds_map_add(my_map,"xs",image_xscale)
	ds_map_add(my_map,"ys",image_yscale)
	//ds_map_add(my_map,"l",layer_get_name(layer))
	if(obj == oWall) {
		ds_map_add(my_map,"hs",int64(hsp))
		ds_map_add(my_map,"vs",int64(vsp))
	}
	if(variable_instance_exists(id,"active")) {
		ds_map_add(my_map,"a",(active))
	}
	if(variable_instance_exists(id,"group")) {
		ds_map_add(my_map,"g",(group))
	}
	if(obj == oSwitch) {
		//ds_map_add(my_map,"cu", current)
		ds_map_add(my_map,"ma", (max_))
	}
	
	
	//ds_map_add_map(map,id,my_map)
	}
}



#endregion
#region Maps, lists, lists, maps and nothing else
ds_map_add_list(map,"ROOT",root_list)
var json = json_encode(map)
StringToFile("File.txt",json)

//ds_map_destroy(map)
//ds_list_destroy(root_list)
#endregion
}