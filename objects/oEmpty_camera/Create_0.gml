/// @desc
if(get_max("x",oWall) > 1024 or get_max("y",oWall) > 768) {
	camera_set_view_size(view_camera[0],2048,1536)
}
else {
	camera_set_view_size(view_camera[0],1024,768)
}