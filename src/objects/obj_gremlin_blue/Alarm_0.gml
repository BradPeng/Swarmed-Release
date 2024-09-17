/// @description death lag
instance_destroy()

var _level_score = global.level_score
if (_level_score > global.high_score) {
	global.high_score = _level_score
}
global.game_paused = true;
global.victory_screen = true