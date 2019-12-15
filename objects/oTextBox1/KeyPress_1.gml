/// @description  Process text box

Text = keyboard_string;

//if(keyboard_check(vk_escape)) {
//	Text = "PlayerName"
//	keyboard_string = Text
//}


show_debug_message(string(string_width(Text)))
//+string(sprite_width * image_xscale))
while(string_width(Text) > 350) {
	//show_debug_message(string(string_width(Text))+string(sprite_width * image_xscale))
	var len = string_length(Text)
	Text = string_delete(Text,len,1)
	keyboard_string = Text
}
//show_debug_message(string(string_width(Text))+string(sprite_width * image_xscale))
global.Player_name = Text