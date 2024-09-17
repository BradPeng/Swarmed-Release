/// @description Insert description here
// You can write your code in this editor
var _area_size_buff =  global.player_area_size_bonus_percent/100; 
orbit_distance = 64 + 64 * _area_size_buff * 3; //manually make gap bigger
image_xscale = image_xscale + image_xscale * _area_size_buff
image_yscale = image_yscale + image_yscale * _area_size_buff
orbit_speed = 5;  
orbit_angle = 0;  
damage = 1
knockback = 10
player = instance_find(obj_player, 0);
damaged_enemies = ds_list_create();
hit_list_clear_time = 30
hit_list_clear_timer = 0
