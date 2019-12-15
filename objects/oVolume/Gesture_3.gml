/// @desc
x = event_data[?"posX"] + drag_offsetX
//var max_ = oVolume_slider.sprite_width * oVolume_slider.image_xscale
if(x > startx)
	x = startx
if(x < oVolume_slider.x)
	x = oVolume_slider.x