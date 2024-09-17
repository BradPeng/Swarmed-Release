function refresh_map_bg() {
	// Free the existing minimap background surface if it exists
    if (surface_exists(surf_mini_map_bg)) {
        surface_free(surf_mini_map_bg);
    }
	
	// Create a new minimap background surface
    surf_mini_map_bg = surface_create(w, h);
    var _zoom_padding_x = 0;
    var _zoom_padding_y = 0;

    var _center_x = 0;
    var _center_y = 0;

	// Calculate the top-left corner
    var _draw_x = clamp(_center_x - (room_width - 2 * _zoom_padding_x) / 2, 0, room_width - (room_width - 2 * _zoom_padding_x));
    var _draw_y = clamp(_center_y - (room_height - 2 * _zoom_padding_y) / 2, 0, room_height - (room_height - 2 * _zoom_padding_y));

	// Create a temporary surface to hold the cropped room area
    var _surf_temp = surface_create(room_width - 2 * _zoom_padding_x, room_height - 2 * _zoom_padding_y);

	// Set the target to the temporary surface
    surface_set_target(_surf_temp);
    draw_clear(c_black); // Clear the surface with black color
    
	// Adjust the drawing position by offsetting by draw_x and draw_y
    
	draw_set_color(c_black); 
    var _base_layer_width = room_width; 
    var _base_layer_height = room_height; 

    draw_rectangle(-_draw_x, -_draw_y, -_draw_x + _base_layer_width, -_draw_y + _base_layer_height, false);
 /*   
    // Replace the "gentle_forest" layer tiles with black color
    var layer_id = layer_get_id("gentle_forest_reachable");
    var tilemap_id = layer_tilemap_get_id(layer_id);
    
    var tile_width = tilemap_get_tile_width(tilemap_id);
    var tile_height = tilemap_get_tile_height(tilemap_id);
    var map_width = tilemap_get_width(tilemap_id);
    var map_height = tilemap_get_height(tilemap_id);
    
    draw_set_color(c_aqua); 

    // Loop through each tile in the tilemap
    for (var i = 0; i < map_width; i++) {
        for (var j = 0; j < map_height; j++) {
            var tile = tilemap_get(tilemap_id, i, j);
            if (tile != 0) { // Check if there is a tile at this position
                var tile_x = i * tile_width;
                var tile_y = j * tile_height;
                draw_rectangle(tile_x - _draw_x, tile_y - _draw_y, tile_x + tile_width - _draw_x, tile_y + tile_height - _draw_y, false);
            }
        }
    }
	
	// Make regular path blue
	layer_id = layer_get_id("gentle_forest_unreachable");
    tilemap_id = layer_tilemap_get_id(layer_id);
    
    
    draw_set_color(c_black);

    // Loop through each tile in the tilemap
    for (var i = 0; i < map_width; i++) {
        for (var j = 0; j < map_height; j++) {
            var tile = tilemap_get(tilemap_id, i, j);
            if (tile != 0) { // Check if there is a tile at this position
                var tile_x = i * tile_width;
                var tile_y = j * tile_height;
                draw_rectangle(tile_x - _draw_x, tile_y - _draw_y, tile_x + tile_width - _draw_x, tile_y + tile_height - _draw_y, false);
            }
        }
    }*/

	// Reset the drawing color to white for other drawings
    draw_set_color(c_white);
	//draw_tilemap(layer_tilemap_get_id(layer_get_id("tree_wall")), -_draw_x, -_draw_y); 

	switch (room) {
		case rm_warehouse_district:
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_reachable")), -_draw_x, -_draw_y); 
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_path")), -_draw_x, -_draw_y);
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_unreachable")), -_draw_x, -_draw_y); 
			break;
		case rm_lobby:
			draw_tilemap(layer_tilemap_get_id(layer_get_id("base")), -_draw_x, -_draw_y); 
			draw_tilemap(layer_tilemap_get_id(layer_get_id("homestead")), -_draw_x, -_draw_y);
			draw_tilemap(layer_tilemap_get_id(layer_get_id("village_extras")), -_draw_x, -_draw_y); 
			break;
		case rm_forest:
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_reachable")), -_draw_x, -_draw_y); 
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_path")), -_draw_x, -_draw_y);
			draw_tilemap(layer_tilemap_get_id(layer_get_id("gentle_forest_unreachable")), -_draw_x, -_draw_y); 
			draw_tilemap(layer_tilemap_get_id(layer_get_id("tree_wall")), -_draw_x, -_draw_y); 
			break;
	} 

    surface_reset_target();

    surface_set_target(surf_mini_map_bg);
    draw_surface_stretched(_surf_temp, 0, 0, w, h);

    surface_reset_target();

    surface_free(_surf_temp);
}