/// @desc
ini_open("save.ini")
if(type == "player_name")
	ini_write_string("Player name","Player name",global.Player_name)
else if(type == "password")
	ini_write_string("Player name","Password",global.password)
ini_close()