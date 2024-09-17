/// @description Insert description here
// You can write your code in this editor


if (instance_exists(player) and global.game_paused == false) {
	x = player.x
	y = player.y
	
	shoot_timer--
	if (shoot_timer <= 0 ) {
		shoot_timer = shoot_delay;
		var _num_projectiles = 5 + global.player_projectile_bonus
		var _angle_between_projectiles = 5
		var _spread = (_num_projectiles - 1) * _angle_between_projectiles
		var _nearest_enemy = instance_nearest(x, y, obj_p_hostile_mob);
        var _direction;
        
        if (instance_exists(_nearest_enemy)) {
			// Calculate direction towards the nearest enemy
            _direction = point_direction(x, y, _nearest_enemy.x, _nearest_enemy.y);
        } else {
			// Default to a random direction if no enemies exist
            _direction = irandom(360);
        }
		// we want to count spaces between bullets, not number of bullets
		var _spread_division = _spread / max(1, _num_projectiles - 1)
		for (var _i = 0; _i < _num_projectiles; _i++) {
			var _bullet = instance_create_depth(x, y-12, depth, obj_arrow)	
			with (_bullet) {
				direction = _direction - _spread / 2 + _spread_division * _i;
				image_speed = 0;
				image_index = 0;
				image_angle = direction
				move_speed = 12;
			}
		}
	}
}