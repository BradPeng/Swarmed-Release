// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_xp(_amount){
	audio_sound_pitch(snd_retro_9_collect_xp, random_range(1, 1.6))
	audio_play_sound(snd_retro_9_collect_xp, 1, false)
	
	global.player_xp += _amount + _amount * global.player_xp_bonus_percent;
	if (global.player_xp >= global.player_xp_to_next_level) {
		player_level_up()
	}
}