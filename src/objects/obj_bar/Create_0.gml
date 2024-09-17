top_limit = y - (sprite_height/2) + (image_xscale) + 10;
bottom_limit = y + (sprite_height/2) - (image_xscale) - 10;

a = instance_create_layer(x, y, "store_ui", obj_slider);
a.image_xscale = image_xscale;
a.image_yscale = image_yscale;
a.bar_length = sprite_height;
a.top_limit = top_limit;
a.bottom_limit = bottom_limit;
a.y = top_limit;
a.depth = depth - 1;