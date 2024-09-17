var _player_health = global.player_health;
var _player_health_max = global.player_health_max;
display_set_gui_size(display_get_width() / 2, display_get_height() / 2);
display_set_gui_maximise(3, 3, 0, 0);
gpu_set_texfilter(false);
var _current_xp = global.player_xp
var _total_xp = global.player_xp_to_next_level

// Money
if (room != rm_instructions and room != rm_instructions_2) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	var _money_x = RESOLUTION_W - sprite_get_width(spr_coin_background)
	draw_sprite(spr_coin_background, 0, _money_x, 0)
	var _player_money = string(global.player_money);

	while (string_length(_player_money) < 5) {
	    _player_money = "0" + _player_money;
	}
	draw_set_font(fnt_text_enlarged)
	draw_set_color(c_white)
	draw_text(RESOLUTION_W - 10, sprite_get_height(spr_coin_background)/2 + 1, _player_money)
}

if (room == rm_warehouse_district or room == rm_forest) {
	// Score
	draw_sprite(spr_score_background, 0, 0, 0)
	draw_text(sprite_get_width(spr_score_background)-7, sprite_get_height(spr_score_background)/2 + 1, global.level_score)


	// Player stats 
	#region
	var _level_box_height = sprite_get_height(spr_level_box)
	var _xp_bar_width = 100
	var _xp_bar_height = _level_box_height/2
	var _health_bar_width = 100
	var _health_bar_height = _level_box_height/2

	var _health_bar_x = RESOLUTION_W / 2 - _health_bar_width/2
	var _health_bar_y = RESOLUTION_H - _xp_bar_height - _health_bar_height

	var _xp_bar_x = RESOLUTION_W/2 - _xp_bar_width/2
	var _xp_bar_y = RESOLUTION_H - _xp_bar_height
	/// Draw health bar
	draw_sprite_stretched(spr_healthbar_background, 0, _health_bar_x, _health_bar_y, 100, _health_bar_height);
	draw_sprite_stretched(spr_healthbar, 0, _health_bar_x, _health_bar_y, 100 * _player_health/_player_health_max, _xp_bar_height);

	// XP bar
	draw_sprite_stretched(spr_xp_bar_background, 0, _xp_bar_x, _xp_bar_y, 100, _xp_bar_height);
	draw_sprite_stretched(spr_xp_bar, 0, _xp_bar_x, _xp_bar_y, 100 * _current_xp/_total_xp, _xp_bar_height);

	// level box
	var _level_box_x = _xp_bar_x - _level_box_height 
	var _level_box_y = RESOLUTION_H - _level_box_height
	var _level_box_center_x = _level_box_x + _level_box_height / 2 + 0.5 //manually nudge number over a bit;
	var _level_box_center_y = _level_box_y + _level_box_height / 2 + 0.5 //manually nudge number over a bit;;
	draw_sprite(spr_level_box, 0, _level_box_x, _level_box_y);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_text_enlarged);
	var _level_text = string(global.player_level); // Replace with the actual level variable
	draw_text(_level_box_center_x, _level_box_center_y, _level_text);

	// xp UI

	var _xx = _xp_bar_x + _xp_bar_width;
	var _yy = RESOLUTION_H - _level_box_height;
	draw_sprite(spr_item_box, 0, _xx, _yy);
	if (global.player_has_any_items) {
		draw_sprite(spr_item_ui, global.player_equipped, _xx, _yy);
		if (global.player_ammo[global.player_equipped] != -1) {
			draw_set_color(c_white);
			draw_set_font(fnt_text_mini);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			var _x_pos = _xx + sprite_get_width(spr_item_ui_box) + 5
			var _y_pos = _yy + sprite_get_height(spr_item_ui_box) -6
			var _txt = "x" + string(global.player_ammo[global.player_equipped])
		
			// shadow
			draw_set_color(c_black);
			draw_text(_x_pos + 1, _y_pos + 1, _txt);
		
			// actual text
			draw_set_color(c_white);
			draw_text(
				_x_pos,
				_y_pos,
				_txt
			);
		
		
		}
	}
	#endregion


	// Time
	#region
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_text_enlarged);
	var _time_padding = 30
	draw_sprite(spr_time_background, 0, RESOLUTION_W/2  - sprite_get_width(spr_time_background)/2, _time_padding - sprite_get_height(spr_time_background)/2)
	draw_text(RESOLUTION_W/2, _time_padding, seconds_to_game_time(global.game_time))
	draw_set_font(fnt_text);
	#endregion
}
// Pause screen
#region 
if (global.game_paused) {
	ui_darken_background()
	if (global.level_up_screen == false) {
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fnt_text_enlarged);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		//var _player = instance_find(obj_player
		if (obj_player.state == player_state_dead) {

			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...Game Over...");
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5+18, "Score: " + string(global.level_score));
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5+36, "High Score: " + string(global.high_score));
			
			draw_set_font(fnt_text);
			for (var _i = 0; _i < array_length(death_options); _i++) {
				var _print = "";
				if (_i == death_option_selected) {
					_print += "> " + death_options[_i] + " <";	
				} else {
					_print += death_options[_i];
					draw_set_alpha(0.75);
				}
		
				draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 54 + _i * 16, _print);
				draw_set_alpha(1)
			}
		} else if (global.victory_screen == true) {
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...VICTORY...");
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5+18, "Score: " + string(global.level_score));
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5+36, "High Score: " + string(global.high_score));

			draw_set_font(fnt_text);
			for (var _i = 0; _i < array_length(victory_options); _i++) {
				var _print = "";
				if (_i == victory_option_selected) {
					_print += "> " + victory_options[_i] + " <";	
				} else {
					_print += victory_options[_i];
					draw_set_alpha(0.75);
				}
		
				draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 54 + _i * 16, _print);
				draw_set_alpha(1)
			}
		} else { //regular pause menu
		// text
			draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...Game Paused...");
			draw_set_font(fnt_text);
			for (var _i = 0; _i < array_length(pause_option); _i++) {
				var _print = "";
				if (_i == pause_option_selected) {
					_print += "> " + pause_option[_i] + " <";	
				} else {
					_print += pause_option[_i];
					draw_set_alpha(0.75);
				}
		
				draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 + _i * 16, _print);
				draw_set_alpha(1)
			}
		}
	} 
}
#endregion




