/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
	// Mouse is hovering over the object
    image_xscale = 1.1; // Enlarge the sprite by 10%
    image_yscale = 1.1;
	if (mouse_check_button_pressed(mb_left)) {
		selected = true	
	}
	hovered = true
} else {
	// Mouse is not hovering over the object
    image_xscale = 1.0; // Reset to original size
    image_yscale = 1.0;
	hovered = false
}

if selected {

	global.game_paused = false
	unpause_game()
	global.level_up_screen = false
		
	if (upgrade_type == "Level Up") {
		if (buff_type == BUFFS.PROJECTILE) {
			global.player_projectile_bonus++;
			remake_rotating_blades = true
			remake_bunny_crossbow = true


		} else if (buff_type == BUFFS.DAMAGE) {
			global.player_damage_bonus += 1;
			remake_rotating_blades = true
			remake_radiant_field = true
		
		} else if (buff_type == BUFFS.PICKUP_RADIUS) {
			global.player_pickup_radius_bonus += 10	
		} else if (buff_type == BUFFS.HEALTH_REGEN) {
			global.player_health_regen += 0.25
		} else if (buff_type == BUFFS.XP) {
			global.player_xp_bonus_percent += 10
		} else if (buff_type == BUFFS.BACK_SHOT) {
			global.player_back_shot++	
		} else if (buff_type == BUFFS.AREA_SIZE) {
			global.player_area_size_bonus_percent += 10
			remake_rotating_blades = true
			remake_radiant_field = true

		} else if (buff_type == BUFFS.BARREL_BLASTER) {
			array_push(global.player_weapons, global.weapon_list.barrel_blaster)	
			array_push(global.player_unlocked_level, BUFFS.BARREL_BLASTER)
		} else if (buff_type == BUFFS.ROTATING_BLADES) {
			create_rotating_blades()
			array_push(global.player_unlocked_level, BUFFS.ROTATING_BLADES)
		} else if (buff_type == BUFFS.BUNNY_CROSSBOW) {
			instance_create_layer(x, y, "Instances", obj_bunny_crossbow)
			array_push(global.player_unlocked_level, BUFFS.BUNNY_CROSSBOW)
		} else if (buff_type == BUFFS.RADIANT_FIELD) {
			instance_create_layer(x, y, "Instances", obj_radiant_field)
			array_push(global.player_unlocked_level, BUFFS.RADIANT_FIELD)
		}
	} else if (upgrade_type == "Augment") {
		if (buff_type == AUGMENTS.CROSS_COUNTRY) {
			array_push(global.player_unlocked_augment, AUGMENTS.CROSS_COUNTRY)
			with (obj_player) {
				cross_country = true
				cross_country_distance = 0
			}
			
		} else if (buff_type == AUGMENTS.MORE_DAMAGE) {
			global.player_damage_bonus += 10;
			array_push(global.player_unlocked_augment, AUGMENTS.MORE_DAMAGE)
			
			remake_rotating_blades = true
			remake_radiant_field = true

		} else if (buff_type == AUGMENTS.MORE_PROJECTILES) {
			array_push(global.player_unlocked_augment, AUGMENTS.MORE_PROJECTILES)
			global.player_projectile_bonus += 10;
			remake_rotating_blades = true
			remake_bunny_crossbow = true
		} else if (buff_type == AUGMENTS.MORE_AREA_SIZE) {
			array_push(global.player_unlocked_augment, AUGMENTS.MORE_AREA_SIZE)
			global.player_area_size_bonus_percent += 10;
			remake_rotating_blades = true
			remake_radiant_field = true
		} else if (buff_type == AUGMENTS.MORE_XP) {
			array_push(global.player_unlocked_augment, AUGMENTS.MORE_XP)
			global.player_xp_bonus_percent += 100;
		} else if (buff_type == AUGMENTS.MORE_BACK_SHOTS) {
			array_push(global.player_unlocked_augment, AUGMENTS.MORE_BACK_SHOTS)
			global.player_back_shot += 10;
		}
	}
	
	if (remake_rotating_blades) {
		if (array_contains(global.player_unlocked_level, BUFFS.ROTATING_BLADES)) {
			with (obj_rotating_blades) {
				instance_destroy();
			}
			create_rotating_blades()	
		}
	}
	
	if (remake_radiant_field) {
		if (array_contains(global.player_unlocked_level, BUFFS.RADIANT_FIELD)) {
			with (obj_radiant_field) {
				instance_destroy();
			}
			instance_create_layer(x, y, "Instances", obj_radiant_field)
		}
	}
	
	if (remake_bunny_crossbow) {
		if (array_contains(global.player_unlocked_level, BUFFS.BUNNY_CROSSBOW)) {
			with (obj_bunny_crossbow) {
				instance_destroy();
			}
			instance_create_layer(x, y, "Instances", obj_bunny_crossbow)
		}
	}

	instance_destroy(obj_augment_card)
}

