/// @desc
if(file_exists("Liked.txt")) {
	global.liked = LoadJSONfromFile("Liked.txt")
}
else 
	global.liked = ds_map_create()