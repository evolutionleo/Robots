if(argument_count)
	var search = string(argument[0])
else
	var search = ""

http_get("http://62.113.112.109/robots.php?action=lvl_get&security="+global.security+"&search="+search)