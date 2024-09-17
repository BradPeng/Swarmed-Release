/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_script[ENEMYSTATE.CHASE] = bat_chase_new;
state = ENEMYSTATE.CHASE;
idle_sprite = spr_crab_move_single;
hurt_sprite = spr_crab_move_single;
move_sprite = spr_crab_move_single;


entity_drop_list = choose(
	[obj_xp_small],
	[obj_xp_small],
	[]
);
