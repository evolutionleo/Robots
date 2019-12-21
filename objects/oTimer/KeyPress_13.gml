/// @desc
if(keyboard_check(vk_space) and keyboard_check(vk_shift) and keyboard_check(vk_alt)) {
	var map = ds_map_create()
	//ds_map_add(map,,)
	http_request("https://innopolistudy.ru/evoleo/?security=e79e88b1d7e656d84d346d41b98ba232&action=lb_put&name=" + global.Player_name + "&time=" + string(time) + "&version=" + GM_version,"GET",map,"")
}