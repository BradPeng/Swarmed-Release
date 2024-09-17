// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function open_shop(){
	with (obj_player) {
		// When textbox is created, we set state to locked
		// and the previous state to whatever we were before
		// Since the textbox is destroyed after the shop opens,
		// When the textbox goes away we always return to free state
		// So we set last_state to locked, and only unlock
		// when we call destroy shop
		last_state = player_state_locked;		
	}
	instance_create_layer(590, 170, "store_ui", obj_bar)
	instance_create_layer(x, y, "store_ui", obj_shop_controller)
	var _button_x = 592;
	var _button_y = 330 
	instance_create_layer(_button_x, _button_y, "Instances", obj_close_shop_button);
	
}