// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_level(){
	
	global.game_time = 0
	timer = 0 //as of now this function should only be called by obj_level_manager
	global.level_score = 0
	global.game_paused = false
	global.i_lifted = noone;
	global.player_health_max = 100;
	global.player_health = global.player_health_max;
	global.player_xp = 0;
	global.player_level = 1
	global.player_xp_to_next_level = global.player_base_xp
	// currently not in shop
	global.player_unlocked_level = []
	global.player_unlocked_augment = []
	global.yumi_quest_completed = []
	with(obj_player) {
		cross_country = false
		cross_country_distance = 0
	}
	global.player_ammo[ITEM.MEDKIT] = 3;
	global.player_ammo[ITEM.BOMB] = 3;
	apply_permanent_upgrades()
}