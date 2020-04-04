/// @desc Record GIF

if(keyboard_check_pressed(vk_f8))
{
	isRecording = !isRecording
	
	if(isRecording)
	{
		gif = gif_open(RESOLUTION_W,RESOLUTION_H)
	}
	else
	{
		gif_save(gif,"capture.gif")
		//isRecording = false
	}
}


if(isRecording)
{
	gif_add_surface(gif,application_surface,2)
}