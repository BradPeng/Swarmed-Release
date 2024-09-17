// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_yumi_quest() {
	var _num_array = array_create(YUMI_QUESTS.YUMI_QUESTS_LENGTH-1) 
	for (var _i = 0; _i < YUMI_QUESTS.YUMI_QUESTS_LENGTH - 1; _i++) { // -1 to ignore BUFFS.LENGTH
	    _num_array[_i] = _i+1;
	}
	
	var _catch_red_dot_delete_condition = function(_element, _index) {
		return (_element == YUMI_QUESTS.CATCH_RED_DOT); // Replace with your condition
	};
	
	// If catch the dot is completed, delete it from the list of possible upgrades
	if (array_contains(global.yumi_quest_completed, YUMI_QUESTS.CATCH_RED_DOT)) {
		var _index_to_delete = array_find_index(_num_array, _catch_red_dot_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}
	
	var _soccer_delete_condition = function(_element, _index) {
		return (_element == YUMI_QUESTS.BALL); // Replace with your condition
	};
	
	// If ball is completed, delete it from the list of possible upgrades
	if (array_contains(global.yumi_quest_completed, YUMI_QUESTS.BALL)) {
		var _index_to_delete = array_find_index(_num_array, _soccer_delete_condition);
		if (_index_to_delete != -1) {
		    array_delete(_num_array, _index_to_delete, 1);
		}
	}


	var _selected_quest_index = 0
	var _selected_quest = 0
	
	if(array_length(_num_array)==0) {
		_selected_quest = irandom(YUMI_QUESTS.YUMI_QUESTS_LENGTH-2) +1
	} else {
		_selected_quest_index = irandom(array_length(_num_array)-1); 
		_selected_quest = _num_array[_selected_quest_index]
	}
	
	if (_selected_quest == YUMI_QUESTS.CATCH_RED_DOT) {

		var _box_width = 200
		var _random_x = x + irandom_range(-_box_width, _box_width);
		var _random_y = y + irandom_range(-_box_width, _box_width);
		instance_create_layer(_random_x, _random_y, "Instances", obj_red_dot)
		array_push(global.yumi_quest_completed, YUMI_QUESTS.CATCH_RED_DOT)
		global.active_yumi_quest = YUMI_QUESTS.CATCH_RED_DOT
	} else if (_selected_quest == YUMI_QUESTS.BALL) {

		array_push(global.yumi_quest_completed, YUMI_QUESTS.BALL)
		instance_create_layer(700, 560, "yumi_quest_upper", obj_ball_goal)
		instance_create_layer(368, 384, "yumi_quest_upper", obj_soccer_ball)
		global.active_yumi_quest = YUMI_QUESTS.BALL
		
	}
	global.yumi_quest_active = true
}