if (keyboard_check_pressed(vk_escape) and !instance_exists(obj_transition) and !global.level_up_screen and !instance_exists(obj_text)) {
	
	// close shop if open, otherwise pause menu
	if (instance_exists(obj_shop_controller)) {
		destroy_shop()
	} else {
		global.game_paused = !global.game_paused;	
	
		if (global.game_paused) {
			pause_game()
		} else {
			unpause_game()
		}
	}
}