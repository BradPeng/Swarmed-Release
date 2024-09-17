/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
if (hovered) {
    draw_sprite_ext(sprite, 0, x, y, 1.1, 1.1, 0, c_white, 1);
    draw_set_font(fnt_text_enlarged);
} else {
    draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, c_white, 1);

    draw_set_font(fnt_text);
}

var _words = string_split(upgrade_name, " ");
var _current_line = "";
var _lines = [];
var _line_height = string_height("A"); // Approximate height of a line
var _max_width = sprite_width - 50; // Adjust padding as needed

// Wrap text manually
// Wrap text manually with line break support
for (var _i = 0; _i < array_length(_words); _i++) {
    var _word = _words[_i];

    // Check for special line break character in the word
    if (string_pos("|", _word) > 0) {
        // Split the word at the special character
        var _split_word = string_replace_all(_word, "|", "");

        // Add the current line to the list of lines
        _lines[array_length(_lines)] = _current_line;
        
        // Start a new line with the word after the break character
        _current_line = _split_word;

        // Immediately add the split word as a new line and reset _current_line
        _lines[array_length(_lines)] = _current_line;
        _current_line = "";
    } else {
        // Standard wrapping logic
        var _potential_line = _current_line == "" ? _word : _current_line + " " + _word;

        // Check if the line width exceeds the max width
        if (string_width(_potential_line) > _max_width) {
            _lines[array_length(_lines)] = _current_line;
            _current_line = _word;
        } else {
            _current_line = _potential_line;
        }
    }
}
// Add the last line
if (_current_line != "") {
    _lines[array_length(_lines)] = _current_line;
}

// Calculate the starting Y position for centered text
var _total_height = array_length(_lines) * _line_height;
var _start_y = y - (_total_height / 2) - 20; // Center the text vertically within the card then -30

var _level_y = 0
// Draw each line of wrapped text
for (var _j = 0; _j < array_length(_lines); _j++) {
    var _line_y = _start_y + _j * _line_height;
    
	// Draw shadow for better readability
    draw_set_color(c_black);
    draw_text(x + 1, _line_y + 1, _lines[_j]); // Shadow
    
	// Draw the actual text
    draw_set_color(c_white);
    draw_text(x, _line_y, _lines[_j]);
	_level_y = _line_y
}


// Level of upgrade
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _text =  "Level: " + string(upgrade_level)
draw_text(x+1, _level_y + 10 + 1, _text) // Shadow
draw_set_color(c_white);
draw_text(x, _level_y + 10, _text)

// Cost of upgrade
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
_text = "Cost: " + string(upgrade_cost)
draw_text(x+1, _level_y + _line_height*2 + 1 + 10, _text ) // Shadow
draw_set_color(c_white);
draw_text(x, _level_y + _line_height*2+ 10, _text)

if (flash != 0) {
	if (hovered) {
	 draw_sprite_ext(sprite, 0, x, y, 1.1, 1.1, 0, c_red, 0.5);
	} else {
	 draw_sprite_ext(sprite, 0, x, y, 1, 1, 0, c_red, 0.5);
	} 
}

