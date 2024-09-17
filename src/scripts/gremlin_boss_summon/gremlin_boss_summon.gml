// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gremlin_boss_summon() {
	image_speed = 1
	sprite_index = summon_sprite
	if (summon_animation_counter <= 2 * image_number * 20) {
		summon_animation_counter++
	} else {
		if (summon_count >= summon_count_max) {
			state = GREMLIN_BOSS_STATE.CHASE
			image_speed= 0
		} else {
			summon_count++
			var _random_x = irandom_range(-120, 120) 
			var _random_y = irandom_range(-120, 120)
			instance_create_layer(x+_random_x, y+_random_y, "Instances", obj_greedy_gremlin)
		}
	}
}