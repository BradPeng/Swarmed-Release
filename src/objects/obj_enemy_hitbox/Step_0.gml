/// @description Insert description here
// You can write your code in this editor
animate_cardinal_sprite()
if (source_object != -1) {
	var _source_object_instance = noone
	_source_object_instance = source_object
	if (instance_exists(_source_object_instance) and source_object.state = ENEMYSTATE.ATTACK) {
		x = source_object.x
		y = source_object.y
	} else {
		instance_destroy()		
	}
}

if (animation_end) {
	instance_destroy()	
}

