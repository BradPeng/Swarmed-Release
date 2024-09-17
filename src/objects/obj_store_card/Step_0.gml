y = ystart - ((global.shop_max_width / 100) * obj_slider.percentage);
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
	// Mouse is hovering over the object
    image_xscale = 1.1; // Enlarge the sprite by 10%
    image_yscale = 1.1;
	if (mouse_check_button_pressed(mb_left)) {
		selected = true	
	}
	hovered = true
	
	if (!previous_hovered) {
		audio_play_sound(snd_retro_1, 1, false)
	}
	
} else {
	hovered = false	
}

if (selected) {
	var _upgrades = global.permanent_upgrades
	for (var _i = 0; _i < array_length(_upgrades); _i++) {
		
        if (_upgrades[_i].name == upgrade_name) {
			// Check if the player has enough currency
            if (global.player_money >= _upgrades[_i].cost) {
				// Deduct the cost from player's money
                global.player_money -= _upgrades[_i].cost;
				// Increment the level of the upgrade
                global.permanent_upgrades[_i].level += 1;
				upgrade_level++
				audio_play_sound(snd_retro_8, 1, false)
            } else {
				audio_play_sound(snd_retro_12, 1, false)	
				flash = 1
			}
			selected = false

            break;
        } 
    }
}
previous_hovered = hovered;