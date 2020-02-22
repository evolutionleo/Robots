var _id = argument0
///@arg id

global.security = "xd{zXWA-Vj5RNt*5Z[y9w5@h%270pq"

global.liked[? _id] = true

return http_get("http://62.113.112.109/robots.php?security="+global.security+"&action=like&id="+string(_id))