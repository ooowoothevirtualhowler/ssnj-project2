/// @description General logic

event_inherited();

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

hspeed = (key_right - key_left) * movement_speed;
vspeed = (key_down - key_up) * movement_speed;