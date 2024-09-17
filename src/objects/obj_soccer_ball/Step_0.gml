/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
    
	// lock ball's movement to 8 compass directions
	var _knock_direction = point_direction(obj_player.xprevious, obj_player.yprevious-12, x, y-y_offset);
	var _closest_direction = directions[0];
    var _min_diff = abs(angle_difference(_knock_direction, _closest_direction));
	
	for (var _i = 1; _i < array_length(directions); _i++) {
        var _diff = abs(angle_difference(_knock_direction, directions[_i]));
        if (_diff < _min_diff) {
            _min_diff = _diff;
            _closest_direction = directions[_i];
        }
    }
	h_speed =  lengthdir_x(move_speed, _closest_direction);
	v_speed =  lengthdir_y(move_speed, _closest_direction);
	image_angle+=0.1
	if (image_angle >= 360) {
		image_angle = 0	
	}
} else {
	// Apply friction to gradually slow down the ball
    if (h_speed > 0) {
        h_speed -= fric;
        if (h_speed < 0) h_speed = 0;
    } else if (h_speed < 0) {
        h_speed += fric;
        if (h_speed > 0) h_speed = 0;
    }
    
    if (v_speed > 0) {
        v_speed -= fric;
        if (v_speed < 0) v_speed = 0;
    } else if (v_speed < 0) {
        v_speed += fric;
        if (v_speed > 0) v_speed = 0;
    }
}
depth = -bbox_bottom
ball_tile_collision()


