// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function orc_chase(){
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

	    if (mp_grid_path(grid, path, x, y, _player_x, _player_y, true)) {
	        path_start(path, enemy_speed, path_action_stop, false);
	    }
		
		if (instance_exists(target) and point_distance(x, y, target.x, target.y) <= enemy_attack_radius) {
			if (target.state == player_state_dead) {
				state = ENEMYSTATE.WANDER;	
			}
			state = ENEMYSTATE.ATTACK;
		}
	}
}