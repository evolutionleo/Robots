if(type != "leaderboard")
	n -= 1
if(type == "level_name" or type == "creator_name" or type == "rating") {
	difficulty = 0
	if(!is_undefined(oCustom_level_list.levellist[| n]))
	{
		my_map = oCustom_level_list.levellist[| n]
	
		lvl_name = my_map[? "level_name"]
		creator_name = my_map[? "creator_name"]
		//precontent = json_decode(my_map[? "content"])
		difficulty = my_map[? "difficulty"]
		//content = precontent[? "ROOT"]
		rating = my_map[? "rating"]
		my_id = my_map[? "id"]
	
		if(type == "level_name") {
			text = "        "+lvl_name
		}
		else if(type == "creator_name") {
			text = "by "+creator_name
		}
		else if(type == "rating") {
			text = "rating: "+rating
		}
	}
	else {
		text = ""
	}
	
	
	with(oDifficulty) {
		n -= 1
		if(n == other.n) {
			my_id = other.my_id
			difficulty = other.difficulty
		}
		n += 1
	}
}
if(type != "leaderboard")
	n += 1