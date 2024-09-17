// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_free() {
	var _in_level = instance_exists(obj_level_manager)
	
	// Movement
	h_speed = lengthdir_x(input_magnitude * speed_walk, input_direction);
	v_speed = lengthdir_y(input_magnitude * speed_walk, input_direction);
	
	// Always point toward mouse
	direction = aim_direction;
	// Sprite Index
	var _old_sprite = sprite_index;
	if (input_magnitude != 0) {	
		sprite_index = run_sprite;
	} else {
		sprite_index = idle_sprite;
	} 

	if (_old_sprite != sprite_index) {
		local_frame = 0;	
	}

	// Image index
	animate_cardinal_sprite()
	
	var _player_weapons = global.player_weapons
	if (key_next_weapon) {
		selected_weapon++
		if (selected_weapon >= array_length(_player_weapons)) { selected_weapon = 0 }
		weapon = _player_weapons[selected_weapon]
	}

	// shoot
	if (shoot_timer > 0) {shoot_timer--}
	// don't shoot if not in level
	if (_in_level and shoot_key and shoot_timer <= 0 ) {
		if (!audio_is_playing(snd_shoot_1)) {
			audio_sound_pitch(snd_shoot_1, random_range(0.8, 1.2))
			audio_play_sound(snd_shoot_1, 1, false)
		}
		var _num_projectiles = weapon.num_bullets + global.player_projectile_bonus
		var _angle_between_projectiles = 5
		var _spread = (_num_projectiles - 1) * _angle_between_projectiles

		// we want to count spaces between bullets, not number of bullets
		var _spread_division = _spread / max(1, _num_projectiles - 1)
		for (var _i = 0; _i < _num_projectiles; _i++) {
			var _bullet = instance_create_depth(x, y-12, depth, weapon.bullet_obj)	
			with (_bullet) {
				direction = other.aim_direction - _spread / 2 + _spread_division * _i;
				image_speed = 0;
				image_index = 0;
				image_angle = direction
				move_speed = 12;
			}
		}	
		
		// Backshots
		_num_projectiles = global.player_back_shot
		_spread = _num_projectiles * _angle_between_projectiles
		_spread_division = _spread / max(1, _num_projectiles - 1)
		for (var _i = 0; _i < _num_projectiles; _i++) {
			var _bullet = instance_create_depth(floor(x), floor(y) - 16, depth, weapon.bullet_obj)	
			with (_bullet) {
				direction = other.aim_direction -180 - _spread / 2 + _spread_division * _i;
				image_speed = 0;
				image_index = 0;
				image_angle = direction - 180
				move_speed = 12;
			}
		}
	
		shoot_timer = weapon.cooldown
	}
	
		
	if (key_activate) {
		// check for an entity with script
		var _activate_x = x + lengthdir_x(ACTIVATE_RANGE, direction);
		var _activate_y = y + lengthdir_y(ACTIVATE_RANGE, direction);
		var _activate_size = 12;
		var _activate_list = ds_list_create();
		
		activate = noone;
		var _entities_found = collision_rectangle_list( 
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			obj_p_activatable,
			false,
			true,
			_activate_list,
			true
		);
		
		// if first instance is either our lifted entry, or has no script, try next
		while (_entities_found > 0) {
			var _check = _activate_list[| --_entities_found];	//last element in list //-- reduces then number by 1 first, then returns it
			if (_check != global.i_lifted and _check.activatable_activate_script != -1) {
				activate = _check;	
				break;
			}
		}
		
		ds_list_destroy(_activate_list);

		if (activate == noone) {
			//Throw item if held
			if (global.i_lifted != noone) {
				player_throw();	
			} 
		} else { 
			script_execute_array(activate.activatable_activate_script, activate.activatable_activate_args);	
			// npc face player
			with (activate) {
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}
	
	// Use item
	if (key_item and _in_level and !key_activate and global.player_has_any_items and global.player_equipped != ITEM.NONE) {
		switch (global.player_equipped) {
			case ITEM.BOMB:
				use_item_bomb();
				break;
			case ITEM.MEDKIT:
				use_item_medkit();
				break;
			default: break;
		}
	}
	
	//Cycle items
	if (global.player_has_any_items and _in_level) {
		var _cycle_direction = key_item_select_up - key_item_select_down;
		if (_cycle_direction != 0) {
			do {
				global.player_equipped += _cycle_direction;
				
				// If we are at first itme, go to last item
				if (global.player_equipped < 1) {
					global.player_equipped = ITEM.TYPE_COUNT - 1;	
				}
				
				// if we are at last item, go to first item
				if (global.player_equipped >= ITEM.TYPE_COUNT) {
					global.player_equipped = 1;	
				}
			} until (global.player_item_unlocked[global.player_equipped]);
		}
	}
	
	player_collision();
}
