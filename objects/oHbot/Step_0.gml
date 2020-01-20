/// @description 
#region Input
if(!instance_exists(oSwitch) or instance_find(oHbot,oSwitch.current) == self) {
//kjump = keyboard_check_pressed(vk_space)
//kup = keyboard_check(ord("W"))
//kleft = keyboard_check(ord("A"))
//kdown = keyboard_check(ord("S"))
//kright = keyboard_check(ord("D"))
//kabil = keyboard_check_pressed(ord("E"))		//Ability key
//kinter = keyboard_check_pressed(ord("F"))		//Interact key



kjump = keyboard_check_pressed(oInput.binds[? "jump"])
kup = keyboard_check(oInput.binds[? "up"])
kright = keyboard_check(oInput.binds[? "right"])
kleft = keyboard_check(oInput.binds[? "left"])
kdown = keyboard_check(oInput.binds[? "down"])
kabil = keyboard_check_pressed(oInput.binds[? "abil"])		//Ability key
kinter = keyboard_check_pressed(oInput.binds[? "inter"])	//Interact key

//kbox = keyboard_check_released(ord("Q")) //Interact with a box
//kterm = keyboard_check_pressed(ord("R"))
}
else {
kjump = false
kup = false
kleft = false
kdown = false
kright = false
kabil = false
kinter = false
//kbox = false
//kterm = false
}
#endregion
#region Calculate movement
move = kright - kleft


if(place_meeting(x,y+1,oWall)) {
	multiplier = 0.95
	sp = walksp
}
else {
	multiplier = 0.95
	sp = flysp
}


if(abs(add_hsp) > 1) {
	add_hsp *= multiplier
}
else {
	add_hsp = 0
}

hsp = add_hsp


if(abs(vsp) > max_vsp)
	vsp *= 0.9
	
#endregion
#region //Lift
//if(robtype == rob.lift and my_lift == -1) {
//	my_lift = instance_create_layer(x+sign(image_xscale),y,"Player",oLift)
//	//my_lift.offsetx = my_lift.x - x
//	my_lift.offsety = my_lift.y - y + 20
//}
//#region Move boxes with lift
//else if(robtype == rob.lift)
//{
//	with(my_lift)
//	{
//		image_xscale = other.image_xscale
//		image_yscale = other.image_yscale
//		offsetx = sign(other.image_xscale) * 25
//		//x = other.x + offsetx
//		//y = other.y + offsety
//		//hsp = x - (other.x+offsetx)
//		//vsp = y - (other.y+offsety)
//		hsp = (other.x+offsetx) - x
//		vsp = (other.y+offsety) - y
		
