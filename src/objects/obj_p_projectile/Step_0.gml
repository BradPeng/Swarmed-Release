/// @description Hit stuff
if (!global.game_paused) {
	var _x_speed = lengthdir_x(move_speed, direction)
	var _y_speed = lengthdir_y(move_speed, direction)
	x += _x_speed
	y += _y_speed
	
	var _entity = instance_place(x, y, obj_p_entity);
	var _break = false;
	if (_entity != noone) {
		with (_entity) {
		
			// damage enemy
			if (object_is_ancestor(object_index, obj_p_hostile_mob)) {
				hurt_enemy(_entity, other.damage + global.player_damage_bonus, other.id, other.knockback);
				
				_break = true;
			} else if (entity_hit_script != -1) {
			
				// force cast entity_hit_script to a script
				var _entity_hit_script_script = blank_script
				_entity_hit_script_script = entity_hit_script
				script_execute(_entity_hit_script_script);
				_break = true; // only break if we hit something
			}
		}
	
		if (_break) instance_destroy();
	}

	// destroy if we leave camera
	
	if (!is_on_screen()) {
		instance_destroy();	
	}
}
