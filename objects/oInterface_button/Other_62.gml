/// @desc
var _id = async_load[? "id"]

var status = async_load[? "status"]

if(status != 0)
	exit

if(variable_instance_exists(id,"request") and _id == request) {
	//var result = async_load[? "result"]
	//show_message(string(result))
	if(type == "rating+") {
		with(oText_marker) {
			if(type == "rating" and n == other.n) {
				rating = real(rating) + 1
				text = "rating: "+string(rating)
			}
		}
	}
}