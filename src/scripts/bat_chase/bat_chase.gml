function bat_chase() {
    sprite_index = move_sprite;
    if (instance_exists(target)) {

		
		
		var _player_x = target.x
		var _player_y = target.y
		
		if (point_distance(x, y, _player_x, _player_y) <= 70) {
			x_to = _player_x
			y_to = _player_y
		} else {
			
			mp_potential_step(_player_x, _player_y, enemy_speed, false)
			if (direction > 90 && direction < 270) {
				// Moving left
			    image_xscale = -1;
			} else {
				// Moving right
			    image_xscale = 1;
			}
			image_speed = 0;
	        var _total_frames = sprite_get_number(sprite_index) / 4;
	        image_index = local_frame + (CARDINAL_DIR * _total_frames);
	        local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
        
	        if (local_frame >= _total_frames) {
	            local_frame -= _total_frames;
	        }
			exit
		} 

        var _distance_to_go = point_distance(x, y, x_to, y_to);
        image_speed = 0;
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
		image_speed = 0;
        sprite_index = move_sprite;
        var _total_frames = sprite_get_number(sprite_index) / 4;
        image_index = local_frame + (CARDINAL_DIR * _total_frames);
        local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
        
        if (local_frame >= _total_frames) {
            local_frame -= _total_frames;
        }
       if (direction > 90 && direction < 270) {
				// Moving left
			    image_xscale = -1;
			} else {
				// Moving right
			    image_xscale = 1;
			}
        enemy_tile_collision();
		
    }
}
