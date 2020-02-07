var obj = argument0
#region Y collision
//var coly = colly(vsp,obj)
pushy()
var coly = place_meeting(x,y+vsp,obj)
if(coly)
{
	while(!place_meeting(x,y+sign(vsp),obj))
	{
		y += sign(vsp)
		if(vsp == 0)
			break
	}
	vsp = 0
}
//else{
y += vsp
//}
#endregion
#region //Box interaction 1
//if(place_meeting(x+hsp,y,oBox)) {
//	var boxlist = ds_list_create()
//	var count = instance_place_list(x+hsp,y+vsp,oBox,boxlist,false)
//	for(var i = 0; i < count; i++)
//	{
//		with(boxlist[| i])
//		{
//			hsp = other.hsp
//			collision_without_add(oWall)
			
//			//y -= vsp
//			//if(place_meeting(x+hsp,y,oWall)) {
//			//	while(!place_meeting(x+sign(hsp),y,oWall))
//			//		x += sign(hsp)
//			//	hsp = 0
//			//}
//			//x += hsp
//		}
//		while(!place_meeting(x+sign(hsp),y,oBox) and !place_meeting(x+sign(hsp),y,obj))
//			x += sign(hsp)
//	}
//}
#endregion
#region X collision
//var colx = collx(hsp,obj)
pushx()

var colx = place_meeting(x+hsp,y,obj)
if(colx)
{
	if(object_index == oHbot and !place_meeting(x+hsp,y-10,obj) and vsp <= 0) {
		while(place_meeting(x+hsp,y,obj)) {
			y--
		}
	}
	else {
	while(!place_meeting(x+sign(hsp),y,obj))
		{
			x += sign(hsp)
			if(hsp == 0)
				break
		}
		hsp = 0
	}
	
	
}


//else{
x += hsp
//}
#endregion
#region //Box interaction 2
//if(variable_instance_exists(self,"my_box") and my_box != -1) {
//	with(my_box) {
//		//hsp = other.hsp
		////if(place_meeting(x+hsp,y,oWall)) {
		////	while(!place_meeting(x+sign(hsp),y,oWall))
		////		x += sign(hsp)
		////	hsp = 0
		////}
		////x += hsp
//		x += other.x - other.xprevious
		
//	}
//}
#endregion
#region //Push the player

//var list = ds_list_create()
//var hits = instance_place_list(x,y,oRobot,list,false)
//if(hits > 0)
//{
//	with(list)
//	{
//		if(hsp != 0 and vsp != 0) {
//			while(place_meeting(x,y,other))
//			{
//				x += sign(other.hsp)
//				y += sign(other.vsp)
//			}
//		}
//	}
//}
#endregion
#region //Box interaction 3 + player

#endregion
#region Transformation issue
if(place_meeting(x,y,oVbot)) {
	var col = instance_place(x,y,oVbot)
	//while(!place_meeting(x,y,col)) {
		
	//}
	col.state = splayer.stand
}



//if(place_meeting(x,y,oWall)) {
//	var wall = instance_place(x,y,oWall)
//	while(place_meeting(x,y,wall))
//		y--
//}
#endregion