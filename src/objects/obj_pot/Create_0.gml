/// @description Drop items
event_inherited();
image_speed = 0;
entity_drop_list = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
	[obj_bomb_drop, obj_coin],
	[obj_magnet_orb],
	[obj_heal]
);

