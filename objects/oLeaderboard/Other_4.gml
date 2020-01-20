/// @desc
global.security = "xd{\zXWA-Vj5RNt*5Z[y9w5@h'0pq"
leadmap = ds_map_create()
//ini_open("Leaderboard.ini")
//for(var i = 0; i < 9; i++) {
//	ds_map_add(leadmap,i,ini_read_string("Best times",i,"-"))
//}
//ini_close()

//request = http_request("https://innopolistudy.ru/evoleo?action=lb_get&security="+global.security, "POST", header_map, "");


//var str = ""
//http_post_string("http://62.113.112.109/robots.php?action=lb_get&security="+global.security,str)
http_get("http://62.113.112.109/robots.php?action=lb_get&security="+global.security)

//http_get("http://62.113.112.109/robots.php?action=lb_get&security="+global.security)