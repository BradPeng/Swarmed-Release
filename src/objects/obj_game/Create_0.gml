global.active_yumi_quest = -1
global.level_score = 0
global.game_time = 0
randomize()

global.high_score = 0
global.game_save_slot = 0;
global.level_up_screen = false
global.victory_screen = false
global.game_paused = false;
global.i_camera = instance_create_layer(0, 0, layer, obj_camera)
global.i_ui =  instance_create_layer(0,0, layer, obj_ui);
global.text_speed = 0.75;
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;
global.i_lifted = noone;

global.player_health_max = 100;
global.player_health = global.player_health_max;

global.player_money = 0;
global.player_xp = 0;
global.player_base_xp = 100

global.player_level = 1
global.player_xp_to_next_level = global.player_base_xp

// buffs
global.player_damage_bonus = 0
global.player_max_health_bonus = 0
global.player_health_regen = 0
global.player_pickup_radius_bonus = 0
global.player_area_size_bonus_percent = 0
global.player_projectile_bonus = 0
global.player_xp_bonus_percent = 0
global.player_back_shot = 0

global.player_unlocked_level = []
global.player_unlocked_augment = []
global.yumi_quest_completed = []
global.yumi_quest_active = false
for (var _i = 0; _i < YUMI_QUESTS.YUMI_QUESTS_LENGTH; _i++) {
	global.yumi_quest_completed[_i] = false;
}

// items
global.player_has_any_items = true;
global.player_equipped = ITEM.BOMB;
global.player_ammo = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's. -1 means don't show ammo amount
global.player_item_unlocked = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's

global.player_item_unlocked[ITEM.BOMB] = true;
global.player_ammo[ITEM.BOMB] = 3;

global.player_item_unlocked[ITEM.MEDKIT] = true;
global.player_ammo[ITEM.MEDKIT] = 3;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START);

// SHOOTING
global.weapon_list = {
	default_weapon : weapon_create(
		spr_arrow, 
		sprite_get_bbox_right(spr_arrow), 
		obj_arrow, 
		9,
		1,
		0
	),
	barrel_blaster : weapon_create(
		spr_barrel, 
		sprite_get_bbox_right(spr_barrel), 
		obj_barrel_bullet, 
		60,
		1,
		45
	)
}

global.player_weapons = array_create(0)
global.permanent_upgrades = [
	{ name: "Damage", cost: 100, level: 0},
	{ name: "Maximum Health", cost: 100, level: 0 },
	{ name: "Health Regen", cost: 100, level: 0 },
	{ name: "Pickup Radius", cost: 100 , level: 0},
	{ name: "Area Size", cost: 100, level: 0 },
	{ name: "Projectiles", cost: 100 , level: 0},
	{ name: "XP", cost: 100 , level: 0},
	{ name: "Back| Shots", cost: 100 , level: 0}, 
]
global.shop_max_width = 0
load_game()
