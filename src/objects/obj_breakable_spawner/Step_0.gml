/// @description Insert description here
// You can write your code in this editor
spawn_timer++
if (spawn_timer >= spawn_delay and !is_on_screen()) {
	if (instance_place(x, y, obj_solid) == noone) {
		spawn_timer = 0
		instance_create_layer(x, y, "Instances", spawn_object)
	}
}