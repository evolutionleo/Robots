/// @description 
if(room >= rMain_menu and room < r1 
  or (room >= rEditor_select and room <= rEditor))
{
	if(!audio_is_playing(aMenuMusic))
	{
		audio_stop_all()
		audio_play_sound(aMenuMusic,1,true)
	}
}
else if(room >= r17 and room < r25)
{
	if(!audio_is_playing(aEpicMusic))
	{
		audio_stop_all()
		audio_play_sound(aEpicMusic,1,true)
	}
}
else
{
	if(!audio_is_playing(aRegularMusic))
	{
		audio_stop_all()
		audio_play_sound(aRegularMusic,1,true)
	}
}