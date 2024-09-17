// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function complete_yumi_quest(){
	global.game_paused = true
	global.level_up_screen = true
	global.yumi_quest_active = false
	// Calculate augment card spawn position
	var _obj_width = sprite_get_width(spr_augment_card)
	var _obj_height = sprite_get_height(spr_augment_card)
	var _space_between_cards = 50
	var _total_width = (3 * _obj_width) + (2 * _space_between_cards);
		
	var _cam = view_camera[0];
	var _cam_x = camera_get_view_x(_cam);
	var _cam_y = camera_get_view_y(_cam);
	var _cam_width = camera_get_view_width(_cam);
	var _cam_height = camera_get_view_height(_cam);
		
	var _horizontal_padding = (_cam_width - _total_width) / 2
	var _start_x = _cam_x + _horizontal_padding + _obj_width/2;
	var _y_position = _cam_y + _cam_height / 2 
	
	var _num_array = array_create(AUGMENTS.AUGMENTS_LENGTH - 1) // -1 to ignore BUFFS.NONE
	// Create array with all possible buffs
	
	for (var _i = 0; _i < AUGMENTS.AUGMENTS_LENGTH - 1; _i++) { // -1 to ignore BUFFS.LENGTH
	    _num_array[_i] = _i + 1; // +1 to skip BUFFS.NONE
	}

	// Check if cross_country is unlocked
	var _cross_country_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.CROSS_COUNTRY); 
	};
	
	// If cross_country is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.CROSS_COUNTRY)) {
		var _index_to_delete = array_find_index(_num_array, _cross_country_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	// Check if more projectiles is unlocked
	var _more_projectiles_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.MORE_PROJECTILES); 
	};
	
	// If more projectiles is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.MORE_PROJECTILES)) {
		var _index_to_delete = array_find_index(_num_array, _more_projectiles_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	// Check if more damage is unlocked
	var _more_damage_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.MORE_DAMAGE); 
	};
	
	// If cross_country is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.MORE_DAMAGE)) {
		var _index_to_delete = array_find_index(_num_array, _more_damage_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	// Check if more area size is unlocked
	var _more_area_size_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.MORE_AREA_SIZE); 
	};
	
	// If more area size is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.MORE_AREA_SIZE)) {
		var _index_to_delete = array_find_index(_num_array, _more_area_size_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	// Check if more xp is unlocked
	var _more_xp_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.MORE_XP); 
	};
	
	// If cross_country is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.MORE_XP)) {
		var _index_to_delete = array_find_index(_num_array, _more_xp_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	// Check if more backshots is unlocked
	var _more_backshots_delete_condition = function(_element, _index) {
		return (_element == AUGMENTS.MORE_BACK_SHOTS); 
	};
	
	// If cross_country is unlocked, delete it from the list of possible upgrades
	if (array_contains(global.player_unlocked_augment, AUGMENTS.MORE_BACK_SHOTS)) {
		var _index_to_delete = array_find_index(_num_array, _more_backshots_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	

	// Store randomly selected augments (from pruned list)
	var _selected_numbers = [];
	
	// Loop to select 3 unique numbers
	for (var _i = 0; _i < 3; _i++) {
	    var _index = irandom(array_length(_num_array)-1); // picking index, so -1
	
		// Add value at _num_array to the selected augments
		// Remove the selected _index to avoid duplicates
		array_push(_selected_numbers, _num_array[_index]); 
	    array_delete(_num_array, _index, 1);
	}

	var _card_1 = instance_create_depth(_start_x, _y_position, -10000, obj_augment_card)
	var _card_2 = instance_create_depth(_start_x + _obj_width + _space_between_cards, _y_position, -10000, obj_augment_card)
	var _card_3 = instance_create_depth(_start_x + 2 * (_obj_width + _space_between_cards), _y_position, -10000, obj_augment_card)
	
	with (_card_1) {
		buff_type = _selected_numbers[0]
		upgrade_type = "Augment"
	}
	with (_card_2) {
		buff_type = _selected_numbers[1]
		upgrade_type = "Augment"
	}
	with (_card_3) {
		buff_type = _selected_numbers[2]
		upgrade_type = "Augment"
	}
	
	// Pause game only after the cards are spawned in
	pause_game()
	global.active_yumi_quest = -1
}
