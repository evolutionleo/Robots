/// @desc


if(mode == "edit") {
	room_set_width(room,1280)
	room_set_height(room,960)
	layer_set_visible("Instruments",true)
	layer_set_visible("Page",true)
	}
else if(mode == "play"){
	room_set_width(room,1024)
	room_set_height(room,768)
	layer_set_visible("Instruments",false)
	layer_set_visible("Page",false)
}