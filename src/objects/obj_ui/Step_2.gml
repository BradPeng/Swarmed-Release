/// @description Insert description here
// You can write your code in this editor
if (global.game_paused) {
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	if (global.victory_screen) {
		victory_option_selected += (key_down - key_up);
		if (victory_option_selected >= array_length(victory_options)) victory_option_selected = 0;
		if (victory_option_selected < 0) victory_option_selected = array_length(victory_options) - 1;
	 
		 key_activate = keyboard_check_pressed(vk_space);
		 if (key_activate) {
			 switch (victory_option_selected) {
				case 0: //return to lobby
					global.target_x = 656;
					global.target_y = 432;
					with (all) {
						game_paused_image_speed = 0	
					}
					unpause_game() // unpause game first because some objects might not have pause image speed set
					
					room_transition(TRANS_TYPE.SLIDE, rm_lobby); 
					global.victory_screen = false
					global.game_paused = false
					break;
				case 1:
					room_restart(); // restart  
					global.victory_screen = false
					
					
					break;
				case 2: //exit game
					game_end()
					break;
			 }
			//set back to first option for next time game is paused
			pause_option_selected = 0
		 }	
	} else if (obj_player.state == player_state_dead) {
		death_option_selected += (key_down - key_up);
		if (death_option_selected >= array_length(death_options)) death_option_selected = 0;
		if (death_option_selected < 0) death_option_selected = array_length(death_options) - 1;
	 
		 key_activate = keyboard_check_pressed(vk_space);
		 if (key_activate) {
			 switch (death_option_selected) {
				case 0: // restart  
					room_restart();
					break;
				case 1:
					global.target_x = 656;
					global.target_y = 432;
					unpause_game() //unpause game first because some objects might not have pause image speed set
					room_transition(TRANS_TYPE.SLIDE, rm_lobby); 
					
					global.game_paused = false
					
					break;
				case 2: //exit game
					game_end()
					break;
			 }
			//set back to first option for next time game is paused
			pause_option_selected = 0
		 }		
	} else {
		
		pause_option_selected += (key_down - key_up);
		 if (pause_option_selected >= array_length(pause_option)) pause_option_selected = 0;
		 if (pause_option_selected < 0) pause_option_selected = array_length(pause_option) - 1;
	 
		 key_activate = keyboard_check_pressed(vk_space);
		 if (key_activate) {
			 switch (pause_option_selected) {
				case 0: //continue	 
					global.game_paused = false;
					with (all) {
						game_paused_image_speed = image_speed;
						image_speed = 0;
					}
					break;
				case 1:
					with(obj_game) instance_destroy();
					save_game();
					game_restart();
					break
				case 2: // save and quit to desktop
					save_game();
					game_end();
					break;
			 }
			 pause_option_selected = 0
		 }
	}
}