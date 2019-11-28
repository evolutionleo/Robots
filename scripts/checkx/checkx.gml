with(oWall) {
	if(place_meeting(x+hsp-other.hsp,y,other) and other.hsp != 0)
	{
		with(other)
		{
			//while(!place_meeting(x+sign(hsp)-sign(other.hsp),y,other))
			while(!place_meeting(x+sign(hsp),y,other))
			{
				x += sign(hsp)
				//other.x += sign(other.hsp)
				//if(sign(hsp)-sign(other.hsp) == 0)
				//	break;
			}
			//if(other.object_index == oPushable)
			//{
			//	add_hsp += other.hsp * push_value
			//	other.add_hsp += hsp * other.push_value
			//}
			//else
			//{
				hsp = 0
			//}
		}
	}
}