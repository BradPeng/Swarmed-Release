// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_throw(){
	var _instance = noone
	_instance = global.i_lifted
	with(_instance) {
		lifted = false;
		persistent = false;
		thrown = true
		
		z = 13;
		throw_peak_height = z + 10;
		throw_distance = entity_throw_distance;
		
		// Set throw distance to where the mouse is, if less than the max distance
		// the object can be thrown
		var _mouse_distance_from_player = point_distance(other.x, other.y, mouse_x, mouse_y)
		if (_mouse_distance_from_player <= entity_throw_distance) {
			throw_distance = _mouse_distance_from_player
		}
		throw_distance_travelled = 0;
		throw_start_percent = 13/throw_peak_height * 0.5;
		throw_percent = throw_start_percent
		direction = other.direction
		xstart = x;
		ystart = y;  
	}
	
	player_act_out_animation(spr_player_throw);
	global.i_lifted = noone;
	idle_sprite = spr_player;
	run_sprite = spr_player_run;
}