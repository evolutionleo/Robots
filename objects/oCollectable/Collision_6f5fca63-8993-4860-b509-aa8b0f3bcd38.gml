/// @desc
if(!layer_exists("Effects"))
	layer_create(-10000,"Effects")
var eff = instance_create_layer(x,y,"Effects",oFlash_effect)
eff.color = c_yellow

instance_destroy()