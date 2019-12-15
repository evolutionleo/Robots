/// @desc

//if(instance_number(oInput) > 1)
//	instance_destroy()

if(file_exists("inputs.ini")) {
	binds = ds_map_secure_load("inputs.ini")
	if(is_undefined(binds[? "up"])) {
		ds_map_destroy(binds)
		file_delete("inputs.ini")
	}
}
if(!file_exists("inputs.ini")) { // Not just else because 
binds = ds_map_create()

ds_map_add(binds,"up",		ord("W"))
ds_map_add(binds,"left",	ord("A"))
ds_map_add(binds,"down",	ord("S"))
ds_map_add(binds,"right",	ord("D"))

ds_map_add(binds,"abil",	ord("E"))
ds_map_add(binds,"switch",	ord("Q"))
ds_map_add(binds,"inter",	ord("F"))
ds_map_add(binds,"jump",	vk_space)

//ds_map_add(binds,"kleft",	false)
//ds_map_add(binds,"kright",	false)
//ds_map_add(binds,"kdown",	false)
//ds_map_add(binds,"kabil",	false)
//ds_map_add(binds,"kswitch",	false)
//ds_map_add(binds,"kinter",	false)

}