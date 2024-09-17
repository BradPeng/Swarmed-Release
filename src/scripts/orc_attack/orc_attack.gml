// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function orc_attack() {
	var _player_x = obj_player.x
	var _player_y = obj_player.y
	if (sprite_index != attack_sprite) {
		
		sprite_index = attack_sprite
		local_frame = 0;
		image_index = 0;
		
		if (instance_exists(obj_player)) {
			enemy_attack(spr_orc_attack_hb, point_direction(x,y, _player_x, _player_y), enemy_force_touch, 30);
		}
	}
	
	
	var _direction_from_player = point_direction(x, y  - origin_y_offset, _player_x, _player_y-12)
	if (_direction_from_player >= 45 and _direction_from_player <= 135) {// face up
		direction = 90	
	} else if (_direction_from_player > 135 and _direction_from_player <= 225) {//face left
		direction = 180	
	} else if (_direction_from_player > 225 and _direction_from_player < 315) { //face down 
		direction = 270	
	} else { // face right
		direction = 0
	}
	
	animate_cardinal_sprite();
	if (animation_end) {
		if (instance_exists(obj_player) and (obj_player.state != player_state_dead)) {
			state = ENEMYSTATE.CHASE;
		} else {
			state = ENEMYSTATE.WANDER;
		}
		animation_end = false;
	}
}