//		//if(place_meeting(x+hsp,y,oBox))
//		//{
//		//	var boxlist = ds_list_create()
//		//	var count = instance_place_list(x,y+vsp,oBox,boxlist,false)
//		//	for(var i = 0; i < count; i++)
//		//	{
//		//		with(boxlist[| i])
//		//		{
//		//			vsp = other.vsp
//		//			collision_without_add(oWall)
//		//		}
//		//		//while(!place_meeting(x,y+sign(vsp),oBox) and !place_meeting(x,y+sign(vsp),oWall))
//		//		//	y += sign(vsp)
//		//	}
//		//}
//		x += hsp
//		y += vsp
//	}
//}
//#endregion
//else if(robtype != rob.lift and my_lift != -1) {
//	instance_destroy(my_lift)
//	my_lift = -1
//}
#endregion
#region State machine
switch(state) {
	case splayer.move: #region Move state
		if(sprite_index != spr + 1) {
			sprite_index = spr + 1
		}
		
		if(sign(image_xscale) == move) {
			base_hsp = move * sp
		}
		else if(move == 0) {
			base_hsp = 0
			state = splayer.stand
		}
		else {
			image_xscale = abs(image_xscale) * move
			while(place_meeting(x,y,oWall))
				x -= sign(image_xscale)
		}
		
		
		hsp += base_hsp
		
		if(place_meeting(x,y+1,oWall) and !place_meeting(x,y+1,oSlime_wall)) {
			if(kjump)
				vsp -= jumpsp
		}
		else {
			vsp += grv
			if(kdown)
				vsp += dspeed
		}
		
		if(kabil) {
			stickx = x
			//+ sign(image_xscale) * 20
			sticky = y
			if(robtype == rob.xstick) {
				if(place_meeting(x+sign(image_xscale),y,oWall) and !place_meeting(x+sign(image_xscale),y,oSlime_wall)) {
					state = splayer.xsticked
					if(image_xscale > 0)
						stickx = bbox_right + 1
					else stickx = bbox_left - 1
					sticky = y
				}
				else {
					alarm[1] = 120
				}
			}
			else if(robtype == rob.ystick) {
				if(can_transform()) {
					state = splayer.transformating
					stickx = x
					sticky = bbox_bottom+1
				}
			}
			else if(robtype == rob.hacker and place_meeting(x,y,oTerminal)) {
				state = splayer.hacking
				alarm[0] = 120
			}
			//else if(robtype == rob.lift) {
			//	state = splayer.lift
			//}
			//else if(robtype == rob.gravity) {
			//	state = splayer.gravity_cancel
			//}
		}
		//else if(kterm) {
		//	state = splayer.terminal
		//}
		//else if(move == 0)
		//	state = splayer.stand
		
		//if(kbox) {
		//	if(my_box == -1 and place_meeting(x+sign(image_xscale),y,oBox)) {
		//		my_box = instance_place(x+sign(image_xscale),y,oBox)
		//	}
		//	else if(my_box != -1) {
		//		my_box = -1
		//	}
		//}
		//if(!place_meeting(x+1,y,oBox) and !place_meeting(x-1,y,oBox)) {
		//	my_box = -1
		//}
		
		break
		#endregion
	case splayer.xsticked: #region x-Sticked state
		if(sprite_index != spr + 2) {
			sprite_index = spr + 2
		}
		base_hsp = move * sticksp
		hsp += base_hsp
		vsp = 0
		if(kabil) {
		//or (!position_meeting(stickx,sticky,oWall))) {
			state = splayer.stand
		}
		
		//if(my_bridge == -1)
		//	my_bridge = instance_create_layer(x+20*sign(image_xscale),y,"Player",oHand)
		break;
		#endregion
	case splayer.ysticked: #region y-Sticked state
		if(sprite_index != sVbot_transformated)
			sprite_index = sVbot_transformated
		hsp = 0
		movey = kdown - kup
		vsp = movey * sticksp
		if(kabil) or !meeting() or place_meeting(x,y,oWall)
		//or place_meeting(x,y,oHbot))
		{
			state = splayer.back_transformating
		}
		break
	#endregion
	case splayer.stand: #region Stand state
		if(object_index != oVbot) {
			if(sign(image_xscale) == move) {
				base_hsp = move * sp
			}
			else if(move == 0) {
				base_hsp = 0
			}
			else {
				image_xscale = abs(image_xscale) * move
				while(place_meeting(x,y,oWall))
					x -= sign(image_xscale)
			}
		}
		else {
			base_hsp = 0
		}
		
		hsp += base_hsp
		
		if(kabil) {
			stickx = x
			//+ sign(image_xscale) * 20
			sticky = y
			if(robtype == rob.xstick) {
				if(place_meeting(x+sign(image_xscale),y,oWall) and !place_meeting(x+sign(image_xscale),y,oSlime_wall)) {
					state = splayer.xsticked
					if(image_xscale > 0)
						stickx = bbox_right + 1
					else
						stickx = bbox_left - 1
					sticky = y
				}
				else {
					alarm[1] = 120
				}
			}
			else if(robtype == rob.ystick) {
				if(can_transform()) {
					state = splayer.transformating
					stickx = x
					sticky = bbox_bottom+1
				}
			}
			else if(robtype == rob.hacker and place_meeting(x,y,oTerminal)) {
				state = splayer.hacking
				alarm[0] = 120
			}
			//else if(robtype == rob.lift) {
			//	state = splayer.lift
			//}
			//else if(robtype == rob.gravity) {
			//	state = splayer.gravity_cancel
			//}
		}
		if(kjump and place_meeting(x,y+1,oWall) and !place_meeting(x,y+1,oSlime_wall))
			vsp -= jumpsp
		
		if(sprite_index != spr) {
			sprite_index = spr
		}
		if(move != 0 and place_meeting(x,y+1,oWall)) {
			state = splayer.move
		}
		vsp += grv
		if(kdown)
			vsp += dspeed
			
		break
	#endregion
	case splayer.sleep: #region Sleep state... Do nothing!
		//vsp = 0
		//hsp = 0
		vsp += grv
		break
	#endregion
	case splayer.transformating: #region Transform state
		if(sprite_index != sVbot_transformation)
			sprite_index = sVbot_transformation
		vsp = 0
		hsp = 0
		break
		
	#endregion
	case splayer.back_transformating: #region Transformating back state
		if(sprite_index != sVbot_back_transofrmation)
			sprite_index = sVbot_back_transofrmation
		vsp = 0
		hsp = 0
		break
	#endregion
	case splayer.hacking: #region Hacking state
		if(!place_meeting(x,y,oTerminal) or kabil or instance_place(x,y,oTerminal).hacked == false) {
			state = splayer.move
		}
		break
	#endregion
	//case splayer.lift: 
	#region //Lift state
		//movey = kdown - kup
		//my_lift.offsety += movey * liftsp
		//vsp = 0
		//hsp = 0
		//if(kabil) {
		//	state = splayer.move
		//}
		//break
	#endregion
	//case splayer.terminal: 
	#region //Terminal state
		//if(kterm) {
		//	if(robtype == rob.hook) {
		//		robtype = rob.none
		//		state = splayer.move
		//	}	
		//	else {
		//		robtype++
		//		state = splayer.move
		//	}
		//}
	#endregion
	//case splayer.gravity_cancel: 
	#region //G-cancel state
	//if(vsp == 0 and hsp == 0 or kabil) {
	//	state = splayer.move
	//}
	#endregion
}
#endregion
#region Killbox and flash
if(place_meeting(x,y,oKillbox)) {
	create_effect("flash",c_red)
	
	room_restart()
}
#endregion