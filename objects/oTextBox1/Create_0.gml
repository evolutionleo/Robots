  /// @description  VERY simple text box....
ini_open("save.ini")
Text = ini_read_string("Player name","Player name","PlayerName")
ini_close()
keyboard_string = Text
global.Player_name = Text