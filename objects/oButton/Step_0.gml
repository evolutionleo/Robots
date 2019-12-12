/// @desc

hacked = place_meeting(x,y+1,oWall)

image_index = hacked

with(oActivateable and oTerminal) {
	if(group == other.group) {
		hacked = other.hacked
	}
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

// Inherit the parent event
event_inherited();
