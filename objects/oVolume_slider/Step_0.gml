/// @desc
var amount = (oVolume.x - x) / (sprite_width * image_xscale)
with(oMusic) {
	audio_sound_gain(aEpicMusic,amount,0)
	audio_sound_gain(aRegularMusic,amount,0)
	audio_sound_gain(aBossMusic,amount,0)
	audio_sound_gain(aMenuMusic,amount,0)
}