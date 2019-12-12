/// @description 
#region Setup the shader
//shader_set(shOutline)
//shader_set_uniform_f(upixelW,texelW)
//shader_set_uniform_f(upixelH,texelH)
#endregion
#region Draw text
//if(state == splayer.sticked) {
//	//draw_line_width_color(x,y,stickx,sticky,4,c_lime,c_lime)
//}
//if(state == splayer.terminal) {
//	draw_set_halign(fa_center)
//	draw_set_valign(fa_bottom)
//	draw_text(x,y-128,"Type: "+string(robtype))
//}
#endregion
#region Draw self and hands
if(state == splayer.xsticked) {
	//var hand_spr = image_xscale < 0 ? sHbot_handl : sHbot_handr
	
	for(var i = 0; i < abs(x - stickx) / 5; i++) {
		draw_sprite_ext(sHbot_segment,0,x + sign(stickx - x) * 5 * i, y - 2 * image_yscale, image_xscale, image_yscale, 0, c_white, 1.0)
	}
	draw_self()
	//draw_sprite(hand_spr, 0, stickx, y - 10)
}
else {
	draw_self()
}
#endregion
#region End

//shader_reset()
#endregion
#region Draw triangle
if(!instance_exists(oSwitch) or instance_find(oHbot,oSwitch.current) == self)
	draw_sprite(sArrow,0,x,y - 80)
#endregion
#region Error message
if(alarm[1] > 0) {
	draw_set_font(fErr)
	draw_set_color(c_yellow)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_center)
	draw_text(x,y-200,"Unable to stick!")
}
#endregion