/// @desc
#region Create needed layers
if(!layer_exists("Player")) {
	layer_create(-400,"Player")
	layer_create(-300,"Instances")
	layer_create(-200,"Back")
	layer_create(-100,"Wall")
}
#endregion
#region Scan the data
var map = ds_map_create()

if(variable_global_exists("content")) {
	list = global.content
	//show_message(list)
}
else {
	map = LoadJSONfromFile("File.txt")
	
	list = ds_list_create()
	list = map[? "ROOT"]
}
#endregion
#region Camera stuff
////var camera_map = map[? "CAM"]
//var camera_map = list[| 0]

//var camera_x = camera_map[? "cx"]
//var camera_y = camera_map[? "cy"]
//var camera_wid = camera_map[? "cw"]
//var camera_hei = camera_map[? "ch"]

//camera_set_view_pos(view_camera[0],camera_x,camera_y)
//camera_set_view_size(view_camera[0],camera_wid,camera_hei)
#endregion
#region Create the instances
for(var i = 0; i < ds_list_size(list); i++)
{
	var cur_map = list[| i]
	//StringToFile("Debug.txt",cur_map)
	
	var obj = cur_map[? "o"]		//object index
	var speed_needed = obj == oWall
	var active_group_needed = obj == oActivateable or obj == oTerminal or obj == oSaver
	var is_switch = obj == oSwitch
	var xx = cur_map[? "x"]			//x
	var yy = cur_map[? "y"]			//y
	var xs = cur_map[? "xs"]		//xscale
	var ys = cur_map[? "ys"]		//yscale
	if(speed_needed)
	{
		var hs = cur_map[? "hs"]	//hspeed
		var vs = cur_map[? "vs"]	//vspeed
	}
	if(active_group_needed)
	{
		var act = cur_map[? "a"]	//active
		var _group = cur_map[? "g"]	//group
	}
	if(is_switch)
	{
		//var curr = cur_map[? "cur"]
		var _max = cur_map[? "ma"]
	}
#endregion
	#region Find layer
	//var lay = cur_map[? "l"]		//layer
	var lay = layer_get_id("Instances")
	var dep = 0
	switch(obj) {
		case oHbot:
			lay = "Player"
			//lay = 0
			dep = -400
			break
		case oVbot:
			lay = "Player"
			//lay = 0
			dep = -400
			break
		case oBot:
			lay = "Player"
			//lay = 0
			dep = -400
			break
		case oSaver:
			lay = "Instances"
			//lay = 1
			dep = -300
			break
		case oDoor:
			lay = "Instances"
			//lay = 1
			dep = -300
			break
		//case oPlatform:
		//	lay = "Instances"
		//	//lay = 1
		//	dep = -300
		//	break
		case oTerminal:
			//lay = 2
			dep = -200
			lay = "Back"
			break
		case oWall:
			lay = "Wall"
			//lay = 3
			dep = -100
			break
		case oSlime_wall:
			lay = "Wall"
			//lay = 3
			dep = -100
			break
		case oKillbox:
			lay = "Wall"
			//lay = 3
			dep = -100
			break
	}
	#endregion
	#region Create the instance
	var inst = instance_create_layer(xx,yy,lay,obj)
	//var inst = instance_create_depth(xx,yy,dep,obj)
	with(inst)
	{
		image_xscale = xs
		image_yscale = ys
		if(speed_needed)
		{
			hsp = hs
			vsp = vs
		}
		if(active_group_needed)
		{
			active = act
			group = _group
		}
		if(is_switch)
		{
			//current = curr
			current = 0;
			max_ = _max
		}
	}
	oSwitch.max_ = instance_number(oHbot)
	//key = ds_map_find_next(map,key)
	#endregion
	#region //Draw the tiles

	#endregion
	#region Cleanup
	//ds_map_destroy(cur_map)
}
	#endregion
#region Cleanup 2
//ds_list_destroy(list)
//ds_map_destroy(map)
#endregion
