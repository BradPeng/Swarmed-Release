

// every 8 frames
if (invulnerable != 0 and (invulnerable mod 12) < 2 == 0 and flash == 0) {
	// don't draw
} else {
	if (flash != 0) {
		shader_set(flash_shader);
		u_flash = shader_get_uniform(flash_shader,"flash");
		shader_set_uniform_f(u_flash, flash);
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y - z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
	
	if (shader_current() != -1) {
		shader_reset();
	}
}







