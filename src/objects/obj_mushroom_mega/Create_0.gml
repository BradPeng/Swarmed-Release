/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_script[ENEMYSTATE.CHASE] = hostile_mob_basic_chase;
state = ENEMYSTATE.CHASE;
idle_sprite = spr_mushroom_mega_idle;
hurt_sprite = spr_mushroom_mega_hurt;
move_sprite = spr_mushroom_mega_walk;


entity_drop_list = choose(
	[obj_xp_small],
);
