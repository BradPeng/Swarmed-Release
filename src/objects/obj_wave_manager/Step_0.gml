/// @description Insert description here
// You can write your code in this editor
if (global.game_paused == false) {
	var _game_time = global.game_time
	if (_game_time <= 180) {
		if (instance_number(obj_p_hostile_mob) == 0 or timer >= wave_interval) {
			timer = 0
		
			var _enemy_types_to_spawn = [];

			for (var _i = 0; _i < array_length(wave_mappings); _i++) {
			    if (_game_time <= wave_mappings[_i].time) {
			        _enemy_types_to_spawn = wave_mappings[_i].enemies;
			        break;
			    }
			}

			for (var _i = 0; _i < array_length(spawners); _i++) {
				var _spawner = spawners[_i]
			    if (_spawner != noone) {
					_spawner.should_spawn_mob = true
					_spawner.enemy_types = _enemy_types_to_spawn
			    }
			}
		
			if (yumi_quest_count <= 1 and _game_time % 60 == 0 and _game_time != 0 and global.yumi_quest_active == false) {
				if (!instance_exists(obj_yumi_quest)) {
					instance_create_layer(416,416,"Instances", obj_yumi_quest)
					yumi_quest_count++
					yumi_quest_message = true
					alarm[0] = 120
				}
			
			
			}
		} else {
			timer++	
		}
	} else {
		if (!boss_spawned) {
			with(obj_p_hostile_mob) {
				entity_drop_list = []
				instance_destroy()	
			}
			spawn_boss()
			boss_spawned = true
			
		}
	}
}