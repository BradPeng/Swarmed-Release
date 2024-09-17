/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
grid_type = global.grid_32
enemy_script[ENEMYSTATE.CHASE] = hostile_mob_basic_chase_new;
state = ENEMYSTATE.CHASE;
idle_sprite = spr_mushroom_idle;
hurt_sprite = spr_mushroom_hurt;
move_sprite = spr_mushroom_walk;


entity_drop_list = choose(
	[obj_xp_small],
	[obj_xp_medium],
	[obj_xp_large]
);
