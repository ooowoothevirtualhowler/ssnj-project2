/// @description General logic

event_inherited();

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

hspeed = (key_right - key_left) * movement_speed;
vspeed = (key_down - key_up) * movement_speed;

if (place_meeting(x + hspd, y, obj_wall)) {
	hspd = 0;
}
if (place_meeting(x, y + vspd, obj_wall)) {
	vspd = 0;
}

//Need to implement code for door. 

x += hspd;
y += vspd;
