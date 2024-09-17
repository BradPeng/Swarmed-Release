// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pause_game() {
	with (all) {
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
function unpause_game() {
	with (all) {
		image_speed = game_paused_image_speed;	
	}
}