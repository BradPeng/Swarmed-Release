function drop_items(x, y, _items) {
	var _items_length = array_length(_items);
	if (_items_length > 1) {
		var _angle_per_item = 360/_items_length;
		var _angle = random(360);
		for(var _i = 0; _i < _items_length; _i++) {
			var _random_x = irandom_range(3, 5) * choose(-1, 1)
			var _random_y = irandom_range(3, 5) * choose(-1, 1)
			with (instance_create_layer(x +_random_x , y + _random_y, "Instances", _items[_i])) {
				direction = _angle;
				spd = 0.75 + (_items_length * 0.1) + random(0.1);
			}
			_angle += _angle_per_item;
		}
		
		
	} else if (_items_length == 1) {
		instance_create_layer(x, y, "Instances", _items[0]);
	}
}