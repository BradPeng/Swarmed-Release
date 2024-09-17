/// @description Insert description here
if (player != noone and global.game_paused == false) {
	// Update the angle
    orbit_angle += orbit_speed;
    
	// Keep the angle within 0-360 degrees
    if (orbit_angle >= 360) {
        orbit_angle -= 360;
    }
    
	// Calculate the new position based on the angle
    x = player.x + lengthdir_x(orbit_distance, orbit_angle);
	
	// manually move orbit center upward a bit
    y = player.y + lengthdir_y(orbit_distance, orbit_angle) - 13;
	
	hit_list_clear_timer++;
	if (hit_list_clear_timer >= hit_list_clear_time) {
		hit_list_clear_timer = 0;
		ds_list_clear(damaged_enemies);
	}
	
	// Define the radius for collision detection
	var _collision_radius = 16;  // Adjust this value as needed

	// Get all entities within the collision radius
	var _entity_list = ds_list_create();
	collision_circle_list(x, y, _collision_radius, obj_p_entity, true, true, _entity_list, false);

	// Loop through all entities hit
	for (var _i = 0; _i < ds_list_size(_entity_list); _i++) {
	    var _entity = ds_list_find_value(_entity_list, _i);
	    with (_entity) {
			// Damage enemy
	        if (object_is_ancestor(object_index, obj_p_hostile_mob)) {
	            if (ds_list_find_index(other.damaged_enemies, id) == -1) {
	                hurt_enemy(_entity, other.damage + global.player_damage_bonus, other.id, other.knockback);
	                ds_list_add(other.damaged_enemies, id);
	            }
	        } else if (entity_hit_script != -1) {
				// Force cast entity_hit_script to a script and execute
	            var _entity_hit_script_script = entity_hit_script;
	            script_execute(_entity_hit_script_script);
	        }
	    }
	}

	// Clean up the list after use to prevent memory leaks
	ds_list_destroy(_entity_list);
}
