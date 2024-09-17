/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
// Grid setup
var _cell_size = 16;  // Size of each grid cell
var _grid_width = room_width div _cell_size;
var _grid_height = room_height div _cell_size;

// Create the grid
grid = mp_grid_create(0, 0, _grid_width, _grid_height, _cell_size, _cell_size);

// Add the solid objects to the grid
mp_grid_add_instances(grid, obj_enemy_path_finding_solid, false);
path = path_add();
enemy_script[GREMLIN_BOSS_STATE.CHASE] = gremlin_boss_chase

enemy_script[GREMLIN_BOSS_STATE.ATTACK] = gremlin_boss_attack
enemy_script[GREMLIN_BOSS_STATE.DIE] = orc_die
enemy_script[GREMLIN_BOSS_STATE.SHOOT] = gremlin_boss_shoot
enemy_script[GREMLIN_BOSS_STATE.SUMMON] = gremlin_boss_summon
move_sprite = spr_gremlin_blue_run
attack_sprite = spr_gremlin_blue_attack
die_sprite = spr_gremlin_blue_die
shoot_sprite = spr_gremlin_blue_shoot
summon_sprite = spr_gremlin_blue_call
attack_1_cd = 60;
origin_y_offset = 83

shoot_attack_timer = 0
shoot_attack_delay = 180

summon_animation_counter = 0
summon_timer = 0
summon_delay = 30 * 60
summon_count = 0
summon_count_max = 5

number_of_shots = 0
max_number_of_shots = 5

state = GREMLIN_BOSS_STATE.CHASE