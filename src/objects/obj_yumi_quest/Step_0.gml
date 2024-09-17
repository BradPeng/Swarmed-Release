// Check if the player is standing on this object
if (place_meeting(x, y, obj_player)) {
	// Player is standing on the object; increment the circle fill
    circle_fill_angle += circle_fill_speed;
    if (circle_fill_angle > 360) {
        activate_yumi_quest()
		instance_destroy()
    }
} else {
	// Player is not standing on the object; decrement the circle fill
    circle_fill_angle -= circle_fill_speed;
    if (circle_fill_angle < 0) {
        circle_fill_angle = 0;  // Ensure the fill angle does not go below 0
    }
}
