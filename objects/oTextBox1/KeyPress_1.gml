/// @description  Process text box

if(active) {
	Text = keyboard_string;
	
	Text = string_lettersdigits(Text)
	
	show_debug_message(string(string_width(Text)))
	//+string(sprite_width * image_xscale))
	while(string_width(Text) > 350) {
		var len = string_length(Text)
		Text = string_delete(Text,len,1)
		keyboard_string = Text
	}
	if(type == "player_name")
		global.Player_name = Text
	else if(type == "password")
		global.password = Text
	else if(type == "level_name")
		global.Level_name = Text
	else if(type == "search")
		global.search = Text

}