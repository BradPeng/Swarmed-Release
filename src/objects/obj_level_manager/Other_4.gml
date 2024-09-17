/// @description Insert description here
// You can write your code in this editor
reset_level()
global.grid_48 = mp_grid_create(240, 240, 30, 30, 48, 48);
mp_grid_add_instances(global.grid_48, obj_enemy_path_finding_solid, false);
mp_grid_add_instances(global.grid_48, obj_other_path_object, false);

global.grid_16 = mp_grid_create(240, 240, 90, 90, 16, 16);
mp_grid_add_instances(global.grid_16, obj_enemy_path_finding_solid, false);
mp_grid_add_instances(global.grid_16, obj_other_path_object, false);

global.grid_32 = mp_grid_create(240, 240, 45, 45, 32, 32);
mp_grid_add_instances(global.grid_32, obj_enemy_path_finding_solid, false);
mp_grid_add_instances(global.grid_32, obj_other_path_object, false);