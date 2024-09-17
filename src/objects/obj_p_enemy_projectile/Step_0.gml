/// @description Hit stuff
if (!global.game_paused) {
	var _x_speed = lengthdir_x(move_speed, direction)
	var _y_speed = lengthdir_y(move_speed, direction)
	x += _x_speed
	y += _y_speed
	
	if (instance_place(x, y, obj_player)) {
		with (obj_player) {
			hurt_player(other.direction, other.knockback, other.damage)
		}
		instance_destroy();	
	}
	
	if (!is_on_screen()) {
		instance_destroy();	
	}
}
