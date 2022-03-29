/// @description Draw Healthbar

if show_healthbar {
	padding = 12.5

	health_x1 = x - sprite_midwidth - padding;
	health_x2 = x + sprite_midwidth + padding;

	health_y1 = y - sprite_midheight;
	health_y2 = health_y1 - padding;

	cur_value = (current_health / max_health) * 100;

	draw_healthbar(health_x1, health_y1, health_x2, health_y2, cur_value, c_gray, c_red, c_green, 0, false, true);
}
