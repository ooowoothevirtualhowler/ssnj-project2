/// @description General logic

event_inherited();
// Controls
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_attack = keyboard_check_pressed(vk_control);

// Movement
if !weapon_out {
	hspeed = (key_right - key_left) * movement_speed;
	// Check for walls (x direction)
	if place_meeting(x + hspeed + (sign(hspeed) * wall_padding), y, obj_wall) {
		hspeed = 0;
	}
	vspeed = (key_down - key_up) * movement_speed;
	// Check for walls (y direction)
	if place_meeting(x, y + vspeed + (sign(vspeed) * wall_padding), obj_wall) {
		vspeed = 0;
	}
}

// Attack
if key_attack and !weapon_out {
	
	if weapon != noone {
		weapon_out = true;
		hspeed = 0;
		vspeed = 0;
		weapon_x = x;
		weapon_y = y;
	
		if up {
			weapon_y -= weapon_offset_vertical_y;
		} else if down {
			weapon_y += weapon_offset_vertical_y;
		} else if left {
			weapon_x -= weapon_offset_horizontal_x;
			weapon_y += weapon_offset_horizontal_y;
		} else if right {
			weapon_x += weapon_offset_horizontal_x;
			weapon_y += weapon_offset_horizontal_y;
		}
	
		weapon_inst = instance_create_layer(weapon_x, weapon_y, "Instances", obj_weapon);
		alarm[1] = weapon_cooldown;
	} else {
		talk("I don't have a weapon\nso I can't attack.", 90);
	}
}
// Animation
if hspeed > 0 {
	sprite_index = spr_player_right_run;
	right = true;
	left = false;
	down = false;
	up = false;
	if weapon_out {
		sprite_index = spr_player_pickaxe_right;
	}
}	
if hspeed < 0 {
	sprite_index = spr_player_left_run;
	right = false;
	left = true;
	down = false;
	up = false;
	if weapon_out {
		sprite_index = spr_player_pickaxe_left;
	}
}
if vspeed > 0 {
	sprite_index = spr_player_down_run;
	right = false;
	left = false;
	down = true;
	up = false;
	if weapon_out {
		sprite_index = spr_player_pickaxe_down;
	}
}

if vspeed < 0 {
	sprite_index = spr_player_up_run;
	right = false;
	left = false;
	down = false;
	up = true;
	if weapon_out {
		sprite_index = spr_player_pickaxe_up;
	}
}

if vspeed == 0 && hspeed == 0 {
	// Change direction when not moving
	if up {
		sprite_index = spr_player_up;
		if weapon_out {
			sprite_index = spr_player_pickaxe_up;
		}
	} else if down {
		sprite_index = spr_player_down;
		if weapon_out {
			sprite_index = spr_player_pickaxe_down;
		}
	} else if left {
		sprite_index = spr_player_left;
		if weapon_out {
			sprite_index = spr_player_pickaxe_left;
		}
	} else if right {
		sprite_index = spr_player_right;
		if weapon_out {
			sprite_index = spr_player_pickaxe_right;
		}
	}
}