/// @description Hack the system!
var term = instance_place(x,y,oTerminal)
with(term) {
	hacked = !hacked
	with(oActivateable)
	{
		//if(group == abs(other.group))
		//{
			if(group == other.group)
			{
				hacked = other.hacked
			}
			else if(group == -other.group)
			{
				hacked = !other.hacked
			}
			
			if(object_index == oDoor)
			{
				if(hacked)
				{
					if(sprite_index != sDoor_opening and sprite_index != sDoor_opened)
					{
						sprite_index = sDoor_opening
					}
					
				}
				else if(sprite_index != sDoor_closing and sprite_index != sDoor_closed)
				{
					sprite_index = sDoor_closing
				}
				
			}
		//}
	}
	with(oTerminal) {
		if(group == other.group)
			hacked = other.hacked
		else if(group == -other.group)
			hacked = !other.hacked
	}
}
state = splayer.move