/// @desc
if(place_meeting(x,y,oHbot)) {
	if(sprite_index == SPortal_Deactivated)
		sprite_index = SPortal_Animation
	else if(active and keyboard_check_pressed(oInput.binds[? "inter"])) {
		room_goto(rLevel_select)
	}
}