/// @desc
if(!global.toggle_light) {
	instance_destroy(obj_light_renderer)
}
else if(!instance_exists(obj_light_renderer)) {
	instance_create_layer(x,y,layer,obj_light_renderer)
}

if(global.toggle_light)
	sprite_index = spr_light_point
else
	sprite_index = spr_light_point_off