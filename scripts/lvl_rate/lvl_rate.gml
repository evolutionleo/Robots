var _id = argument0
var rate = argument1

///@arg lvl_id
///@arg rating

return http_get("http://62.113.112.109/robots.php?action=starrate&security="+global.security+"&id="+string(_id)+"&difficulty="+string(rate))
