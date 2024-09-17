// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collect_heal() {
	audio_sound_pitch(snd_heal, 1.5)
	audio_play_sound(snd_heal, 1, false)
	
	var _max_hp = global.player_health_max
	var _healed_amount = _max_hp * 0.25 
	var _current_hp = 0
	_current_hp = global.player_health
	global.player_health = clamp(_current_hp, _current_hp + _healed_amount, _max_hp)
}