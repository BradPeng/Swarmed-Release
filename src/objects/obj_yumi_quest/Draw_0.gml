draw_self()
// Set the drawing color and alpha
draw_set_colour(c_red)
draw_set_alpha(1);

if (circle_fill_angle > 0) {
	// Parameters for thickness
	var _thickness = 5;  // Adjust this value to make the outline thicker

	// Draw the filling edge of the circle with increased thickness
	var _step_size = 5; // Step size for smoother edge (lower values are smoother but cost more performance)

	// Iterate over the angles to draw the thick outline
	for (var _angle = 360; _angle >= 360 - circle_fill_angle; _angle -= _step_size) {
		// Outer points
	    var _outer_x1 = x + lengthdir_x(circle_radius, _angle);
	    var _outer_y1 = y + lengthdir_y(circle_radius, _angle);
	    var _outer_x2 = x + lengthdir_x(circle_radius, _angle - _step_size);
	    var _outer_y2 = y + lengthdir_y(circle_radius, _angle - _step_size);

		// Inner points
	    var _inner_x1 = x + lengthdir_x(circle_radius - _thickness, _angle);
	    var _inner_y1 = y + lengthdir_y(circle_radius - _thickness, _angle);
	    var _inner_x2 = x + lengthdir_x(circle_radius - _thickness, _angle - _step_size);
	    var _inner_y2 = y + lengthdir_y(circle_radius - _thickness, _angle - _step_size);

		// Draw the quadrilateral strip (band) between the two radii
	    draw_primitive_begin(pr_trianglestrip);
	    draw_vertex(_outer_x1, _outer_y1);
	    draw_vertex(_inner_x1, _inner_y1);
	    draw_vertex(_outer_x2, _outer_y2);
	    draw_vertex(_inner_x2, _inner_y2);
	    draw_primitive_end();
	}

	// Reset drawing settings
	draw_set_alpha(1);
}