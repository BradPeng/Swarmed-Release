// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gremlin_boss_chase() {
	var _player_x = obj_player.x
	var _player_y = obj_player.y
	sprite_index = move_sprite;
	image_speed = 0;
    var _total_frames = sprite_get_number(sprite_index) / 4;
	
	var _direction_from_player = point_direction(x, y - origin_y_offset, _player_x, _player_y -12)
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
		
		
    if (instance_exists(target)) {
		if (path_exists(path)) {
	        path_delete(path);
	    }
		path = path_add()

	    if (mp_grid_path(grid, path, x, y-origin_y_offset, _player_x, _player_y-12, true)) {
	        path_start(path, enemy_speed, path_action_stop, false);
	    }
		
		// Shoot
		if (shoot_attack_timer >= shoot_attack_delay and is_on_screen()) {
			state = GREMLIN_BOSS_STATE.SHOOT	
			shoot_attack_timer = 0
		} else {
			shoot_attack_timer++;	
		}
		
		//summon
		if (summon_timer >= summon_delay) {
			state = GREMLIN_BOSS_STATE.SUMMON
			summon_timer = 0
		} else {
			summon_timer++	
		}
		
		var _dist_to_player = point_distance(x, y, target.x, target.y)
		
		if (((CARDINAL_DIR == 0 or CARDINAL_DIR == 2) and _dist_to_player <= enemy_attack_radius)
			or (CARDINAL_DIR == 1 and _dist_to_player <= 212)
			or (CARDINAL_DIR == 3 and _dist_to_player <= 45)
		
		) {
			if (target.state == player_state_dead) {
				state = GREMLIN_BOSS_STATE.IDLE;	
			}
			state = GREMLIN_BOSS_STATE.ATTACK;
		}
	}
	
}