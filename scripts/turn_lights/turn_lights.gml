///@arg toggle

var toggle = argument0

if(layer_exists("Darkness") or instance_exists(oDarkness)) {
	//if(toggle) {
	//	instance_activate_layer("Darkness")
	//}
	//else {
	//	instance_deactivate_layer("Darkness")
	//}
	
	with(oDarkness) {
		vis = toggle * 0.05
	}
}