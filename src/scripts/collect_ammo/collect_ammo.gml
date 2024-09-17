// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_ammo(_array){
	audio_play_sound(snd_pickup_item, 1, false)
	global.player_ammo[_array[0]] += _array[1];
}