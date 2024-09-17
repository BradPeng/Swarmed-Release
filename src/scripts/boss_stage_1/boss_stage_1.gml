// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function boss_stage_1() {

	if (attack_1_cd >= 0) {
		attack_1_cd--	
	}
	sprite_index = move_sprite;
    if (instance_exists(target)) {
		if (direction > 90 && direction < 270){
			image_xscale = -1		
		} else {
			image_xscale = 1			
		}
        sprite_index = move_sprite;
		var _player_x = obj_player.x
		var _player_y = obj_player.y
		
		if (path_exists(path)) {
	        path_delete(path);
	    }
		path = path_add()

	    if (mp_grid_path(grid, path, x, y, _player_x, _player_y, true)) {
	        path_start(path, enemy_speed, path_action_stop, false);
	    }
		
		if (attack_1_cd == 0 and instance_exists(obj_player) and point_distance(x, y, _player_x, _player_y) <= enemy_attack_radius) {
			path_end();
			if (obj_player.state == player_state_dead) {
				state = ENEMYSTATE.IDLE;	
			} else {
				state = ENEMYSTATE.ATTACK;
			}
		}
	}
}