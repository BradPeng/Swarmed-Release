// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function boss_attack() {
	if (image_index >= image_number - 1) {
		if (instance_exists(obj_player) and (obj_player.state != player_state_dead)) {
			state = ENEMYSTATE.CHASE;
		} else {
			state = ENEMYSTATE.IDLE;
		}
		attack_1_cd = 60
	} else {
		sprite_index = spr_boss_attack_1
		if (instance_exists(obj_player) and !instance_exists(obj_boss_hitbox)) {
			enemy_attack(spr_boss_attack_1_hb, point_direction(x,y,obj_player.x, obj_player.y), enemy_force_touch, 10);
		}
	}
	
}