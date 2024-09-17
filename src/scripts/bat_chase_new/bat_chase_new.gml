function bat_chase_new() {
	sprite_index = move_sprite;
    if (instance_exists(target)) {
		var _player_x = target.x
		var _player_y = target.y
        image_speed = 1
       
 
		if (direction > 90 && direction < 270) {
			// Moving left
			 image_xscale = -1;
		} else {
			// Moving right
			 image_xscale = 1;
		}
		
		if (point_distance(x, y, _player_x, _player_y) <= 70) {
			x_to = _player_x
			y_to = _player_y
		} else {
			if (path_exists(path)) {
				path_delete(path);
		    }
			path = path_add()

		    if (mp_grid_path(grid_type, path, x, y, obj_player.x, obj_player.y-12, true)) {
				x_to = path_get_x(path, path_position + 0.1)
				y_to = path_get_y(path, path_position + 0.1)
			} else {
				mp_potential_step(_player_x, _player_y, enemy_speed, false)
				exit
			} 
		}
		

        var _distance_to_go = point_distance(x, y, x_to, y_to);
        image_speed = 1;
        dir = point_direction(x, y, x_to, y_to);
        if (_distance_to_go > enemy_speed) {
            h_speed = lengthdir_x(enemy_speed, dir);    
            v_speed = lengthdir_y(enemy_speed, dir);    
        } else {
            h_speed = lengthdir_x(_distance_to_go, dir);    
            v_speed = lengthdir_y(_distance_to_go, dir);    
        }
        direction = dir;
        
        if (place_meeting(x + h_speed, y + v_speed, target)) {
            hurt_player(dir, enemy_force_touch, enemy_damage_touch);
        }
        
        enemy_tile_collision();
		
    }
}

