// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_rotating_blades() {
	num_spinners = 4 + global.player_projectile_bonus
	orbit_distance = 64 + 64 * global.player_area_size_bonus_percent/100; 
	orbit_speed = 5;  


	for (var _i = 0; _i < num_spinners; _i++) {
	    var _angle = _i * (360 / num_spinners);  // Evenly space the spinners
	    var _spinner = instance_create_depth(x, y, -9000, obj_rotating_blades)
    
		// Pass initial values to the spinner
	    _spinner.orbit_distance = orbit_distance;
	    _spinner.orbit_speed = orbit_speed;
	    _spinner.orbit_angle = _angle;
 
	}
}