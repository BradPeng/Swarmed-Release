// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_magnet_orb(){
	audio_sound_pitch(snd_magnet, 1.5)
	audio_play_sound(snd_magnet, 1, false)
	with (obj_p_collectable) {
		if (magnetic) {
			collected = true	
		}
	}	
}