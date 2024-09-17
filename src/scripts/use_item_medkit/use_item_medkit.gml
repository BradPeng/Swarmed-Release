// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function use_item_medkit() {
	if (global.player_ammo[ITEM.MEDKIT] > 0 and global.player_health < global.player_health_max and global.i_lifted == noone) {
		global.player_ammo[ITEM.MEDKIT]--;
		collect_heal();
		audio_sound_pitch(snd_heal, 1.5)
		audio_play_sound(snd_heal, 1, false)
	}	
}