function ball_tile_collision() {
    var _collided = false;
    
	// Check for collisions on the horizontal axis
    var _collided_object = instance_place(x + h_speed, y, obj_solid);
    if (_collided_object != noone and _collided_object.is_solid) {
        while (!place_meeting(x + sign(h_speed), y, obj_solid)) {
            x += sign(h_speed);
        }
        if (_collided_object.object_index != obj_player) {
            _collided = true;
        }
		// Reverse horizontal speed on collision and apply energy loss
        h_speed = -h_speed * 0.8;
    }

	// Horizontal move commit
    x += h_speed;

	// Check for collisions on the vertical axis
    _collided_object = instance_place(x, y + v_speed, obj_solid);
    if (_collided_object != noone and _collided_object.is_solid) {
        while (!place_meeting(x, y + sign(v_speed), obj_solid)) {
            y += sign(v_speed);
        }   
        if (_collided_object.object_index != obj_player) {
            _collided = true;
        }
		// Reverse vertical speed on collision and apply energy loss
        v_speed = -v_speed * 0.8;
    }

	// Vertical move commit
    y += v_speed;
    
    return _collided;
}
