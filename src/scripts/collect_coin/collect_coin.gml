// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_coin(_amount){
	audio_play_sound(snd_collect_coin, 1, false)
	global.player_money += _amount;
}