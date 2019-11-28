if(place_meeting(x+hsp,y,oPushable) or place_meeting(x,y-1,oPushable)) {
	var list = ds_list_create()
	//var list1 = ds_list_create()
	var count = instance_place_list(x+hsp,y,oPushable,list,false) 
	//+ instance_place_list(x,y-1,oPushable,list1,false)
	//ds_list_add_list(list,list1)
	for(var i = 0; i < count; i++) {
		with(list[| i]) {
			if(variable_instance_exists(id,"add_hsp")) {
				add_hsp = other.hsp * push_value
			}
			else {
				hsp += other.hsp * push_value
			}
			
			other.hsp = sign(other.hsp)
			//if(place_meeting(x+hsp,y,oPushable) and (hsp != 0)) {
			//	pushx()
			//}
		}
	}
	ds_list_destroy(list)
}