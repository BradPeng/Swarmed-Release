/// @description Player after death timer
global.target_x = 936;
global.target_y = 1048;
global.game_paused = true
if (global.level_score > global.high_score) {
	global.high_score = global.level_score	
}
save_game()
pause_game()
//room_transition(TRANS_TYPE.SLIDE, rm_warehouse_district); 
