// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gremlin_boss_shoot(){
	var _player_x = obj_player.x
	var _player_y = obj_player.y
	if (sprite_index != shoot_sprite) {
		
		sprite_index = shoot_sprite
		local_frame = 0;
		image_index = 0;
	}
	var _is_frame_1 = local_frame == 0;
	var _create_proj = false
	var _x_offset = 0
	var _y_offset = 0
	animate_cardinal_sprite();
	var _direction_from_player = point_direction(x, y  - origin_y_offset, _player_x, _player_y-12)
	if (_direction_from_player >= 45 and _direction_from_player <= 135) {// face up
		direction = 90	
		if (_is_frame_1) {
			_create_proj = true
			_x_offset = 0
			_y_offset = 150
		}
	} else if (_direction_from_player > 135 and _direction_from_player <= 225) {//face left
		direction = 180	
		if (_is_frame_1) {
			_create_proj = true
			_x_offset = -50
			_y_offset = 81
		}
	} else if (_direction_from_player > 225 and _direction_from_player < 315) { //face down 
		direction = 270	
		if (_is_frame_1) {
			_create_proj = true
			_x_offset = 0
			_y_offset = -00
		}
	} else { // face right
		direction = 0
		if (_is_frame_1) {
			_create_proj = true
			_x_offset = 70
			_y_offset = 90
		}
	}
	
	if (_create_proj) {
		if (number_of_shots >= max_number_of_shots) {	
			state = GREMLIN_BOSS_STATE.CHASE
			number_of_shots = 0
		} else {
			var _proj = instance_create_layer(x+_x_offset, y-_y_offset, "Instances", obj_gremlin_boss_projectile)
			number_of_shots++
			_proj.direction = point_direction(x+_x_offset, y-_y_offset, _player_x, _player_y-12)	
			with (_proj) {
				damage = 15
				knockback = 80
			}
			_create_proj = false
		}
	}
	
}