/// @desc
global.security = "xd{\zXWA-Vj5RNt*5Z[y9w5@h'0pq"
//var str = "action=lvl_get"+"&security="+global.security
//http_post_string("http://62.113.112.109/robots.php?",str)
http_get("http://62.113.112.109/robots.php?action=lvl_get&security="+global.security)
levellist = ds_map_create()