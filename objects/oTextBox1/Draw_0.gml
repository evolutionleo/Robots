/// @description  Draw the text box and "caption"
draw_self();

draw_set_font(f0)
draw_set_color(c_ltgray);
draw_set_valign(fa_middle)
draw_set_halign(fa_right)
//draw_text(x-5,y,"Nickname (for leaderboard):")


//draw_set_halign(fa_left);
draw_set_color(c_black)
draw_set_font(fName);
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_text(x+5,y+1,string_hash_to_newline(Text))
