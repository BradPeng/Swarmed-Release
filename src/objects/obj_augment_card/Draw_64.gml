/// @description Insert description here
// You can write your code in this editor


// Draw the card's text in the GUI layer
var _camera = view_camera[0];
var _cam_x = camera_get_view_x(_camera);
var _cam_y = camera_get_view_y(_camera);

// Calculate the screen position
var _screen_x = x - _cam_x;
var _screen_y = y - _cam_y;
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if (hovered) {
	draw_sprite_ext(spr_augment_card, 0, _screen_x, _screen_y, 1.1, 1.1, 0, c_white, 1)
    draw_set_font(fnt_text_enlarged);
} else {
	draw_sprite(spr_augment_card, 0, _screen_x, _screen_y)
    draw_set_font(fnt_text);
}
// Determine the maximum width for the text (e.g., card's width minus padding)
var _max_width = sprite_width - 20; // Adjust padding as needed

// Get the text to be displayed based on the buff type
var _buff_type_string = "";
if (upgrade_type == "Level Up") {
	if (buff_type == BUFFS.PROJECTILE) {
	    _buff_type_string = "+1 Projectile";
	} else if (buff_type == BUFFS.DAMAGE) {
	    _buff_type_string = "+1 Damage";
	} else if (buff_type == BUFFS.BACK_SHOT) {
	    _buff_type_string = "+1 Backshot";
	} else if (buff_type == BUFFS.HEALTH_REGEN) {
	    _buff_type_string = "+0.25 Health Per Second";
	} else if (buff_type == BUFFS.XP) {
	    _buff_type_string = "+10% XP";
	} else if (buff_type == BUFFS.AREA_SIZE) {
	    _buff_type_string = "+10% Area Size";
	} else if (buff_type == BUFFS.PICKUP_RADIUS) {
	    _buff_type_string = "+10 Pickup Radius";
	} else if (buff_type == BUFFS.BARREL_BLASTER) {
	    _buff_type_string = "Unlock Barrel Blaster";
	} else if (buff_type == BUFFS.ROTATING_BLADES) {
	    _buff_type_string = "Unlock Rotating Blades";
	} else if (buff_type == BUFFS.BUNNY_CROSSBOW) {
	    _buff_type_string = "Unlock Bunny Crossbow";
	} else if (buff_type == BUFFS.RADIANT_FIELD) {
	    _buff_type_string = "Unlock Radiant Field";
	}
} else if (upgrade_type == "Augment") {
	if (buff_type == AUGMENTS.CROSS_COUNTRY) {
	    _buff_type_string = "Cross Country";
	} else if (buff_type == AUGMENTS.MORE_DAMAGE) {
	    _buff_type_string = "+10 Damage";
	} else if (buff_type == AUGMENTS.MORE_PROJECTILES) {
	    _buff_type_string = "+10 Projectiles";
	} else if (buff_type == AUGMENTS.MORE_AREA_SIZE) {
	    _buff_type_string = "+100% Area Size";
	} else if (buff_type == AUGMENTS.MORE_XP) {
	    _buff_type_string = "+100% XP";
	} else if (buff_type == AUGMENTS.MORE_BACK_SHOTS) {
	    _buff_type_string = "+10 Backshots";
	} 
} else {
		_buff_type_string = "ERROR"
}


// Split the string into words
var _words = string_split(_buff_type_string, " ");
var _current_line = "";
var _lines = [];
var _line_height = string_height("A"); // Approximate height of a line

// Wrap text manually
for (var _i = 0; _i < array_length(_words); _i++) {
    var _word = _words[_i];
    var _potential_line = _current_line == "" ? _word : _current_line + " " + _word;
    
	// Check if the line width exceeds the max width
    if (string_width(_potential_line) > _max_width) {
		// Add the current line to the list of lines and start a new line
        _lines[array_length(_lines)] = _current_line;
        _current_line = _word;
    } else {
		// Add the word to the current line
        _current_line = _potential_line;
    }
}

// Add the last line
if (_current_line != "") {
    _lines[array_length(_lines)] = _current_line;
}

// Calculate the starting Y position for centered text
var _total_height = array_length(_lines) * _line_height;
var _start_y = _screen_y; // This will now be in screen coordinates

// Draw each line of wrapped text
for (var _j = 0; _j < array_length(_lines); _j++) {
    var _line_y = _start_y + _j * _line_height;
    
	// Draw shadow for better readability
    draw_set_color(c_black);
    draw_text(_screen_x + 1, _line_y + 1, _lines[_j]); // Shadow
    
	// Draw the actual text
    draw_set_color(c_white);
    draw_text(_screen_x, _line_y, _lines[_j]);
}

// Reset font
draw_set_font(fnt_text);

