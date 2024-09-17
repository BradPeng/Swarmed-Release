/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused) {timer++}
if (timer >= 60) {
	global.game_time++
	timer = 0
}