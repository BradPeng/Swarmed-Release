/// Drop fragments and items

if (entity_fragment_count > 0) {
	var _fragment_array = array_create(entity_fragment_count, entity_fragment);
	drop_items(x, y, _fragment_array);
}

var _entity_drop_list_array = []
_entity_drop_list_array = entity_drop_list
if (_entity_drop_list_array != -1) {
	drop_items(x, y, _entity_drop_list_array);	
}

if (destroy_sound != noone) {
	
	// silence feather error
	var _sound = snd_shoot_1
	_sound = destroy_sound
	audio_sound_pitch(_sound, random_range(0.8, 1.2))
	audio_play_sound(_sound, 1, false)	
}