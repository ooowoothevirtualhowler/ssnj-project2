/// @description General logic

event_inherited();

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_attack = keyboard_check_pressed(vk_control);

// Movement
hspeed = (key_right - key_left) * movement_speed;
vspeed = (key_down - key_up) * movement_speed;

// Attack
if key_attack and !weapon_out {
	weapon_out = true;
	// TODO: Change weapon direction based on direction player is facing
	weapon_inst = instance_create_layer(x + weapon_offset, y, "Instances", obj_weapon);
	alarm[1] = weapon_cooldown;
}