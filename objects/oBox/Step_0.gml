/// @description 

#region Passive movement
vsp += grv
hsp *= 0.6
if(abs(hsp) < 1)
	hsp = 0
//if(place_meeting(x,y,oLift) and vsp > 0)
//	vsp = 0
if(place_meeting(x,y+1,oLift)) {
	var lift = instance_place(x,y+1,oLift)
	var check = lift.y-lift.vsp
	//+ (vsp > -1 ? vsp : 0) 
	if(check > y) {
		vsp = lift.vsp
		hsp = lift.hsp
	}
}

collision(oWall)
#endregion