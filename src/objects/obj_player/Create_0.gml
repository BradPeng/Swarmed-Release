current_shoot = 0
key_left = 0
key_right = 0
key_up = 0
key_down = 0
key_activate = 0
key_item = 0
key_item_select_up = 0
key_item_select_down = 0
key_dodge = 0
key_up_release = 0
key_cheat = 0
input_direction = 0
input_magnitude = 0
aim_direction = 0
shoot_key = 0
key_next_weapon = 0
key_test_feature = 0
key_delete_save = 0
// time before next shot
shoot_timer = 0;

state = player_state_free;
last_state = state;
hit_by_attack_list = -1;
image_speed = 0;
h_speed = 0;
v_speed = 0;
z = 0;
speed_walk = 4.0;
speed_roll = 5.0;
distance_dodge = 50;
speed_dodge = 3
distance_bonk = 60;
distance_bonk_height = 20;
distance_roll = 60;
speed_bonk = 1.5
animation_end_script = -1;
action_animation_end = false
end_action_frame = -1
invulnerable = 0;
flash = 0;
flash_shader = sh_red_flash;

run_sprite = spr_player_run;
idle_sprite = spr_player;
local_frame = 0;

if (global.target_x != -1) {
	x = global.target_x;
	y = global.target_y;
	direction = global.target_direction;
}

if (global.i_lifted != noone) {
	//idle_sprite = s_player_carrying;
	//run_sprite = s_player_run_carrying;
	//sprite_index = idle_sprite;
}

// PLATFORM VARIABLES

// Platform Variables
max_speed = 4;
acceleration = 1;
gravity_acceleration = .3;
jump_height = -8;
grab_width = 14;

u_flash = 0

// SHOOTING
bullet_obj = noone

var _global_weapons = global.weapon_list
array_push(global.player_weapons, _global_weapons.default_weapon)

selected_weapon = 0;
weapon = global.player_weapons[selected_weapon]
health_regen_timer = 0
magnet_range = 50
cross_country = false
cross_country_distance = 0