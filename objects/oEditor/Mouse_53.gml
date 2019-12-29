/// @desc
if(mouse_y < 730 and mouse_y > 0 and mouse_x > 0 and mouse_x < room_width - 256) {
	if(instrument == "place")
	{
		var obj = arg
		var lay = "Instances"
		#region Switch object/Select layer
		switch(obj)
		{
			case oHbot:
				lay = "Player"
				break
			case oVbot:
				lay = "Player"
				break
			case oBot:
				lay = "Player"
				break
			case oTerminal:
				lay = "Back"
				break
			case oBox:
				lay = "Walls"
				break
			case oDoor:
				lay = "Instances"
				break
			case oSlime_wall:
				lay = "Walls"
				break
			case oSaver:
				lay = "Back"
				break
			case oWall:
				lay = "Walls"
				break
		}
		#endregion
		var xx = (mouse_x div 64) * 64
		var yy = (mouse_y div 64) * 64
		var o = instance_create_layer(xx,yy,lay,oEditor_object)
		o.spr = spr
		o.sprite_index = spr
		o.obj = obj
		with(o) {
			if(place_meeting(x,y,oEditor_object))
				instance_destroy()
		}
	}
	if(!keyboard_check(vk_control)) {
		ds_list_clear(selected_object)
	}
}
