
upgrades = global.permanent_upgrades
var _area_height = 0;
var _max_width = 4; // Number of cards per row
var _card_width = sprite_get_width(spr_augment_card);
var _card_height = sprite_get_height(spr_augment_card);
var _horizontal_spacing = sprite_get_width(spr_augment_card) + 10;
var _vertical_spacing = sprite_get_height(spr_augment_card) + 10;

var _xx = 100;
var _yy = 125;

var _n = array_length(upgrades); 
var _counter = 0;

for (var _i = 0; _i < _n; _i++) {
    var _card = instance_create_layer(_xx, _yy, "Instances", obj_store_card);
    _card.number = _counter; 
    _card.upgrade_name = upgrades[_i].name
    _card.upgrade_cost = upgrades[_i].cost
    _card.upgrade_level = upgrades[_i].level
	// Update the position for the next card
    if ((_i + 1) % _max_width == 0) {
		// Move to the next row
        _xx = 100;
        _yy += _vertical_spacing;
    } else {
		// Move to the next column
        _xx += _horizontal_spacing;
    }
    
    _counter++;
}

// Update areaHeight after all cards are created
_area_height = _yy + _card_height;


// subtract number of rows + 1 worth of spacing 
global.shop_max_width = _area_height - (_n div _max_width + 1)*_vertical_spacing; 
