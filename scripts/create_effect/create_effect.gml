///@arg type
///@arg color*

type = argument[0]
//if(type == "flash")
if(argument_count > 1)
	var c = argument[1]
else {
	c = c_red
}

if(!layer_exists("Effects"))
	layer_create(-10000,"Effects")
if(type == "flash") {
	var eff = instance_create_layer(x,y,"Effects",oFlash_effect)
	eff.color = c
}