/// @description 

event_inherited();

if(alarm[0] > 0) {
	var xx = sprite_width  * image_xscale / 2
	var yy = sprite_height * image_yscale / 2

	draw_healthbar(x-xx-10,y-yy-30,x+xx+10,y-yy-15,(120-alarm[0])/120*100,c_black,c_yellow,c_yellow,0,false,false)
}
