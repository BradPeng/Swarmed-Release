/// @description Insert description here
// You can write your code in this editor

draw_sprite(
	spr_mini_map_border, 
	0, 
	camera_get_view_width(view_camera[0]) - sprite_get_width(spr_mini_map_border), 
	camera_get_view_height(view_camera[0]) - sprite_get_height(spr_mini_map_border)
)


if (!surface_exists(surf_mini_map_bg)) {
	refresh_map_bg()	
}

var _map_offset = 13
draw_surface(surf_mini_map_bg, x-_map_offset, y-_map_offset)

if (!surface_exists(surf_mini_map_entities)) {
	surf_mini_map_entities = surface_create(w, h)	
}

surface_set_target(surf_mini_map_entities)
draw_clear_alpha(c_black, 0.0)

with (obj_p_hostile_mob){
	if (entity_on_mini_map) {
		draw_sprite_ext(spr_mini_map_enemy, 0, x/16 - _map_offset, y/16 - _map_offset, 1.0, 1.0, 0.0, c_red, 1.0)
	}
}

with (obj_ball_goal) {
	draw_sprite_ext(spr_ball_goal_minimap, 0, x/16 - _map_offset, y/16 - _map_offset, 1.0, 1.0, 0.0, c_red, 1.0)	
}

with (obj_yumi_quest){
	draw_sprite_ext(spr_yumi_quest_minimap, 0, x/16 - _map_offset, y/16 - _map_offset, 1, 1, 0.0, c_white, 1.0)
}

with (obj_player){
	draw_sprite_ext(spr_mini_map_player, 0, x/16 - _map_offset, y/16 - _map_offset, 1.0, 1.0, 0.0, c_white, 1.0)
}




surface_reset_target()
draw_surface(surf_mini_map_entities, x, y)
