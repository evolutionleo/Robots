var _id = argument0
///@arg lvl_id

return http_get("http://62.113.112.109/robots.php?action=lvl_delete&security="+global.security+"&id="+string(_id))