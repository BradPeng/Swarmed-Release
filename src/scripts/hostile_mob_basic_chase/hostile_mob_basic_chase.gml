function hostile_mob_basic_chase() {
    sprite_index = move_sprite;
    if (instance_exists(target)) {
        image_speed = 0;
        sprite_index = move_sprite;
        var _total_frames = sprite_get_number(sprite_index) / 4;
        image_index = local_frame + (CARDINAL_DIR * _total_frames);
        local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
        
        if (local_frame >= _total_frames) {
            local_frame -= _total_frames;
        }
		var _player_x = target.x
		var _player_y = target.y
		
		if (point_distance(x, y, _player_x, _player_y) <= 70) {
			x_to = _player_x
			y_to = _player_y
		} else {
			/*path_reset_timer++
			if (path_reset_timer >= path_reset_time) {
				if (path_exists(path)) {
					path_delete(path);
				} 
				path = path_add()
				mp_grid_path(global.mp_grid, path, x, y, target.x, target.y, true);
				path_reset_timer = 0
	 		}
		
	        var _next_x = path_get_x(path, 0.1);
	        var _next_y = path_get_y(path, 0.1);
	        var _cell_size = 16;
        
	        x_to = _next_x
	        y_to = _next_y*/
			mp_potential_step(_player_x, _player_y, enemy_speed, false)
			exit
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
