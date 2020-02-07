/// @description  Draw the text box and "caption"
draw_self();

if(type == "player_name") {
	var txt = Text
}
else if(type == "password") {
	var txt = string_length(Text) * "*"
}

//draw_set_font(f0)
//draw_set_color(c_ltgray);
//draw_set_valign(fa_middle)
//draw_set_halign(fa_right)
//if(type == "player_name")
//	draw_text_transformed(x-5,y,"Username:",image_yscale/1.5,image_yscale/1.5,image_angle)
//else if(type == "password")
//	draw_text_transformed(x-5,y,"Password:",image_yscale/1.5,image_yscale/1.5,image_angle)


//draw_set_halign(fa_left);
draw_set_color(c_black)
draw_set_font(fName);
draw_set_valign(fa_top)
draw_set_halign(fa_left)
//draw_text(x+5,y+1,string(txt))
var scale = image_yscale/1.5
draw_text_transformed(x+5*scale,y+1*scale,txt,scale,scale,image_angle)