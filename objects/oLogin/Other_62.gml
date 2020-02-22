/// @desc
var status = async_load[? "status"]
if(status != 0)
	exit

var data = ds_map_create()

var json = async_load[? "result"]
var data = json_decode(json)

var res = data[? "res"]
var stat = data[? "status"]
//show_message(data)
if(res == "Login Success!" or res == "Success") {
	global.status = stat
	global.logged_in = true
	room_goto(rMain_menu)
}
else show_message(res)

ds_map_destroy(data)