/// @description 
if(place_meeting(x,y,oHbot)) {
	room_restart()
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