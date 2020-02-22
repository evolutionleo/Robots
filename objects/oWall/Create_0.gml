/// @desc
event_inherited()
if(object_index == oHbot) {
	polygon = polygon_from_instance(id)
}
else {
	polygon = polygon_from_instance(oNull)
}

if(!rotatable) {
	image_angle = 0
}