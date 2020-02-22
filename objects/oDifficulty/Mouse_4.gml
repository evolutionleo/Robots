/// @desc
if(global.logged_in and variable_instance_exists(id,"my_id") and (global.status == "admin" or global.status == "moderator")) {
	request = lvl_rate(my_id,global.starrating)
}