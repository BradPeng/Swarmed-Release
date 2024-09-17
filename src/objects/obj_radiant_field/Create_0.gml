/// @description Insert description here
// You can write your code in this editor

image_xscale = image_xscale + image_xscale * global.player_area_size_bonus_percent/100
image_yscale = image_yscale + image_yscale * global.player_area_size_bonus_percent/100
damaged_enemies = ds_list_create();
hit_list_clear_time = 30
hit_list_clear_timer = 0
damage = 1
knockback = 0