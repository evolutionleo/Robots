with(oWall) {
	if(place_meeting(x,y+vsp-other.vsp,other) and other.vsp != 0) {
		with(other) {
			//while(!place_meeting(x,y+sign(vsp)-sign(other.vsp),other)) {
			while(!place_meeting(x,y+sign(vsp),other)) {
				y += sign(vsp)
				//other.y += sign(other.vsp)
				//if(sign(vsp)-sign(other.vsp) == 0)
				//	break;
			}
			//if(other.object_index == oPushable)
			//{
			//	vsp += other.vsp * push_value
			//	other.vsp += vsp * other.push_value
			//}
			//else
			//{
				vsp = 0
			//}
		}
	}
}