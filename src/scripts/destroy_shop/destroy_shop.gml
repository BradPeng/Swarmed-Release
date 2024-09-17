// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_shop(){
	save_game()
	with (obj_store_card) {
		instance_destroy();
	}

	with (obj_shop_controller) {
		instance_destroy()	
	}

	with (obj_bar) {
		instance_destroy()	
	}

	with (obj_slider) {
		instance_destroy()	
	}
	
	with(obj_close_shop_button) {
		instance_destroy()	
	}
	
	with(obj_player) {
		state = player_state_free	
	}
}