/// @desc
if(keyboard_check(vk_control) and global.logged_in and variable_instance_exists(id,"my_id") and global.status == "admin") {
	request = lvl_delete(my_id)
}