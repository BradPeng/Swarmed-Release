// Grid setup
var _cell_size = 16;  // Size of each grid cell
var _grid_width = room_width div _cell_size;
var _grid_height = room_height div _cell_size;

// Create the grid
grid = mp_grid_create(0, 0, _grid_width, _grid_height, _cell_size, _cell_size);

// Add the solid objects to the grid
mp_grid_add_instances(grid, obj_enemy_path_finding_solid, false);
mp_grid_add_instances(grid, obj_mob_permeable_solid, false);
path = path_add();
// Initialize variables for bounding box and movement
spawn_x = x;
spawn_y = y;
box_size = 300;

// Initialize variables for sporadic movement
sporadic_mode = false;
sporadic_timer = 0;
sporadic_duration_min = 30
sporadic_duration_max = 60
sporadic_duration = irandom_range(sporadic_duration_min, sporadic_duration_max);
sporadic_chance = 10;

pause_timer = 0;  
pause_duration_min = 10
pause_duration_max = 30
pause_duration = irandom_range(pause_duration_min, pause_duration_max);  
move_timer = 0;  
move_duration_min = 30
move_duration_max = 90
move_duration = irandom_range(move_duration_min, move_duration_max);  
is_paused = false;

stay_timer = 0;  
win_time = 1;  


path_update_timer = 0;
path_update_interval = 0;  
move_speed_max = 2
move_speed_min = 4
move_speed = irandom_range(move_speed_max, move_speed_min);