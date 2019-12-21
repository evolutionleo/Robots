/// @desc
leadmap = ds_map_create()
//ini_open("Leaderboard.ini")
//for(var i = 0; i < 9; i++) {
//	ds_map_add(leadmap,i,ini_read_string("Best times",i,"-"))
//}
//ini_close()
var map = ds_map_create()
request = http_request("https://innopolistudy.ru/evoleo?action=lb_get&security=e79e88b1d7e656d84d346d41b98ba232", "GET", map, "");