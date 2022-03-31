/// @description General logic

if current_health <= 0
	instance_destroy();

// Flash when invincible
if invincible and show_invincibility {
	if image_alpha >= 1 {
		alpha_offset = -alpha_offset_base;
	} else if image_alpha <= 0 {
		alpha_offset = alpha_offset_base;
	}
	image_alpha = clamp(image_alpha + alpha_offset, 0, 1);
}

// Collision test
colliding_obj = instance_place(x, y, damaging_obj);
if colliding_obj {
	if !invincible {
		invincible = true;
		current_health -= colliding_obj.attack_damage;
		alarm[0] = hit_invincibility_time;
	}
}