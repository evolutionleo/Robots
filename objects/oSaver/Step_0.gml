/// @desc
if(place_meeting(x,y,oHbot)) {
	if(sprite_index == SPortal_Deactivated)
		sprite_index = SPortal_Animation
	else if(active and instance_place(x,y,oHbot).kinter) {
		room_goto(rLevel_select)
	}
}