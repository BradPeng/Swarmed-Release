// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_enemy(_enemy, _damage, _source, _knockback){
	if (!audio_is_playing(snd_shoot_2)) {
		audio_sound_pitch(snd_shoot_2, random_range(0.8, 1.2))
		audio_play_sound(snd_shoot_2, 1, false)
	}
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemy_hp -= _damage;
			flash = 1;
			

			// hurt or dead
			if (enemy_hp <= 0) {
				if (object_index == obj_gremlin_blue) {
					state = GREMLIN_BOSS_STATE.DIE;	
				} else {
					state = ENEMYSTATE.DIE;
				}
			} else {
				if (enemy_script[ENEMYSTATE.HURT] != -1) {
					// remember state before being hurt so we can return to it
					if (state != ENEMYSTATE.HURT) {
						state_previous = state;
					}
				
					state = ENEMYSTATE.HURT;
					if (_knockback != 0) {
						var _knock_direction = _source.direction - 180
						x_to = x - lengthdir_x(_knockback, _knock_direction);
						y_to = y - lengthdir_y(_knockback, _knock_direction);
					} else {
						state = state_previous
					}
				}
			}
		}	
	}
}