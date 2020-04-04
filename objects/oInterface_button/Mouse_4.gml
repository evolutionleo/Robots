/// @desc

if active
{
	if(type == "level select")
	{
		room_goto(level + r1 - 1)
	}
	else if(type == "login")
	{
		with(oLogin) {
			alarm[1] = 1
		}
	}
	else if(type == "log in")
	{
		room_goto(rLogin)
	}
	else if(type == "sign up")
	{
		with(oLogin) {
			alarm[0] = 1
		}
	}
	else if(type == "share")
	{
		var content_map = LoadJSONfromFile("File.txt")
		var content = content_map[? "ROOT"]
		request = lvl_put(content)
		alarm[2] = 300
	}
	else if(type == "level slide")
	{
		with(oInterface_button)
		{
			if(type == "level select")
			{
				level += other.slide_amount
				if(level + r1 - 1 > rlast or level < 1)
				{
					visible = false
					active = false
				}
				else
				{
					visible = true
					active = true
				}
			}
		}
	}
	else if(type == "exit")
	{
		game_end()
	}
	else if(type == "select")
	{
		room_goto(rLevel_select)
	}
	else if(type == "new game")
	{
		room_goto(r1)
	}
	else if(type == "to menu")
	{
		room_goto(rMain_menu)
	}
	else if(type == "leaderboard")
	{
		room_goto(rLeaderboard)
	}
	else if(type == "options")
	{
		room_goto(rSettings)
	}
	else if(type == "editor")
	{
		room_goto(rEditor_select)
	}
	else if(type == "editor edit")
	{
		room_goto(rEditor)
	}
	else if(type == "editor play")
	{
		var content_map = LoadJSONfromFile("File.txt")
		global.content = content_map[? "ROOT"]
		global.locallevel = true
		room_goto(rEmpty)
	}
	else if(type == "help")
	{
		room_goto(rTutorial)
	}
	else if(type == "custom slide")
	{
		var levelmap = oCustom_level_list.levellist[| 0] // List is from "default" key, map is placed #n in the list
		//Level map contains things like rating, difficulty of the level and content itself
		if(is_undefined(levelmap))
			exit
		with(all)
		{
			if(variable_instance_exists(id,"n"))
				n += other.slide_amount
		}
		with(oInterface_button)
		{
			//if(type == "custom select")
				update_button(type)
		}
		with(oText_marker)
		{
			update_textmarker()
		}
	}
	else if(type == "editor list")
	{
		room_goto(rCustom_select)
	}
	else if(type == "search")
	{
		with(oCustom_level_list)
			lvl_get(global.search)
	}
	else if(type == "custom play")
	{
		var levelmap = oCustom_level_list.levellist[| n-1] // List is from "default" key, map is placed #n in the list
		//Level map contains things like rating, difficulty of the level and content itself
		if(is_undefined(levelmap))
			exit

		var content_map = json_decode(levelmap[? "content"])
		// Content_map is a map, that looks like that {"ROOT":{...}}.
		//Contains only content, but not in format of a list
		if(is_undefined(content_map))
			exit
		
		//var precontent_map = content_map[? "ROOT"]
		//var content_list = precontent_map[? "ROOT"] 
		var content_list = content_map[? "ROOT"]
		// This list contains pure level content
		if(is_undefined(content_list))
			exit
		
		global.content = content_list
		global.locallevel = false
		room_goto(rEmpty)
	}
	else if(type == "clear all")
	{
		with(oEditor_object)
			instance_destroy()
	}
	else if(type == "delete")
	{
		file_delete("save.ini")
		file_delete("inputs.ini")
		file_delete("Leaderboards.ini")
		file_delete("README.ini")
		game_restart()
	}
	else if(type == "rating+")
	{
		request = like(my_id)
	}
} // If not active
else if(type == "bind")
{
	if(!any_bindkey_activated())
		active = true
}