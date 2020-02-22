/// @desc

//sprite_set_offset(sprite_index,sprite_width / 2,sprite_height / 2)

if(ds_list_find_index(oEditor.selected_object,self) != -1)
and (y > 730 or y < 0 or x > 0 or x > room_width - 256) {
	if(keyboard_check(vk_shift)) {
		step = 4
	}
	else if(keyboard_check(vk_control)) {
		step = 0
	}
	else {
		step = 64
	}
	if(keyboard_check_pressed(ord("W"))) {
		y -= step
	}
	if(keyboard_check_pressed(ord("A"))) {
		x -= step
	}
	if(keyboard_check_pressed(ord("S"))) {
		y += step
	}
	if(keyboard_check_pressed(ord("D"))) {
		if(keyboard_check(vk_control))
			instance_copy(true)
		
		x += step
	}
}