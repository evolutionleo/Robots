/// @description 

event_inherited();

if(alarm[0] > 0) {
	var xx = sprite_width / 2 * image_xscale
	var yy = sprite_height / 2 * image_yscale

	draw_healthbar(x-xx,y-yy-10,x+xx,y-yy-3,(120-alarm[1])/120*100,c_black,c_yellow,c_yellow,0,false,false)
}
