function hostile_mob_basic_chase_new() {
	sprite_index = move_sprite;
    if (instance_exists(target)) {
		var _player_x = target.x
		var _player_y = target.y
        image_speed = 0;
        sprite_index = move_sprite;
        var _total_frames = sprite_get_number(sprite_index) / 4;
		var _direction_from_player = point_direction(x, y, _player_x, _player_y -12)
		if (_direction_from_player >= 45 and _direction_from_player <= 135) {// face up
			direction = 90	
		} else if (_direction_from_player > 135 and _direction_from_player <= 225) {//face left
			direction = 180	
		} else if (_direction_from_player > 225 and _direction_from_player < 315) { //face down 
			direction = 270	
		} else { // face right
			direction = 0
		}
        image_index = local_frame + (CARDINAL_DIR * _total_frames);
        local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
        
        if (local_frame >= _total_frames) {
            local_frame -= _total_frames;
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

