// inputs
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S"))
key_activate = keyboard_check_pressed(vk_space);

key_item = keyboard_check_pressed(vk_control);
key_item_select_up = keyboard_check_pressed(ord("E"));
key_item_select_down = keyboard_check_pressed(ord("Q"));
key_dodge = keyboard_check_pressed(ord("G"))
key_up_release = keyboard_check_released(ord("W"));
input_direction = point_direction(0, 0, key_right - key_left, key_down - key_up);
input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0); 
aim_direction = point_direction(x, y-12, mouse_x, mouse_y) //temp 16 offset, same as in free state
shoot_key = mouse_check_button(mb_left)
key_next_weapon = mouse_check_button_pressed(mb_right)
key_test_feature = keyboard_check_pressed(ord("T"));
key_delete_save = keyboard_check_pressed(ord("P"))
key_cheat = keyboard_check_pressed(ord("C"))
if (key_test_feature) {
	x=936
	y=1048
}

if (key_cheat) {
	global.player_money = 10000
}

if (key_delete_save) {
	delete_save()
	game_restart()
}

if (!global.game_paused) {
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	
	
	if (cross_country) {
		var _dx = x - xprevious;
		var _dy = y - yprevious;
		var _distance_moved = sqrt(_dx * _dx + _dy * _dy);
		cross_country_distance += _distance_moved;
		
		if (cross_country_distance >= 4000) {
			cross_country_distance = 0
			global.player_projectile_bonus++
			global.player_damage_bonus++
			global.player_back_shot++
			global.player_health_max += 20
			global.player_health += 20
			global.player_health_regen += 0.25
			if (array_contains(global.player_unlocked_level, BUFFS.ROTATING_BLADES)) {
				with (obj_rotating_blades) {
					instance_destroy();
				}
				create_rotating_blades()	
			}
	
			if (array_contains(global.player_unlocked_level, BUFFS.RADIANT_FIELD)) {
				with (obj_radiant_field) {
					instance_destroy();
				}
				instance_create_layer(x, y, "Instances", obj_radiant_field)
			}
	
			if (array_contains(global.player_unlocked_level, BUFFS.BUNNY_CROSSBOW)) {
				with (obj_bunny_crossbow) {
					instance_destroy();
				}
				instance_create_layer(x, y, "Instances", obj_bunny_crossbow)
			}
		}
	}

	if (state != player_state_transition and state != player_state_dead) {
		health_regen_timer++
			if (health_regen_timer >= game_get_speed(gamespeed_fps)) {
			var _hp_regen = global.player_health_regen
			var _hp = global.player_health
			var _max_hp = global.player_health_max
			if (_hp + _hp_regen >= _max_hp) {
				global.player_health = _max_hp
			} else {
				global.player_health += _hp_regen
			}
		
			health_regen_timer = 0
		}
	}
	
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom
