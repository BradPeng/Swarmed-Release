// Handle pausing and moving
if (global.game_paused == false) {
	if (is_paused) {
		// Increment the pause timer
	    pause_timer += 1;
    
		// Check if the pause duration has been met
	    if (pause_timer >= pause_duration) {
			// Resume movement
	        is_paused = false;
	        move_timer = 0;
	        direction = irandom_range(0, 360);
	    }
	} else {
		// Check if sporadic mode should be activated
	    if (!sporadic_mode && random(100) < sporadic_chance) {
	        sporadic_mode = true;
	        sporadic_timer = 0;
	        sporadic_duration = irandom_range(sporadic_duration_min, sporadic_duration_max);
	    }

		// Handle movement
	    if (sporadic_mode) {
			// Sporadic movement: rapidly change direction and speed
	        direction += irandom_range(-30, 30);
	        move_speed = irandom_range(move_speed_min, move_speed_max);

			// Increment the sporadic timer
	        sporadic_timer += 1;

			// End sporadic mode after the duration
	        if (sporadic_timer >= sporadic_duration) {
	            sporadic_mode = false;
	            move_speed = irandom_range(move_speed_min, move_speed_max);
	        }
	    } else {
			move_speed = irandom_range(move_speed_min, move_speed_max);	
		}

		// Increment the movement timer
	    move_timer += 1;

		// Increment the path update timer
	    path_update_timer += 1;

		// Update the path occasionally
	    if (path_update_timer >= path_update_interval) {
			// Reset the timer and interval
	        path_update_timer = 0;
	        path_update_interval = irandom_range(10, 30);

			// Loop to find a valid path
	        var _path_found = false;
	        repeat (10) { // Attempt up to 10 times to find a valid path
				// Define the target position within the bounding box
	            var _target_x = spawn_x + irandom_range(-box_size, box_size);
	            var _target_y = spawn_y + irandom_range(-box_size, box_size);

				// Delete the previous path if it exists
	            if (path_exists(path)) {
	                path_delete(path);
	            }
				path = path_add()
				// Attempt to create a path to the target position, avoiding obj_solid
	            if (mp_grid_path(grid, path, x, y, _target_x, _target_y, true)) {
	                path_start(path, move_speed, path_action_stop, false);
	                _path_found = true;
	                break; 
	            }
	        }

			// If no valid path was found after 10 attempts, reset the timer and try again later
	        if (!_path_found) {
	            path_update_timer = 0;
	        }
	    }

		// Check if the movement duration has been met
	    if (move_timer >= move_duration) {
	        is_paused = true;
	        pause_timer = 0;
	        pause_duration = irandom_range(pause_duration_min, pause_duration_max); 
	        move_duration = irandom_range(move_duration_min, move_duration_max); 
	    }
	}

	// Check if the player is standing on this object
	if (place_meeting(x, y, obj_player)) {
	    stay_timer += 1;
    
	    if (stay_timer >= win_time) {
			complete_yumi_quest()
	        instance_destroy()
	    }
	}
}
