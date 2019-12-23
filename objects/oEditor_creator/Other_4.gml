/// @desc
#region The whole script
if(file_exists("File.txt")) {
#region Create needed layers
layer_create(-400,"Player")
layer_create(-300,"Instances")
layer_create(-200,"Back")
layer_create(-100,"Wall")
#endregion
#region Scan the data

var map = LoadJSONfromFile("File.txt")
var list = ds_list_create()
list = map[? "ROOT"]
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
for(var i = 0; i < ds_list_size(list); i++) {
	var cur_map = list[| i]
	//StringToFile("Debug.txt",cur_map)
	
	var obj = cur_map[? "o"]		//object index
	var spr = cur_map[? "s"]		//sprite index
	//var speed_needed = obj == oWall
	var speed_needed = false
	var active_group_needed = obj == oActivateable or obj == oTerminal or obj == oSaver
	var is_switch = obj == oSwitch
	var xx = cur_map[? "x"]			//x
	var yy = cur_map[? "y"]			//y
	var xs = cur_map[? "xs"]		//xscale
	var ys = cur_map[? "ys"]		//yscale
	if(speed_needed) {
		var hs = cur_map[? "hs"]	//hspeed
		var vs = cur_map[? "vs"]	//vspeed
	}
	if(active_group_needed) {
		var act = cur_map[? "a"]	//active
		var _group = cur_map[? "g"]	//group
	}
	if(is_switch) {
		//var curr = cur_map[? "cur"]
		var _max = cur_map[? "ma"]
	}
#endregion

	#region Find layer
	//var lay = cur_map[? "l"]		//layer
	var lay = 0
	var dep = 0
	switch(obj) {
		case oHbot:
			lay = "Player"
			//lay = 0
			dep = -400
			break
		case oSaver:
			lay = "Instances"
			//lay = 1
			dep = -300
			break
		case oActivateable:
			lay = "Instances"
			//lay = 1
			dep = -300
			break
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
	}
	#endregion
	#region Create the instance
	var inst = instance_create_layer(xx,yy,lay,oEditor_object)
	with(inst) {
		id.obj = obj
		
		//show_message("OBJECT "+string(id)+": "+string(obj))
		
		id.spr = spr
		id.sprite_index = spr
		image_xscale = xs
		image_yscale = ys
		if(speed_needed) {
			hsp = hs
			vsp = vs
		}
		if(active_group_needed) {
			active = act
			group = _group
		}
		if(is_switch) {
			//current = curr
			current = 0;
			max_ = _max
		}
	}
	//key = ds_map_find_next(map,key)
	#endregion
}
#endregion
#region //Draw the tiles

#endregion
}
#endregion