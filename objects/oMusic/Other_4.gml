/// @description 
if(!audio_is_playing(aMusic) and room >= r1 and room < rEditor) {
	audio_play_sound(aMusic,1,true)
}
else if(audio_is_playing(aMusic) and room < r1 or room > rEditor) {
	audio_stop_sound(aMusic)
}