/// @description Init

sprite_midwidth = sprite_width / 2;
sprite_midheight = sprite_height / 2;

current_health = max_health;

invincible = starts_invincible;

alpha_offset_base = 0.075;

function invincibility_off() {
	invincible = false;

	// Reset alpha value
	image_alpha = 1.0;
}

function talk(text, destroy_after=-1) {
	create_text(x, y - sprite_height, text, destroy_after);
}