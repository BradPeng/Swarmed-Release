/// @description Insert description here
// You can write your code in this editor
x = obj_player.x;
y = obj_player.y-14;
depth = obj_player.depth + 1
if (global.game_paused == false) {
	hit_list_clear_timer++;
	if (hit_list_clear_timer >= hit_list_clear_time) {
		hit_list_clear_timer = 0;
		ds_list_clear(damaged_enemies);
	}

	// Define the radius within which enemies can be hit
	var _radius = (sprite_get_width(spr_radiant_field) * image_xscale)/2; // Adjust the radius as needed

	// Get all entities within the radius
	var _entity_list = ds_list_create();
	collision_circle_list(x, y, _radius, obj_p_entity, true, true, _entity_list, false);

	// Loop through all entities hit
	for (var _i = 0; _i < ds_list_size(_entity_list); _i++) {
		var _entity = ds_list_find_value(_entity_list, _i);

		with (_entity) {
			// damage enemy
			if (object_is_ancestor(object_index, obj_p_hostile_mob)) {
				if (ds_list_find_index(other.damaged_enemies, id) == -1) {
				
					hurt_enemy(_entity, other.damage + global.player_damage_bonus, other.id, other.knockback);
					ds_list_add(other.damaged_enemies, id);
				}
			} else if (entity_hit_script != -1) {
				// force cast entity_hit_script to a script
				var _entity_hit_script_script = entity_hit_script;
				script_execute(_entity_hit_script_script, other.id);
			}
		}
	}

	// Clean up the list
	ds_list_destroy(_entity_list);
}
