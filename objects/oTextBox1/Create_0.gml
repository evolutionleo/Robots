/// @desc VERY simple text box....
ini_open("save.ini")
if(type == "player_name") {
	Text = ini_read_string("Player name","Player name","PlayerName")
	global.Player_name = Text
}
else if(type == "password"){
	Text = ini_read_string("Player name","Player name","Password")
	global.password = Text
}
ini_close()


if(instance_number(object_index) == 1)
	keyboard_string = Text

active = false