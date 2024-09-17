/// @description Override Parent EndStep
if (!global.game_paused) {
	flash = max(0, flash -0.05);
	fric = 0.05;
	if (z == 0) {
		fric = 0.1;	
	}

	// magnetize
	if (instance_exists(obj_player)) {
		var _px = obj_player.x;
		var _py = obj_player.y;
		var _dist = point_distance(x, y, _px, _py); 
		
		if (collected or _dist < obj_player.magnet_range + global.player_pickup_radius_bonus) {
			collected = true
			if (magnetic) {
				spd += 0.5;
			}
			direction = point_direction(x, y, _px, _py);
			fric = 0;
			var _x_speed = lengthdir_x(spd, direction);
			var _y_speed = lengthdir_y(spd, direction);
			if (_dist < 5 or instance_place(x + _x_speed, y+_y_speed, obj_player)) { //collect radius
				// force cast entity_hit_script to a script
				
				var _collect_script_script = blank_script
					_collect_script_script = collect_script
				if (collect_script_arg != -1) {
					script_execute(_collect_script_script, collect_script_arg);	
				} else if (collect_script != -1) {
					script_execute(_collect_script_script);
				}
			
				instance_destroy();
			}
		}
	}

	if (bounce_count != 0) {
		bounce += (pi * bounce_speed);	
		if (bounce > pi) {
			bounce -= pi;
			bounce_height *= 0.6;
			bounce_count--;
		}
		z = sin(bounce) * bounce_height;
	} else {
			z = 0;	
		}


	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	spd = max(spd - fric, 0);
	spd = clamp(spd, 0, max_speed);
	depth = -bbox_bottom;
}