/// @desc
if(type == "select switch") {
	if(oSwitch.current == rob_id) {
		//image_alpha -= 0.05
		vis = -0.05
	}
	else {
		//image_alpha += 0.05
		vis = 0.05
	}
}
image_alpha += vis
image_alpha = clamp(image_alpha, .0, 1.0)
