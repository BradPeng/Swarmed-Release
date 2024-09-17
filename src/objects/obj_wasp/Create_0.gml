/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
grid_type = global.grid_48
enemy_script[ENEMYSTATE.CHASE] = bat_chase_new;
state = ENEMYSTATE.CHASE;
idle_sprite = spr_wasp_run_single;
hurt_sprite = spr_wasp_run_single;
move_sprite = spr_wasp_run_single;


entity_drop_list = choose(
	[obj_xp_large],
	[obj_xp_large]
);
