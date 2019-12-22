/// @description 
if(!audio_is_playing(aMusic) and (room >= r1 and room < rEditor or room == rMain_menu)) {
	audio_play_sound(aMusic,1,true)
}
else if((audio_is_playing(aMusic) and room < r1 or room > rEditor) and room != rMain_menu) {
	audio_stop_sound(aMusic)
}