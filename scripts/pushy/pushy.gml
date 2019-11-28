if(place_meeting(x,y+vsp,oPushable) and vsp < 0) {
	var list = ds_list_create()
	var count = instance_place_list(x,y+vsp,oPushable,list,false)
	for(var i = 0; i < count; i++) {
		with(list [| i]) {
			vsp = other.vsp * push_value
			//if(place_meeting(x,y+vsp,oPushable) and vsp != 0)
			//	pushy()
				
			other.vsp = sign(other.vsp)
		}
	}
	ds_list_destroy(list)
}