/// @description 
#region Draw segments
if(state == splayer.ysticked) {
	var xx = x
	var yy = y + 15
	for(var i = 0; i < round((sticky - y) / 2) ; i++) {
		draw_sprite(sVbot_Segment,0,xx,yy)
		yy += 2
		//var rot = 0
		//var ys = (sticky - yy) > 2 ? 1 : 2 / (sticky - yy)
		
	}
	//var rot = 0
	//var ys = (sticky - y) / 2
	//draw_sprite_ext(sVbot_Segment,0,xx,yy,1,ys,rot,c_white,1.0)
	//draw_sprite_stretched(sVbot_Segment,0,xx,yy,3,ys)
	//draw_sprite_ext(sVbot_legs,0,xx,yy,1,1,0,c_white,1.0)
	draw_sprite_pos(sVbot_Segment,0,x-1,y,x+1,y,x-1,sticky,x+1,sticky,1.0)
}
#endregion
#region Draw self
draw_self()
#endregion
#region Draw triangle
if(!instance_exists(oSwitch) or instance_find(oHbot,oSwitch.current) == self)
draw_sprite(sArrow,0,x-10,y - 100)
#endregion
#region Draw error message
if(alarm[1] > 0) {
	draw_set_font(fErr)
	draw_set_color(c_yellow)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_center)
	draw_text(x,y-200,"Not enough space!")
}
#endregion